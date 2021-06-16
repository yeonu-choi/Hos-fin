package com.kh.hospital.counsel.model.vo;

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
public class Attachment {
	private int fid;
	private int cid;
	private int cno;
	private int cbid;
	private String originName;
	private String changeName;
}
