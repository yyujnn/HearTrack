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
    private int hr;

    // P파 
    private int pr;

    // QRS 
    private int qrs;

    // QT 
    private int qt;

    // QTc 
    private int qtc;

    // 검사결과 
    private String results;

    // 입력날짜 
    private Date input_date;
    
    // 결과 텍스트
    private String resultsText;
    
    // CSS 클래스 이름
    private String cssClass;
    
    // 이미지 이름
    private String image_name;

}
