package com.kh.hospital.compliment.model.vo;

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
public class Reply {
	private Integer rno;
	private String rwriter;
	private String rwriterName;
	private String rcontent;
	private Date rcreateDate;
	private Date rmodifyDate;
	private String rstatus;
	private Integer cno;
	private Integer rno2;
	
	
	/* private Integer level;
	 * private Integer rrno; private String rrwriter; private String rrcontent;
	 * private String rrstatus; private Integer rrno2;
	 */
	
}
