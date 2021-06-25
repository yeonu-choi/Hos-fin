package com.kh.hospital.compliment.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hospital.common.model.vo.PageInfo;
import com.kh.hospital.compliment.model.vo.Attachment;
import com.kh.hospital.compliment.model.vo.Compliment;
import com.kh.hospital.compliment.model.vo.Good;
import com.kh.hospital.compliment.model.vo.Reply;
import com.kh.hospital.compliment.model.vo.Search;

@Repository
public class ComplimentDaoImpl implements ComplimentDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return sqlSession.selectOne("complimentMapper.selectListCount");
	}

	@Override
	public List<Compliment> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("complimentMapper.selectList", null, rowBounds);
	}
	
	@Override
	public int insertCompliment(Compliment c) {
		return sqlSession.insert("complimentMapper.insertCompliment", c);
	}

	@Override
	public void uploadFile(Attachment a) {
		sqlSession.insert("complimentMapper.uploadFile", a);
	}

	@Override
	public void updateReadCount(int cno) {
		sqlSession.update("complimentMapper.updateReadCount", cno);
	}
	
	@Override
	public Compliment selectCompliment(int cno) {
		return sqlSession.selectOne("complimentMapper.selectCompoliment", cno);
	}
	
	@Override
	public List<Attachment> selectAttachment(int cno) {
		return sqlSession.selectList("complimentMapper.selectAttachment", cno);
	}

	@Override
	public int updateCompliment(Compliment c) {
		return sqlSession.update("complimentMapper.updateCompliment", c);
	}
	
	@Override
	public void deleteFile(Integer cno) {
		sqlSession.delete("complimentMapper.deleteFile", cno);
	}

	@Override
	public void uploadFile2(Attachment a) {	// 동적쿼리 IF 이용하면 uploadFile 한개로 가능할까?
		sqlSession.insert("complimentMapper.uploadFile2", a);
	}

	@Override
	public int deleteCompliment(int cno) {
		return sqlSession.update("complimentMapper.deleteCompliment", cno);
	}
	
	@Override
	public int selectSearchCount(Search s) {
		return sqlSession.selectOne("complimentMapper.selectSearchCount", s);
	}

	@Override
	public List<Compliment> searchCompliment(Search s, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("complimentMapper.searchCompliment", s, rowBounds);
	}

	@Override
	public int goodCheck(Good g) {
		return sqlSession.selectOne("complimentMapper.goodCheck", g);
	}

	@Override
	public int goodUp(Good g) {
		return sqlSession.insert("complimentMapper.goodUp", g);
	}

	@Override
	public int goodDown(Good g) {
		return sqlSession.delete("complimentMapper.goodDown", g);
	}
	
	@Override
	public int selectGoodCount(int cno) {
		return sqlSession.selectOne("complimentMapper.selectGoodCount", cno);
	}

	@Override
	public List<Reply> selectReplyList(int cno) {
		return sqlSession.selectList("complimentMapper.selectReplyList", cno);
	}

	/*@Override
	public List<Reply> selectReReplyList(int cno) {
		return sqlSession.selectList("complimentMapper.selectReReplyList", cno);
	}*/

	@Override
	public int insertReply(Reply r) {
		return sqlSession.insert("complimentMapper.insertReply", r);
	}

	@Override
	public int updateReply(Reply r) {
		return sqlSession.update("complimentMapper.updateReply", r);
	}

	@Override
	public int checkReply(Reply r) {
		return sqlSession.selectOne("complimentMapper.checkReply", r);
	}
	
	@Override
	public int deleteReply(int rno) {
		return sqlSession.update("complimentMapper.deleteReply", rno);
	}

	@Override
	public List<Compliment> selectTopList() {
		return sqlSession.selectList("complimentMapper.selectTopList");
	}


	


	

	

	
}
