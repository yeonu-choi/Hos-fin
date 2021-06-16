package com.kh.hospital.counsel.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Counsel {
	private int cid;
	private int did;
	private String ctitle;
	private String c_content;
	private int c_count;
	private Date c_createDate;
	private Date c_ModifyDate;
	private String cstatus;
	private String userId;
}
