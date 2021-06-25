package com.kh.hospital.compliment.model.vo;

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
public class Attachment{
	private Integer fid;
	private Integer cid;
	private Integer cno;
	private Integer cbid;
	private String originName;
	private String changeName;
}
