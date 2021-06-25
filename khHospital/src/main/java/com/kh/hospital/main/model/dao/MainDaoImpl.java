package com.kh.hospital.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hospital.main.model.vo.News;
import com.kh.hospital.notice.model.vo.Notice;

@Repository
public class MainDaoImpl implements MainDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertNews(News n) {
		return sqlSession.insert("mainMapper.insertNews", n);
	}

	@Override
	public List<News> selectNewsList() {
		return sqlSession.selectList("mainMapper.selectNewsList");
	}

	@Override
	public List<Notice> selectNoticeList() {
		return sqlSession.selectList("mainMapper.selectNoticeList");
	}

}
