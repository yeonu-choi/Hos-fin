package com.kh.hospital.appointment.model.vo;

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
public class OnlineAppointment {
	private Integer aid;
	private String userId;
	private String userName;
	private Integer did;
	private String deptName;
	private String dname;
	private String phone;
	private String email;
	private Date adate;
	private String atime;
	private String astatus;
	private Date edate;
}
