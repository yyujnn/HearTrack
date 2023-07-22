package ht.project.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor 
@Data
public class Comment {
	
	// 댓글번호 
    private int c_num;

    // 원글번호 
    private int p_num;

    // 유저 아이디 
    private String user_id;

    // 내용 
    private String content;

    // 작성날짜 
    private Date input_date;
    
    private String user_name;

}
