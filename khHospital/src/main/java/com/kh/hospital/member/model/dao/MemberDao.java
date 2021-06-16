package com.kh.hospital.member.model.dao;

import com.kh.hospital.member.model.vo.Member;

public interface MemberDao {

	Member emailCheck(String email);

	Member idCheck(String userId);

	int insertMember(Member m);

	Member loginMember(Member m);

	void insertMemberByGoogle(Member m);

	Member selectMemberByEmail(Member m);

	Member phoneCheck(String p);

	void insertMemberByKakao(Member m);

	void insertMemberByNaver(Member m);

	int updateTempPw(Member m);

	int resetPwdByPhone(Member m);

}
