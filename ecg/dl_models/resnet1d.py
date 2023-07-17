import torch
import torch.nn as nn

class SimpleResNet1D(nn.Module):
    def __init__(self, in_channels, num_classes):
        super(SimpleResNet1D, self).__init__()

        self.conv1 = nn.Conv1d(in_channels, 64, kernel_size=3, stride=1, padding=1)
        self.relu = nn.ReLU()
        self.conv2 = nn.Conv1d(64, 128, kernel_size=3, stride=1, padding=1)
        self.fc = nn.Linear(128, num_classes)
        self.downsample = nn.Conv1d(in_channels, 128, kernel_size=1, stride=1)


    def forward(self, x):
        out = self.conv1(x)
        out = self.relu(out)
        out = self.conv2(out)
        out = self.relu(out)

        # Residual Connection
        out += self.downsample(x)

        out = torch.mean(out, dim=2)  # Global Average Pooling
        out = self.fc(out)

        return out
