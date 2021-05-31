package com.kh.hospital.member.model.service;

import com.kh.hospital.member.model.vo.Member;

public interface MemberService {

	Member phoneCheck(String p);
	
	Member emaiiCheck(String email);

	Member idCheck(String userId);

	int insertMember(Member m);

	Member loginMember(Member m);

	Member loginMemberByGoogle(Member m);

	void joinMemberByGoogle(Member m);

}
