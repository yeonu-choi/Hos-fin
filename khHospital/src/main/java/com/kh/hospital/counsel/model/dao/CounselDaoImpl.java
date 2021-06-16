package com.kh.hospital.counsel.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hospital.counsel.model.vo.Attachment;
import com.kh.hospital.counsel.model.vo.Counsel;
import com.kh.hospital.counsel.model.vo.PageInfo;
import com.kh.hospital.counsel.model.vo.Reply;
import com.kh.hospital.counsel.model.vo.Search;

@Repository
public class CounselDaoImpl implements CounselDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount(int did) {
		return sqlSession.selectOne("counselMapper.selectListCount", did);
	}

	@Override
	public List<Counsel> selectList(PageInfo pi, int did) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("counselMapper.selectList", did, rowBounds);
	}

	@Override
	public int insertFile(Attachment f) {
		return sqlSession.insert("counselMapper.insertFile", f);
	}

	@Override
	public int insertCounsel(Counsel c) {
		return sqlSession.insert("counselMapper.insertCounsel", c);
	}

	@Override
	public void updateReadCount(int cid) {
		sqlSession.update("counselMapper.updateReadCount", cid);
	}

	@Override
	public Counsel selectCounsel(int cid) {
		return sqlSession.selectOne("counselMapper.selectCounsel", cid);
	}

	@Override
	public List<Attachment> selectFile(int cid) {
		return sqlSession.selectList("counselMapper.selectFile", cid);
	}

	@Override
	public Attachment selectFileByFid(String fid) {
		return sqlSession.selectOne("counselMapper.selectFileByFid", fid);
	}

	@Override
	public int updateFile(Attachment f) {
		return sqlSession.update("counselMapper.updateFile", f);
	}

	@Override
	public int updateCounsel(Counsel c) {
		return sqlSession.update("counselMapper.updateCounsel", c);
	}

	@Override
	public int deleteCounsel(int cid) {
		return sqlSession.delete("counselMapper.deleteCounsel", cid);
	}

	@Override
	public int insertFileFromModify(Attachment f) {
		return sqlSession.insert("counselMapper.insertFileFromModify", f);
	}

	@Override
	public List<Reply> selectReplyList(int cid) {
		return sqlSession.selectList("counselMapper.selectReplyList", cid);
	}

	@Override
	public void insertReply(Reply r) {
		sqlSession.insert("counselMapper.insertReply", r);
	}

	@Override
	public int deleteReply(int rid) {
		return sqlSession.delete("counselMapper.deleteReply", rid);
	}

	@Override
	public int modifyCounselStatus(int cid) {
		return sqlSession.update("counselMapper.modifyCounselStatus", cid);
	}

	@Override
	public int modifyReply(Reply r) {
		return sqlSession.update("counselMapper.modifyReply", r);
	}

	@Override
	public int selectSearchListCount(Search s) {
		return sqlSession.selectOne("counselMapper.selectSearchListCount", s);
	}

	@Override
	public List<Counsel> selectSearchList(PageInfo pi, Search s) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("counselMapper.selectSearchList", s, rowBounds);
	}

}
