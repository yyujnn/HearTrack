import torch
import torch.nn as nn

class SimpleUNet1D(nn.Module):
    def __init__(self, in_channels, out_channels):
        super(SimpleUNet1D, self).__init__()

        self.down_conv1 = self.double_conv(in_channels, 64)
        self.down_conv2 = self.double_conv(64, 128)
        self.up_conv1 = self.double_conv(192, 64)
        self.up_conv2 = self.double_conv(96, out_channels)

    def double_conv(self, in_channels, out_channels):
        return nn.Sequential(
            nn.Conv1d(in_channels, out_channels, kernel_size=3, padding=1),
            nn.ReLU(inplace=True),
            nn.Conv1d(out_channels, out_channels, kernel_size=3, padding=1),
            nn.ReLU(inplace=True)
        )

    def forward(self, x):
        # Downsample
        down1 = self.down_conv1(x)
        pool1 = nn.functional.max_pool1d(down1, kernel_size=2, stride=2)

        down2 = self.down_conv2(pool1)
        pool2 = nn.functional.max_pool1d(down2, kernel_size=2, stride=2)

        # Upsample
        up1 = nn.functional.interpolate(down2, scale_factor=2, mode='linear', align_corners=True)
        up1 = torch.cat([up1, down1], dim=1)
        up1 = self.up_conv1(up1)

        up2 = nn.functional.interpolate(up1, scale_factor=2, mode='linear', align_corners=True)
        up2 = torch.cat([up2, x], dim=1)
        up2 = self.up_conv2(up2)

        return up2
