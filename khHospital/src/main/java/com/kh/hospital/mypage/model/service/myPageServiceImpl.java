package com.kh.hospital.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hospital.mypage.model.vo.PageInfo;
import com.kh.hospital.appointment.model.vo.OnlineAppointment;
import com.kh.hospital.counsel.model.vo.Counsel;
import com.kh.hospital.member.model.vo.Member;
import com.kh.hospital.mypage.model.dao.myPageDao;

@Service
public class myPageServiceImpl implements myPageService {

	@Autowired
	private myPageDao myDao;
	
	@Override
	public int updateMember(Member m) {
		return myDao.updateMember(m);
	}

	@Override
	public int deleteMember(String userId) {
		return myDao.deleteMember(userId);
	}

	@Override
	public int pwdUpdate(Member m) {
		return myDao.updatePwd(m);
	}

	@Override
	public int selectListCount(String userId) {
		return myDao.selectListCount(userId);
	}

	@Override
	public List<Counsel> selectList(PageInfo pi, String userId) {
		return myDao.selectList(pi, userId);
	}

	@Override
	public int selectoListCount(String userId) {
		return myDao.selectoListCount(userId);
	}

	@Override
	public List<OnlineAppointment> selectoList(PageInfo pi, String userId) {
		return myDao.selectoList(pi, userId);
	}

	@Override
	public int updateOnline(int aid) {
		return myDao.selectOnline(aid);
	}


}
