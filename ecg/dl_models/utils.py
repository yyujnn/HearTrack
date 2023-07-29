import numpy as np
from scipy.signal import butter, resample, sosfiltfilt

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


def filtering(signal):
    """
    Arguments:
        signal : ECG data, shape = (N. of leads, ECG signal length)
    Returns:
        Filtered ECG data, shape = (N. of leads,  ECG signal length)
    """
    filters = []
    filters.append(butter(5, 0.67, btype='highpass', fs=500, output='sos'))
    filters.append(butter(5, 40, btype='lowpass', fs=500, output='sos'))

    filtered_signal = signal
    for sos_filter in filters:
        filtered_signal = sosfiltfilt(sos_filter, filtered_signal)
    return filtered_signal

def standardization(signal: np.ndarray):
    """
    Arguments:
        signal : ECG data, shape = (N. of leads, ECG signal length)
    Returns:
        Standardized ECG data, shape = (N. of leads,  ECG signal length)
    """
    mean = np.mean(signal)
    std = np.std(signal)+1e-07

    return (signal-mean)/std