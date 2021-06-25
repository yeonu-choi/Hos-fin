package com.kh.hospital.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hospital.appointment.model.vo.OnlineAppointment;
import com.kh.hospital.counsel.model.vo.Counsel;
import com.kh.hospital.member.model.vo.Member;
import com.kh.hospital.mypage.model.vo.PageInfo;

@Repository
public class myPageDaoImpl implements myPageDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int updateMember(Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
		
	}

	@Override
	public int deleteMember(String userId) {
		return sqlSession.delete("memberMapper.deleteMember", userId);
	}

	@Override
	public int updatePwd(Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}

	@Override
	public int selectListCount(String userId) {
		return sqlSession.selectOne("mypageMapper.selectListCount", userId);
	}

	@Override
	public List<Counsel> selectList(PageInfo pi, String userId) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getCbLimit(),pi.getCbLimit());
		return sqlSession.selectList("mypageMapper.selectList", userId, rowBounds);
	}

	@Override
	public int selectoListCount(String userId) {
		return sqlSession.selectOne("mypageMapper.selectoListCount", userId);
	}

	@Override
	public List<OnlineAppointment> selectoList(PageInfo pi, String userId) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getCbLimit(),pi.getCbLimit());
		return sqlSession.selectList("mypageMapper.selectoList", userId, rowBounds);
	}

	@Override
	public int selectOnline(int aid) {
		return sqlSession.update("mypageMapper.updateOnline", aid);
	}


}
