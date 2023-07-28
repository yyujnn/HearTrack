def graph(orign_file, image_name) :

    import pickle
    import pandas as pd
    import numpy as np
    import matplotlib.pyplot as plt
    
    ecg_path = f'../../Desktop/user_ecg/{orign_file}'

    with open(ecg_path, 'rb') as f:
        ecg_data = pickle.load(f)

    time_data = np.arange(len(ecg_data['I'])) / 500.0
    # 그래프 크기 조절
    plt.figure(figsize=(12,8))
    colors_3 = ['black', 'black', 'black', 'black']

    # 바탕색과 grid 추가
    plt.gca().set_facecolor('mistyrose')
    plt.grid(color='lightcoral', linestyle='-', linewidth=0.5)

    # 리드 이름과 색상 설정
    lead_names = ['I', 'AVR', 'V1', 'V4']
    colors = ['red', 'green', 'blue', 'purple']
    start_time = 0
    for i, lead_name in enumerate(lead_names):
        lead_data = ecg_data[lead_name] + 8000
        end_time = start_time + 2.5
        color_idx = i % 4
        plt.plot(time_data[(time_data >= start_time) & (time_data <= end_time)], lead_data[(time_data >= start_time) & (time_data <= end_time)], color=colors[color_idx], label=lead_name)
        plt.text(start_time + 0.1, 9000, lead_name, fontsize=12, color=colors_3[color_idx], ha='center', va='bottom')  # lead_name 표시 (고정된 y값인 4000 사용)
        start_time = end_time  # 다음 리드의 시작 시간으로 갱신


    # 리드 이름과 색상 설정
    lead_names_1 = ['II', 'AVL', 'V2', 'V5']
    colors_1 = ['red', 'green', 'blue', 'purple']
    start_time = 0
    for i, lead_name in enumerate(lead_names_1):
        lead_data = ecg_data[lead_name] + 5000
        end_time = start_time + 2.5
        color_idx = i % 4
        plt.plot(time_data[(time_data >= start_time) & (time_data <= end_time)], lead_data[(time_data >= start_time) & (time_data <= end_time)], color=colors_1[color_idx], label=lead_name)
        plt.text(start_time + 0.1, 6200, lead_name, fontsize=12, color=colors_3[color_idx], ha='center', va='bottom')  # lead_name 표시 (고정된 y값인 4000 사용)
        start_time = end_time  # 다음 리드의 시작 시간으로 갱신   


    # 첫 번째 그래프 그리기
    lead_names_2 = ['III', 'AVF', 'V3', 'V6']
    colors_2 = ['red', 'green', 'blue', 'purple']
    start_time = 0
    for i, lead_name in enumerate(lead_names_2):
        lead_data = ecg_data[lead_name] + 2500  # y축 값에 2500을 더하기
        end_time = start_time + 2.5
        color_idx = i % 4
        plt.plot(time_data[(time_data >= start_time) & (time_data <= end_time)], lead_data[(time_data >= start_time) & (time_data <= end_time)], color=colors_2[color_idx], label=lead_name)
        plt.text(start_time + 0.1, 4000, lead_name, fontsize=12, color=colors_3[color_idx], ha='center', va='bottom')  # lead_name 표시 (고정된 y값인 4000 사용)
        start_time = end_time

    # 두 번째 그래프 그리기
    lead_names_3 = ['II', 'II', 'II', 'II']
    colors_3 = ['black', 'black', 'black', 'black']
    start_time = 0
    for i, lead_name in enumerate(lead_names_3):
        lead_data = ecg_data[lead_name]
        end_time = start_time + 2.5
        color_idx = i % 4
        plt.plot(time_data[(time_data >= start_time) & (time_data <= end_time)], lead_data[(time_data >= start_time) & (time_data <= end_time)], color=colors_3[color_idx], label=lead_name)
        plt.text(start_time + 0.1, 1000, lead_name, fontsize=12, color=colors_3[color_idx], ha='center', va='bottom')  # lead_name 표시 (고정된 y값인 4000 사용)
        start_time = end_time

    plt.title('12-Lead ECG', color='blue')
    plt.gca().set_yticklabels([])
    plt.xlim(0, 10)  # x 축 범위 지정

    #file_path = f"../../Desktop/user_ecg/{file_name}.png"
    file_path = f"../../../../eGovFrame-4.0.0/workspace.edu/Final_HearTrack/Final_Project/src/main/webapp/resources/images/graph/{image_name}.png"
    plt.savefig(file_path, dpi=300, bbox_inches='tight')

    return "그래프 저장 완료"
