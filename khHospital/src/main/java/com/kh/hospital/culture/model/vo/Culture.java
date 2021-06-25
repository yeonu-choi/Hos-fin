package com.kh.hospital.culture.model.vo;

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
public class Culture {

	private int cid;
	private String ctitle;
	private String csubtitle;
	private String ccontent;
	private String originalFileName;
	private String renameFileName;
	private String cstatus;
	
}

