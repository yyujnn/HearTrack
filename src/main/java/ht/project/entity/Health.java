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

    // 최고혈압 
    private int bp_high;

    // 최저혈압 
    private int bp_row;

    // 혈당 
    private int bs;

    // 체중 
    private float weight;

    // 신장 
    private float height;

    // BMI 
    private float bmi;

    // 입력날짜 
    private Date input_date;
}
