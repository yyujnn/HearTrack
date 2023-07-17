import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import DataLoader

class Trainer:
    def __init__(self, model, train_dataset, val_dataset, loss_fn, optimizer, device):
        self.model = model.to(device)
        self.train_dataset = train_dataset
        self.val_dataset = val_dataset
        self.loss_fn = loss_fn
        self.optimizer = optimizer
        self.device = device

    def train(self, num_epochs, batch_size):
        train_loader = DataLoader(self.train_dataset, batch_size=batch_size, shuffle=True)
        val_loader = DataLoader(self.val_dataset, batch_size=batch_size)

        for epoch in range(num_epochs):
            # Training
            self.model.train()
            train_loss = 0.0

            for batch_inputs, batch_labels in train_loader:
                batch_inputs = batch_inputs.to(self.device)
                batch_labels = batch_labels.to(self.device)

                self.optimizer.zero_grad()

                # Forward pass
                outputs = self.model(batch_inputs)

                # Compute loss
                loss = self.loss_fn(outputs, batch_labels)
                train_loss += loss.item()

                # Backward pass and optimization
                loss.backward()
                self.optimizer.step()

            avg_train_loss = train_loss / len(train_loader)

            # Evaluation
            self.model.eval()
            val_loss = 0.0
            num_correct = 0
            num_samples = 0

            with torch.no_grad():
                for val_inputs, val_labels in val_loader:
                    val_inputs = val_inputs.to(self.device)
                    val_labels = val_labels.to(self.device)

                    # Forward pass
                    val_outputs = self.model(val_inputs)

                    # Compute loss
                    loss = self.loss_fn(val_outputs, val_labels)
                    val_loss += loss.item()

                    # Count accuracy
                    _, predicted = val_outputs.max(1)
                    num_correct += (predicted == val_labels).sum().item()
                    num_samples += val_labels.size(0)

            avg_val_loss = val_loss / len(val_loader)
            accuracy = num_correct / num_samples

            # Print training progress
            print(f"Epoch {epoch+1}/{num_epochs}: Train Loss = {avg_train_loss:.4f}, Val Loss = {avg_val_loss:.4f}, Accuracy = {accuracy:.4f}")

        print("Training finished.")

# 예시 사용법
# 1. 모델, 데이터셋, 손실 함수, 옵티마이저 등을 정의하고 초기화합니다.
model = YourModel()
train_dataset = YourTrainDataset()
val_dataset = YourValidationDataset()
loss_fn = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# 2. Trainer 객체를 생성하고 train 메서드를 호출하여 학습을 수행합니다.
trainer = Trainer(model, train_dataset, val_dataset, loss_fn, optimizer, device)
trainer.train(num_epochs=10, batch_size=32)
