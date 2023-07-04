package ht.project.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor 
@Data
public class Hospital {

	// 병원순번 
    private int h_seq;

    // 관리자 아이디 
    private String admin_id;

    // 병원이름 
    private String h_name;

    // 병원주소 
    private String h_location;

    // 병원전화번호 
    private String h_tel;

    // 위도 
    private float h_lat;

    // 경도 
    private float h_lng;

}
