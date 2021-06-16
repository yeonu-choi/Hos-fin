package com.kh.hospital.counsel.model.vo;

import java.sql.Date;

import com.kh.hospital.member.model.vo.Member;

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
public class Reply {
	private int rid;
	private String rcontent;
	private Date rcreateDate;
	private Date rmodifyDate;
	private int cid;
	private String userId;
	private String userName;
	//private Member member;
}
