package com.kh.hospital.notice.model.vo;

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
public class Notice {
	private int nid;
	private String ntitle;
	private String ncontent;
	private Date ncreatedate;
	private Date nmodifydate;
	private String nstatus;
	private int ncount;
	private String nwriter;
	private String nfile;
}
