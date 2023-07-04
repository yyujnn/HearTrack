package ht.project.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor 
@Data
public class Att {
	// 파일번호 
    private int f_num;

    // 유저 아이디 
    private String user_id;

    // 구분코드 
    private String d_code;

    // 파일 원래 이름 
    private String f_originname;

    // 서버에 저장된 이름 
    private String f_savename;

    // 파일크기 
    private float f_size;

    // 파일확장자 
    private String f_type;

    // 등록날짜 
    private Date input_date;

}
