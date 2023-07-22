package ht.project.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor 
@Data
public class Health {

	 // 고유번호 
    private int h_num;

    // 유저 아이디 
    private String user_id;

    // 최고혈압 (수축기)
    private int bp_high;

    // 최저혈압 (확장기)
    private int bp_low;

    // 공복 혈당 
    private int bs_emp;
    
    // 식후 혈당
    private int bs_ful;

    // 입력날짜 
    private Date input_date;

    // bs, bp 구분 조건
    private String condition;
    
    
}
