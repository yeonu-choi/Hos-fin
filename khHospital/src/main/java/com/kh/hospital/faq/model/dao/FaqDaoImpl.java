package com.kh.hospital.faq.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hospital.common.PageInfo;
import com.kh.hospital.faq.model.vo.Faq;
import com.kh.hospital.faq.model.vo.Search;

@Repository
public class FaqDaoImpl implements FaqDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return sqlSession.selectOne("faqMapper.selectListCount");
	}

	@Override
	public List<Faq> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("faqMapper.selectList", null, rowBounds);
	}

	@Override
	public int insertFaq(Faq f) {
		return sqlSession.insert("faqMapper.insertFaq", f);
	}

	@Override
	public Faq selectFaq(int fid) {
		return sqlSession.selectOne("faqMapper.selectFaq", fid);
	}

	@Override
	public List<Faq> selectAdList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("faqMapper.selectAdList", null, rowBounds);
	}

	@Override
	public int updateFaq(Faq f) {
		return sqlSession.update("faqMapper.updateFaq", f);
	}

	@Override
	public int deleteFaq(int fid) {
		return sqlSession.delete("faqMapper.deleteFaq", fid);
	}

	@Override
	public List<Faq> searchList(Search search) {
		return sqlSession.selectList("faqMapper.searchList", search);
	}

	@Override
	public List<Faq> searchList2(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("faqMapper.searchList2", search, rowBounds);
	}

	@Override
	public int searchListCount(Search search) {
		return sqlSession.selectOne("faqMapper.searchListCount", search);
	}

	

}
