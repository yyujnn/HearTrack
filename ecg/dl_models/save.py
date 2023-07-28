def save(orign_file,user_id,out,start,image_name) : 
    
    import mysql.connector
    insert_value = []

    config = {
        'user': 'cgi_2_230701_3',
        'password': 'smhrd3',
        'host': 'project-db-cgi.smhrd.com',
        'port': 3307,
        'database': 'cgi_2_230701_3',
        'raise_on_warnings': True
    }

    cnx = mysql.connector.connect(**config)

    # 파일 경로 들고 오기 위한 SELECT문     
    cursor = cnx.cursor()
    select_query = "SELECT * FROM t_att  WHERE d_code = 'E' ORDER BY input_date DESC LIMIT 1; "
    cursor.execute(select_query)

    # insert문에 쓸 파일번호 , 유저 아이디 , 파일 경로(이거는 위에서 뽑아서 쓸 필요 없나?) 추출
    for row in cursor :
        insert_value.append(orign_file)
        insert_value.append(user_id)
        insert_value.append(image_name)

    # insert문에 쓸 ECG 분석 결과값 추출
    for key, value in out.items():
        if isinstance(value, float):
            rounded_value = round(value, 0)
            insert_value.append(rounded_value)
        elif key in ['af', 'sr', 'sb', 'gsvt']:
            if value:
                insert_value.append(key)
                
    infer_time = round(cnt_time(start),3)
    insert_value.append(infer_time)

    # 일차원 리스트 이차원 리스트로 변환 --> 2차원 리스트로 바꿔줘야 아래의 executemany 실행 가능 
    insert_value = [insert_value]

    insert_query = "INSERT INTO t_ecg(file_name, user_id, results, hr, pr, qrs, qt, qtc, infer_time, image_name) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    cursor.executemany(insert_query, insert_value)
    cnx.commit()

    cnx.close()
    
    return "성공"
