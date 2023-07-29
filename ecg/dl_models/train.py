import os
from datetime import datetime
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import DataLoader

from tqdm import tqdm
from resnet1d import SimpleResNet1D
from dataset import ECGDataset
from matplotlib import pyplot as plt


class Trainer:
    def __init__(self, model, train_dataset, val_dataset, loss_fn, optimizer, device, model_save_dir):
        self.model = model.to(device)
        self.train_dataset = train_dataset
        self.val_dataset = val_dataset
        self.loss_fn = loss_fn
        self.optimizer = optimizer
        self.device = device
        if torch.cuda.is_available():
            # torch.backends.cudnn.benchmark = True
            self.use_cuda = True
        else:
            self.use_cuda = False
        # make directory for saving model model_save_dir/yyyymmdd_hhmmss
        current_time = datetime.now().strftime("%Y%m%d_%H%M%S")
        self.model_save_dir = os.path.join(model_save_dir, f"{current_time}")
        os.makedirs(self.model_save_dir)


    def train(self, num_epochs, batch_size):
        train_loader = DataLoader(self.train_dataset, batch_size=batch_size, shuffle=True)
        val_loader = DataLoader(self.val_dataset, batch_size=batch_size)

        prev_val_loss = float('inf')  # at first, set previous val loss to infinity

        train_loss_list = []
        val_loss_list = []

        for epoch in range(num_epochs):
            # Training
            self.model.train()
            train_loss = 0.0  # train loss for this epoch
            local_progress = tqdm(train_loader, total=len(train_loader))

            for i, batch in enumerate(local_progress):  # train all mini batches
                model.train()
                input_batch = batch['input'].type(torch.FloatTensor)
                label_batch = batch['label'].type(torch.LongTensor)
                label_batch = label_batch.view(-1)

                if self.use_cuda:
                    input_batch = input_batch.cuda(non_blocking=True)
                    label_batch = label_batch.cuda(non_blocking=True)

                self.optimizer.zero_grad()

                # Forward pass
                outputs = self.model(input_batch)

                # Compute loss
                loss = self.loss_fn(outputs, label_batch)
                train_loss += loss.item()

                # Backward pass and optimization
                loss.backward()
                self.optimizer.step()

            avg_train_loss = train_loss / len(train_loader)
            train_loss_list.append(avg_train_loss)

            # Evaluation
            self.model.eval()
            val_loss = 0.0
            num_correct = 0
            num_samples = 0

            with torch.no_grad():

                for j, batch in enumerate(val_loader):
                    val_input_batch = batch['input'].type(torch.FloatTensor)
                    val_label_batch = batch['label'].type(torch.LongTensor)
                    label_batch = label_batch.view(-1)

                    if self.use_cuda:  # use GPU
                        val_input_batch = input_batch.cuda(non_blocking=True)
                        val_label_batch = label_batch.cuda(non_blocking=True)
                    # Forward pass
                    val_outputs = self.model(val_input_batch)

                    # Compute loss
                    loss = self.loss_fn(val_outputs, val_label_batch)
                    val_loss += loss.item()

                    # Count accuracy
                    _, predicted = val_outputs.max(1)
                    num_correct += (predicted == val_label_batch).sum().item()
                    num_samples += val_label_batch.size(0)

            avg_val_loss = val_loss / len(val_loader)
            val_loss_list.append(avg_val_loss)
            accuracy = num_correct / num_samples

            # save best model
            if avg_val_loss < prev_val_loss:
                torch.save(self.model.state_dict(), os.path.join(self.model_save_dir,f"best_model.pt"))
                prev_val_loss = avg_val_loss

            # Print training progress
            print(f"Epoch {epoch+1}/{num_epochs}: Train Loss = {avg_train_loss:.4f}, Val Loss = {avg_val_loss:.4f}, Accuracy = {accuracy:.4f}")

        print("Training finished.")
        # save last model
        torch.save(self.model.state_dict(), os.path.join(self.model_save_dir,f"last_model_epoch{epoch}.pt"))
        return train_loss_list, val_loss_list





if __name__ == "__main__":
    # set configs
    waveform_dir = "/data4/yeongyeonna/public_dataset/2002_shaoxing_chapman/waveform_old"  # XXX your waveform directory path here
    train_index_path = "/data4/yeongyeonna/public_dataset/3002_shaoxing_chapman_split/train_df_merged.pkl"  # XXX your train index path here
    val_index_path = "/data4/yeongyeonna/public_dataset/3002_shaoxing_chapman_split/val_df_merged.pkl"  # XXX your validation index path here
    test_index_path = "/data4/yeongyeonna/public_dataset/3002_shaoxing_chapman_split/test_df_merged.pkl"  # XXX your test index path here
    task_list = ["MERGED_RHYTHM"]
    model_save_dir = "../saved_models"
    # set model, dataset, loss function, optimizer, device
    model = SimpleResNet1D(12, 4)
    train_dataset = ECGDataset(waveform_dir=waveform_dir, index_df_path=train_index_path, task_list=task_list)
    val_dataset = ECGDataset(waveform_dir=waveform_dir, index_df_path=val_index_path, task_list=task_list)
    test_dataset = ECGDataset(waveform_dir=waveform_dir, index_df_path=test_index_path, task_list=task_list)
    loss_fn = nn.CrossEntropyLoss()  # for multi-class classification
    optimizer = optim.Adam(model.parameters(), lr=0.001)
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    # train
    trainer = Trainer(model, train_dataset, val_dataset, loss_fn, optimizer, device, model_save_dir)
    train_loss_list, val_loss_list = trainer.train(num_epochs=100, batch_size=512)
    plt.plot(train_loss_list, label="train loss(Cross Entropy)")
    plt.plot(val_loss_list, label="val loss(Cross Entropy)")
    plt.legend()
    plt.savefig(os.path.join(model_save_dir, "loss.png"))