package com.kh.hospital.appointment.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hospital.appointment.model.vo.Department;
import com.kh.hospital.appointment.model.vo.Doctor;
import com.kh.hospital.appointment.model.vo.OnlineAppointment;
import com.kh.hospital.appointment.model.vo.QuickAppointment;
import com.kh.hospital.common.model.vo.PageInfo;

@Repository
public class AppointmentDaoImlp implements AppointmentDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertQuick(QuickAppointment qa) {
		return sqlSession.insert("appointmentMapper.insertQuick", qa);
	}
	
	@Override
	public int quickListCount(QuickAppointment qa) {
		return sqlSession.selectOne("appointmentMapper.quickListCount", qa);
	}

	@Override
	public List<QuickAppointment> selectQuickList(QuickAppointment qa, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
		return sqlSession.selectList("appointmentMapper.selectQuickList", qa, rowBounds);
	}

	@Override
	public int updateQuick(int qid) {
		return sqlSession.update("appointmentMapper.updateQuick", qid);
	}

	@Override
	public List<Department> selectDeptList() {
		return sqlSession.selectList("appointmentMapper.selectDeptList");
	}

	@Override
	public List<Doctor> selectDoctorList(int did) {
		return sqlSession.selectList("appointmentMapper.selectDoctorList", did);
	}
	
	@Override
	public String searchDepartment(int did) {
		return sqlSession.selectOne("appointmentMapper.searchDepartment", did);
	}

	@Override
	public Doctor selectDoctor(Doctor doctor) {
		return sqlSession.selectOne("appointmentMapper.selectDoctor", doctor);
	}

	@Override
	public List<OnlineAppointment> selectTimeList(OnlineAppointment o) {
		return sqlSession.selectList("appointmentMapper.selectTimeList", o);
	}

	@Override
	public int insertOnline(OnlineAppointment o) {
		return sqlSession.insert("appointmentMapper.insertOnline", o);
	}

	@Override
	public int onlineListCount(String userId) {
		return sqlSession.selectOne("appointmentMapper.onlineListCount", userId);
	}

	@Override
	public List<OnlineAppointment> selectOnlineList(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("appointmentMapper.selectOnlineList", userId, rowBounds);
	}

	@Override
	public int updateOnline(int aid) {
		return sqlSession.update("appointmentMapper.updateOnline", aid);
	}

	

	

}
