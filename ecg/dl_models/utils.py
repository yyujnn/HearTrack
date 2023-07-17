import numpy as np

def preprocess_ecg(ecg:np.ndarray)->np.ndarray:
    """
    Preprocess the ECG
    band pass filter -> normalization -> reshape
        Args:
            ecg: (np.ndarray) ECG data
        Returns:
            ecg: (np.ndarray) ECG data
    """

    return ecg