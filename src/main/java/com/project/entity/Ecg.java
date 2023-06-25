package com.project.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor 
@Data
public class Ecg {
	
	private int ecg_num;
	private int bpm;
	private int pr;
	private int qrs;
	private int qt;
	private int qtc;
	private String users_fk_id;
	private int health_fk_id;

}
