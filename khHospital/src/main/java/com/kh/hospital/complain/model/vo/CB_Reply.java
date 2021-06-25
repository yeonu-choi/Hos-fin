package com.kh.hospital.complain.model.vo;

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
public class CB_Reply {

	private Integer rno;
	private String rcontent;
	private String rwriter;
	private Date rcreateDate;
	private Date rmodifyDate;
	private String rstatus;
	private Integer cbid;
	private Integer rno2;
	
	/*
	 * RNO	NUMBER
RCONTENT	VARCHAR2(400 BYTE)
RWRITER	VARCHAR2(15 BYTE)
R_CREATE_DATE	DATE
R_MODIFY_DATE	DATE
R_STATUS	VARCHAR2(1 BYTE)
CBID	NUMBER
RNO2	NUMBER
	 */
}
