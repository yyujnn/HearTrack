def cnt_time(start):
        # 끝날 때의 현재 시간을 측정합니다.
        end_time = time.time()

        # 함수가 실행되는데 걸린 시간을 계산합니다.
        infer_time = end_time - start

        # 계산된 시간을 반환합니다.
        print(infer_time)
        return infer_time
