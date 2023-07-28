package ht.project.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor 
@Data
public class Community {
	
	// 글번호 
    private Integer p_num;

    // 유저 객체
    private String user_id;

    // 파일번호 
    private int f_num;

    // 내용 
    private String content;

    // 카테고리 
    private String category;

    // 작성날짜 
    private Date input_date;

    // 좋아요수 
    private Integer likes;
    
    // 사용자 정보
    private User user;
    
    // 사용자 카드 정보
    private Integer ecg_num;
    private Integer h_num;
    private Ecg ecg;
    private Health health; 

}
