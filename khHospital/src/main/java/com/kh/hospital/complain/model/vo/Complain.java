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
public class Complain {
	
	private int cbid;
	private String cbtitle;
	private String cbcontent;
	private Date cbcreateDate;
	private Date cbmodifyDate;
	private int cbcount;
	private String cbstatus;
	private String userid;
	private String cbwriter;
	private String originalfileName;
	private String renamefileName;
	
	
	/*
	 * CBID	NUMBER
CBTITLE	VARCHAR2(100 BYTE)
CBCONTENT	VARCHAR2(4000 BYTE)
CB_CREATE_DATE	DATE
CB_MODIFY_DATE	DATE
CB_COUNT	NUMBER
CB_STATUS	VARCHAR2(1 BYTE)
USERID	VARCHAR2(15 BYTE)*/

}
