package com.project.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor 
@Data
public class Community {
	
	private int comu_num;
	private String title;
	private String content;
	private Date write_date;
	private String category;
	private String users_fk_id;

}
