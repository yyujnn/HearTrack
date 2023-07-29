from typing import Dict, Union
import pickle
import torch
import torch.nn as nn
import torch.nn.functional as F
import numpy as np
from collections import OrderedDict

import glob

from resnet1d import SimpleResNet1D
from unet1d import SimpleUNet1D

def load_ecg_pickle(ecg_path:str)->np.ndarray:
    """
    Load ECG from the given path
        Args:
            ecg_path: (str) path to the ECG file
        Returns:
            ecg: (np.ndarray) ECG data with shape (num_leads, seq_len)
    """
    with open(ecg_path, "rb") as f:
        ecg = pickle.load(f)
    # stack ecg data
    out = []
    for key in ['I', 'II', 'III', 'AVR', 'AVL', 'AVF', 'V1', 'V2', 'V3', 'V4', 'V5', 'V6']:
        out.append(ecg[key])
    ecg = np.stack(out, axis=0)
    return ecg


class ECG_Infer_Module():
    """
    Consider input is one ECG data, not batch
    """
    def __init__(self, resnet_path, unet_path, num_leads=12, out_classes=["af", "sr", "sb", "gsvt"]):
        self.num_leads = num_leads
        self.out_classes = out_classes
        self.num_classes = len(out_classes)
        self.resnet = SimpleResNet1D(in_channels=num_leads, num_classes=self.num_classes)
        self.unet = SimpleUNet1D(in_channels=num_leads, out_channels=self.num_classes)
        self.load_model(resnet_path, unet_path)

    def modify_checkpoint(self, checkpoint):
        """
        Modify the checkpoint for the model
        """
        temp_dict = OrderedDict()
        for old_key in checkpoint:
            new_key = old_key[7:]
            temp_dict[new_key] = checkpoint[old_key]
        return temp_dict


    def load_model(self, resnet_path, unet_path, trained_from_gpu=True):  # XXX need to set device
        """
        Load the trained model using cpu
        model 은 gpu에서 학습했다고 가정
        """
        device = torch.device('cpu')
        if resnet_path:
            checkpoint = torch.load(resnet_path, map_location=device )
            if trained_from_gpu:
                checkpoint = self.modify_checkpoint(checkpoint)
            self.resnet.load_state_dict(checkpoint)
        if unet_path:
            checkpoint = torch.load(unet_path, map_location=device )
            if trained_from_gpu:
                checkpoint = self.modify_checkpoint(checkpoint)
            self.unet.load_state_dict(torch.load(unet_path))
        self.resnet.to('cpu')
        self.resnet.eval()
        self.unet.to('cpu')
        self.unet.eval()


    def post_process_resnet(self, resnet_output:np.ndarray)->Dict[str, bool]:
        """
        Post processing of the output of the ResNet model
            Args:
                resnet_output: output of the ResNet model with shpae (num_classes,)
            Returns:
                resnet_output: (dict) with
                    keys: (str)
                    values: (bool) if True, then the corresponding class is detected in the ECG
        """
        # torch argmax
        idx = torch.argmax(resnet_output)
        out_dict = {}
        for i, class_name in enumerate(self.out_classes):
            if idx == i:
                out_dict[class_name] = True
            else:
                out_dict[class_name] = False
        return out_dict


    def post_process_unet(self, unet_ouput:np.ndarray)->Dict[str, float]:
        """
        XXX not implemented
        Post processing of the output of the UNet model
            Args:
                unet_output: (np.ndarray) output of the UNet model
            Returns:
                unet_output: (dict) with
                    keys: (str) ["hr", "pr", "qrs", "qt", "qtc"]
                    values: (float) the corresponding value of the key in the ECG
        """
        ### XXX randomly return the value
        out_dict = {}
        mean_dict = {
            "hr": 89,
            "pr": 140,
            "qrs": 74,
            "qt": 330,
            "qtc": 400
        }
        for class_name in mean_dict:
            out_dict[class_name] = np.random.normal(loc=mean_dict[class_name])
        return out_dict


    def infer(self, ecg:np.ndarray)->Dict[str, Union[bool, str]]:
        """
        Inference of the ECG
            Args:
                ecg: (np.ndarray) ECG lead value with shape (12, 5000)
            Returns:
                out_dict: (dict) with
                    keys: (str) ["hr", "pr", "qrs", "qt", "qtc", "af", "sr", "sb", "gsvt"]
                    values: (bool) if True, then the corresponding class is detected in the ECG
        """
        # from ecg np.ndarray
        # ecg = self.preprocess_ecg(ecg)
        ###  XXX 현재로서는 ecg preprocessing이 안 들어가 있습니다.
        ecg = torch.Tensor(ecg).unsqueeze(0)  # to torch.Tensor with shape (1, 12, 5000)
        resnet_output = self.resnet(ecg)  # resnet outout with shape (1, num_classes)
        # unet_output = self.unet(ecg)  # unet output
        # resnet post processing, get the class name
        resnet_output = self.post_process_resnet(resnet_output)
        unet_output = self.post_process_unet(None)
        out_dict = {**resnet_output, **unet_output}

        return out_dict


if __name__ == "__main__":
    ecg_pkl_list = glob.glob("../data/ecg_pkl/*.pkl")  # sample ecg data
    ecg_pkl_list.sort()


    ecg_infer_module = ECG_Infer_Module("", "")  # no module yet

    for ecg in ecg_pkl_list:
        ecg = load_ecg_pickle(ecg)  # 서버에서 ecg를 받아왔다고 가정, 정확히 어떤 형태로 받는지는 상관 없음, dictionary 든 array 든
        # ecg: np.ndarray with shape (12, 5000)
        out = ecg_infer_module.infer(ecg) # return dictionary
        print(out)  # 이 값을 다시 서버에 보내야 함