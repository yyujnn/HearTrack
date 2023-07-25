package ht.project.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Admin {

	// AdminUser페이지에 들어가는 엔티티

	// 유저 아이디
	private String user_id;

	// 유저 비밀번호
	private String user_pw;

	// 유저 이름
	private String user_name;

	// 유저 나이
	private int user_age;

	// 유저 성별
	private String user_gender;

	// 유저 구분
	private String user_type;
	// N = 일반유저 , A = 관리자

	// 유저 가입일자
	private Date user_joindate;

	// 유저 접속일자
	private Date user_accdate;

	// 유저가 이용한 ECG횟수
	private int ecg_cnt;

	// 유저가 올린 게시글 개수
	private int comm_cnt;

	// 전체 이용자의 ECG서비스 횟수
	private int useAll;

	// ECG이용자 숫자
	private int useUser;

	// 인당 평균 검사 횟수
	private String useAvg;

	// 측정 결과
	private String results;

	// 측정 결과 count
	private int resCnt;

	// 건강 정보 Date
	private Date input_date;

	// 혈압 측정 횟수
	private int bp_cnt;

	// 혈당 측정 횟수
	private int bs_cnt;

	// 분석에 걸린 최소시간
	private float min_time;

	// 분석에 걸린 최대시간
	private float max_time;

	// 분석에 걸린 평균시간
	private float avg_time;

}
