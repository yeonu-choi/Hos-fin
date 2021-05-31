package com.kh.hospital.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hospital.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member emailCheck(String email) {
		return sqlSession.selectOne("memberMapper.emailCheck", email);
	}

	@Override
	public Member idCheck(String userId) {
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}

	@Override
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	@Override
	public Member loginMember(Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	@Override
	public void insertMemberByGoogle(Member m) {
		sqlSession.insert("memberMapper.insertMemberByGoogle", m);
	}

	@Override
	public Member selectMemberByEmail(Member m) {
		return sqlSession.selectOne("memberMapper.selectMemberByEmail", m);
	}

	@Override
	public Member phoneCheck(String p) {
		return sqlSession.selectOne("memberMapper.phoneCheck", p);
	}

}
