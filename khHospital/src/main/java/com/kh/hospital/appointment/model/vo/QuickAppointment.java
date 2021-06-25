package com.kh.hospital.appointment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class QuickAppointment {

	private int qid;
	private String qname;
	private String qphone;
	private String qtime;
	private String qetc;
	private String qstatus;
	private Date edate;
	
}
