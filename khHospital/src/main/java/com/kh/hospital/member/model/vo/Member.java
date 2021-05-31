package com.kh.hospital.member.model.vo;

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
public class Member {
	private String userId;
	private String userPwd;
	private String UserName;
	private String gender;
	private String phone;
	private Date enroll_date;
	private String sns_status;
	private String birth;
	private String grade;
	private String DayOff;
	private Integer did;
	private String email;
}
