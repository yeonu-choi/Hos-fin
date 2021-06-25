package com.kh.hospital.appointment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hospital.appointment.model.dao.AppointmentDao;
import com.kh.hospital.appointment.model.vo.Department;
import com.kh.hospital.appointment.model.vo.Doctor;
import com.kh.hospital.appointment.model.vo.OnlineAppointment;
import com.kh.hospital.appointment.model.vo.QuickAppointment;
import com.kh.hospital.common.model.vo.PageInfo;

@Service
public class AppointmentServiceImpl implements AppointmentService{
	
	@Autowired
	private AppointmentDao aDao;

	@Override
	public int insertQuick(QuickAppointment qa) {
		return aDao.insertQuick(qa);
	}

	@Override
	public int quickListCount(QuickAppointment qa) {
		return aDao.quickListCount(qa);
	}

	@Override
	public List<QuickAppointment> selectQuickList(QuickAppointment qa, PageInfo pi) {
		return aDao.selectQuickList(qa, pi);
	}

	@Override
	public int updateQuick(int qid) {
		return aDao.updateQuick(qid);
	}

	@Override
	public List<Department> selectDeptList() {
		return aDao.selectDeptList();
	}
	
	@Override
	public List<Doctor> selectDoctorList(int did) {
		return aDao.selectDoctorList(did);
	}
	
	@Override
	public String searchDepartment(int did) {
		return aDao.searchDepartment(did);
	}

	@Override
	public Doctor selectDoctor(Doctor doctor) {
		return aDao.selectDoctor(doctor);
	}

	@Override
	public List<OnlineAppointment> selectTimeList(OnlineAppointment o) {
		return aDao.selectTimeList(o);
	}

	@Override
	public int insertOnline(OnlineAppointment o) {
		return aDao.insertOnline(o);
	}

	@Override
	public int onlineListCount(String userId) {
		return aDao.onlineListCount(userId);
	}

	@Override
	public List<OnlineAppointment> selectOnlineList(String userId, PageInfo pi) {
		return aDao.selectOnlineList(userId, pi);
	}

	@Override
	public int updateOnline(int aid) {
		return aDao.updateOnline(aid);
	}


	

	
	
	
}
