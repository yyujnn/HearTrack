from typing import List, Tuple, Dict, Any, Optional
import logging
import os
import numpy as np
import pandas as pd
import pickle as pkl
from torch.utils.data import Dataset


logger = logging.getLogger(__name__)


def load_dict(filename_):
    with open(filename_, 'rb') as f:
        ret_di = pkl.load(f)
    return ret_di


# Data loader class define
class ECGDataset(Dataset):
    def __init__(self, waveform_dir:str, index_df_path:str, task_list:List[str]=[]):
        """
        Args:
            waveform_dir: (str) directory path for waveform
            index_df_path: (str) path of index pd.DataFrame, df should have columns: FILE_NAME, SAMPLE_RATE
            task_list = (list) list of tasks to use
        """
        df = pd.read_pickle(index_df_path)
        self.df = df

        filenames = df["FILE_NAME"].tolist()
        self.filenames = filenames
        self.filenames_x = [os.path.join(waveform_dir, f) for f in self.filenames]
        self.lead = ['I', 'II', 'III', 'AVR', 'AVL', 'AVF', 'V1', 'V2', 'V3', 'V4', 'V5', 'V6']
        self.task = task_list
        self.Y_np_arr = self.get_label()  # numpy array including sampling ratio
        self.sample_rates = self.df["SAMPLE_RATE"].values

    def __len__(self):
        return len(self.filenames)


    def get_label(self):
        selected_df = self.df[self.task]
        return selected_df.values


    def __getitem__(self, idx):  # get one data point
        label = self.Y_np_arr[idx]
        sample_rate = int(self.sample_rates[idx])  # resample 을 위해서
        ecg_dict = load_dict(self.filenames_x[idx])  # target ecg dictionary

        # read values of predefined leads
        data = [ecg_dict[lead] for lead in self.lead]
        ecg = np.stack(data)  # np.ndarray (lead number, data length)

        # (Filtering) -> Standardization

        data = {'input': ecg, 'label': label}
        if self.mode != 'train':
            fname = self.filenames[idx]
            data['fname'] = fname
        return data