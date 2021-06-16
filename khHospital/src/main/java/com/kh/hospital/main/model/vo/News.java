package com.kh.hospital.main.model.vo;

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
public class News {
	private int nno;
	private String ntitle;
	private String nlink;
	private Date ncreateDate;
}
