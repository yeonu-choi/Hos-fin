package com.kh.hospital.faq.model.vo;

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
public class Faq {
	private int fid;
	private String ftitle;
	private String fcontent;
	private Date fcreatedate;
	private Date fmodifydate;
	private String fstatus;
	private int did;
	private int cid;
	private String fwriter;
	private String dname;
	private String cname;
}
