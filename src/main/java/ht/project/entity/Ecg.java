package ht.project.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor 
@Data
public class Ecg {
	
	// ECG 구분번호 
	private int ecg_num;	
	
    // 유저 아이디 
    private String user_id;

    // 파일번호 
    private int f_num;

    // 심박수 
    private float hr;

    // P파 
    private float pr;

    // QRS 
    private float qrs;

    // QT 
    private float qt;

    // QTc 
    private float qtc;

    // 검사결과 
    private String results;

    // 입력날짜 
    private Date input_date;


}
