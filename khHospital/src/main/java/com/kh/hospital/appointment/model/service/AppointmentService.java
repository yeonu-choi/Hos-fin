package com.kh.hospital.appointment.model.service;

import java.util.List;

import com.kh.hospital.appointment.model.vo.Department;
import com.kh.hospital.appointment.model.vo.Doctor;
import com.kh.hospital.appointment.model.vo.OnlineAppointment;
import com.kh.hospital.appointment.model.vo.QuickAppointment;
import com.kh.hospital.common.model.vo.PageInfo;

public interface AppointmentService {

	int insertQuick(QuickAppointment qa);

	int quickListCount(QuickAppointment qa);

	List<QuickAppointment> selectQuickList(QuickAppointment qa, PageInfo pi);

	int updateQuick(int qid);

	List<Department> selectDeptList();
	
	List<Doctor> selectDoctorList(int did);

	String searchDepartment(int did);
	
	Doctor selectDoctor(Doctor doctor);

	List<OnlineAppointment> selectTimeList(OnlineAppointment o);

	int insertOnline(OnlineAppointment o);

	int onlineListCount(String userId);

	List<OnlineAppointment> selectOnlineList(String userId, PageInfo pi);

	int updateOnline(int aid);


	

}
