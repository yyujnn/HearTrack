from typing import Dict, Union

import torch
import torch.nn as nn
import torch.nn.functional as F
import numpy as np

import glob

class ResNet1d(nn.Module):
    def __init__(self, in_channels, num_classes, kernel_size=16, stride=1, padding=0, dilation=1, groups=1, bias=True):
        super(ResNet1d, self).__init__()
        self.conv1 = nn.Conv1d(in_channels, in_channels, kernel_size=kernel_size, stride=stride, padding=padding, dilation=dilation, groups=groups, bias=bias)
        self.bn1 = nn.BatchNorm1d(in_channels)
        self.relu = nn.ReLU(inplace=True)
        self.conv2 = nn.Conv1d(in_channels, num_classes, kernel_size=kernel_size, stride=stride, padding=padding, dilation=dilation, groups=groups, bias=bias)
        self.bn2 = nn.BatchNorm1d(num_classes)
        self.downsample = nn.Sequential(
            nn.Conv1d(in_channels, num_classes, kernel_size=1, stride=1, bias=False),
            nn.BatchNorm1d(num_classes)
        )
        self.stride = stride

    def forward(self, x):
        residual = x
        out = self.conv1(x)
        out = self.bn1(out)
        # out = self.relu(out)
        out = F.relu(out)
        out = self.conv2(out)
        out = self.bn2(out)
        out += self.downsample(residual)
        # out = self.relu(out)
        out = F.relu(out)
        return out    # (batch_size, num_classes)

class UNet(nn.Module):  # 내부 구조 아직 안 짰음
    def __init__(self, in_channels, num_classes):
        super(UNet, self).__init__()
        self.seq_len = 2500  # 10s * 250Hz
    def forward(self, x:np.ndarray):
        return    # (batch_size, seq_len, num_classes)


class ECG_Infer_Module():
    def __init__(self, resnet_path, unet_path):
        self.resnet = ResNet1d()
        self.unet = UNet()
        # self.load_model(resnet_path, unet_path)

    def load_model(self, resnet_path, unet_path):  # need to set device
        self.resnet.load_state_dict(torch.load(resnet_path))
        self.unet.load_state_dict(torch.load(unet_path))
        self.resnet.eval()
        self.unet.eval()

    def load_ecg(self, ecg_path:str)->np.ndarray:
        """
        Load ECG from the given path
            Args:
                ecg_path: (str) path to the ECG file
            Returns:
                ecg: (np.ndarray) ECG data
        """

        return

    def preprocess_ecg(self, ecg:np.ndarray)->np.ndarray:
        """
        Preprocess the ECG
            Args:
                ecg: (np.ndarray) ECG data
            Returns:
                ecg: (np.ndarray) ECG data
        """

        return


    def post_process_resnet(self, resnet_output:np.ndarray)->Dict[str, bool]:
        """
        Post processing of the output of the ResNet model
            Args:
                resnet_output: output of the ResNet model,
            Returns:
                resnet_output: (dict) with
                    keys: (str)
                    values: (bool) if True, then the corresponding class is detected in the ECG
        """

        return


    def post_process_unet(self, unet_ouput:np.ndarray)->Dict[str, float]:
        """
        Post processing of the output of the UNet model
            Args:
                unet_output: (np.ndarray) output of the UNet model
            Returns:
                unet_output: (dict) with
                    keys: (str) ["hr", "pr", "qrs", "qt", "qtc"]
                    values: (float) the corresponding value of the key in the ECG
        """

        return


    def infer(self, x:str)->Dict[str, Union[bool, str]]:
        """
        Inference of the ECG
            Args:
                x: (str) path to the ECG file  XXX xml 로 할 것인지 pickle 로 할 것인지
            Returns:
                out_dict: (dict) with
                    keys: (str) ["hr", "pr", "qrs", "qt", "qtc", "af", "sr", "sb", "gsvt"]
                    values: (bool) if True, then the corresponding class is detected in the ECG
        """
        # get ecg path
        # load ecg
        # preprocess ecg -> make ecg as np.ndarray
        # resnet_output = self.resnet(ecg)
        # unet_output = self.unet(ecg)
        # resnet_output = self.post_process_resnet(resnet_output)
        # unet_output = self.post_process_unet(unet_output)
        # out_dict = {**resnet_output, **unet_output}

        # fixed value
        out_dict = {
            "hr": 89,
            "pr": 140,
            "qrs": 74,
            "qt": 330,
            "qtc": 400,
            "af": False,
            "sr": True,
            "sb": False,
            "gsvt": False
        }
        return out_dict


if __name__ == "__main__":
    ecg_pkl_list = glob.glob("data/ecg_pkl/*.pkl")
    ecg_pkl_list.sort()

    ecg_infer_module = ECG_Infer_Module("", "")  # no module yet

    for ecg in ecg_xml_list:
        ecg_infer_module.infer(ecg)