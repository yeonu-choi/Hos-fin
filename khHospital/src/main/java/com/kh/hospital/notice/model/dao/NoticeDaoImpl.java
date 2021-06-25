package com.kh.hospital.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hospital.common.PageInfo;
import com.kh.hospital.notice.model.vo.Notice;
import com.kh.hospital.notice.model.vo.Search;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Notice> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	@Override
	public int insertNotice(Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	@Override
	public Notice selectNotice(int nid) {
		return sqlSession.selectOne("noticeMapper.selectNotice", nid);
	}

	@Override
	public int updateNotice(Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	@Override
	public int deleteNotice(int nid) {
		return sqlSession.delete("noticeMapper.deleteNotice", nid);
	}

	@Override
	public List<Notice> searchList(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("noticeMapper.searchList", search, rowBounds);
	}

	@Override
	public int selectListCount() {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

	@Override
	public void updateReadCount(int nid) {
		sqlSession.update("noticeMapper.updateReadCount", nid);
		
	}

	@Override
	public int searchListCount(Search search) {
		return sqlSession.selectOne("noticeMapper.searchListCount", search);
	}

	
}
