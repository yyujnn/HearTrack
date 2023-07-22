package ht.project.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor 
@Data
public class Likes {
	
	// 좋아요 식별자 
    private int like_num;

    // 글번호 
    private Integer p_num;

    // 유저 아이디 
    private String user_id;

    // 좋아요 등록시간 
    private Date like_datetime;

}
