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
    
    // 결과에 따른 CSS 클래스
    private String cssClass;

    // 결과 텍스트
    private String resultText;
    
    
    // 건강 결과 페이지 혈압 결과 판단 메소드
    public BpResults determineBpResult() {
        boolean isLowBp = bp_high < 100 || bp_low < 60;
        boolean isHighBp = bp_high >= 140 || bp_low >= 90;

        if (isHighBp) {
            return BpResults.HIGH_RISK;
        } else if (isLowBp && isHighBp) {
            return BpResults.LOW;
        } else if (isLowBp) {
            return BpResults.LOW_RISK;
        } else {
            return BpResults.NORMAL;
        }
    }

    
    // 건강 결과 페이지 혈당 결과 판단 메소드
    public BsResults determineBsResult() {
        if (bs_emp >= 126 || bs_ful >= 200) {
            return BsResults.HIGH;
        } else if (bs_emp >= 100 && bs_emp < 126 && bs_ful >= 140 && bs_ful < 200) {
            return BsResults.HIGH_RISK;
        } else if (bs_emp <= 70 || bs_ful <= 90) {
            return BsResults.LOW;
        } else {
            return BsResults.NORMAL;
        }
    }

    

    
}
