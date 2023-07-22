package ht.project.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor 
@Data
public class User {


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

    // 위도 
    private float u_lat;

    // 경도 
    private float u_lng;

    // 유저 구분 
    private String user_type;
    // N = 일반유저 , A = 관리자

    // 유저 가입일자 
    private Date user_joindate;
    
    // 유저 최근 접속
    private Date user_accdate;

}
