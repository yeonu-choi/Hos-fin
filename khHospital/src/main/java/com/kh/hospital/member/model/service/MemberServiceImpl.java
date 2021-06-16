package com.kh.hospital.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hospital.member.model.dao.MemberDao;
import com.kh.hospital.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;

	@Override
	public Member emaiiCheck(String email) {
		return mDao.emailCheck(email);
	}

	@Override
	public Member idCheck(String userId) {
		return mDao.idCheck(userId);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}

	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(m);
	}

	@Override
	public Member loginMemberByGoogle(Member m) {
		Member returnVO = null;
		try {
			returnVO = mDao.selectMemberByEmail(m);
		} catch (Exception e) {
			e.printStackTrace();
			returnVO = null;
		}
		return returnVO;
	}

	@Override
	public void joinMemberByGoogle(Member m) {
		mDao.insertMemberByGoogle(m);
	}

	@Override
	public Member phoneCheck(String p) {
		return mDao.phoneCheck(p);
	}

	@Override
	public Member loginMemberByKakao(Member m) {
		Member rm = null;
		try {
			rm = mDao.selectMemberByEmail(m);
		} catch (Exception e) {
			e.printStackTrace();
			rm = null;
		}
		return rm;
	}

	@Override
	public void joinMemberByKakao(Member m) {
		mDao.insertMemberByKakao(m);
	}

	@Override
	public Member loginMemberByNaver(Member m) {
		Member rm = null;
		try {
			rm = mDao.selectMemberByEmail(m);
		} catch (Exception e) {
			e.printStackTrace();
			rm = null;
		}
		return rm;
	}

	@Override
	public void joinMemberByNaver(Member m) {
		mDao.insertMemberByNaver(m);
	}

	@Override
	public Member selectMemberForIdChk(Member m) {
		return mDao.selectMemberByEmail(m);
	}

	@Override
	public int updateTempPw(Member m) {
		return mDao.updateTempPw(m);
	}

	@Override
	public Member selectMemberForTempPw(Member m) {
		return mDao.selectMemberByEmail(m);
	}

	@Override
	public int resetPwdByPhone(Member m) { 
		return mDao.resetPwdByPhone(m);
	}
}
