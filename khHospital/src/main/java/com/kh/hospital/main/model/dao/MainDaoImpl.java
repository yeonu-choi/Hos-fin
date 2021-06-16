package com.kh.hospital.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hospital.main.model.vo.News;

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

}
