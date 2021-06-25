package com.kh.hospital.complain.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hospital.complain.model.vo.CB_Reply;
import com.kh.hospital.complain.model.vo.Complain;
import com.kh.hospital.complain.model.vo.PageInfo;
import com.kh.hospital.complain.model.vo.Search;

@Repository
public class ComplainDaoImpl implements ComplainDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return sqlSession.selectOne("complainMapper.selectListCount");
	}

	@Override
	public List<Complain> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getCbLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getCbLimit());
		
		return sqlSession.selectList("complainMapper.selectList", null, rowBounds);
	}

	@Override
	public int insertComplain(Complain c) {
		return sqlSession.insert("complainMapper.insertComplain", c);
	}

	@Override
	public void updateReadCount(int cbid) {
		sqlSession.update("complainMapper.updateReadCount", cbid);
		
	}

	@Override
	public Complain seletComplain(int cbid) {
		return sqlSession.selectOne("complainMapper.selectComplain", cbid);
	}

	@Override
	public int updateComplain(Complain c) {
		return sqlSession.update("complainMapper.updateComplain", c);
	}

	@Override
	public int deleteComplain(int cbid) {
		return sqlSession.update("complainMapper.deleteComplain", cbid);
	}

	@Override
	public List<Complain> searchList(Search search) {
		return sqlSession.selectList("complainMapper.searchList", search);
	}

	@Override
	public List<CB_Reply> selectReplyList(int cbid) {
		return sqlSession.selectList("complainMapper.selectReplyList", cbid);
	}

	@Override
	public void insertReply(CB_Reply r) {
		sqlSession.insert("complainMapper.insertReply", r);
	}

	@Override
	public int deleteReply(int rid) {
		return sqlSession.update("complainMapper.deleteReply", rid);
	}

	@Override
	public int updateReply(CB_Reply r) {
		return sqlSession.update("complainMapper.updateReply", r);
	}

}
