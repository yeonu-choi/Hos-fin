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
public class Compliment {
	private Integer cno;
	private String ctitle;
	private String ccontent;
	private Integer ccount;
	private Date ccreateDate;
	private Date cmodifyDate;
	private String cstatus;
	private String userId;
	private String userName;
	private Integer heart;
}
