package com.kh.hospital.main.model.dao;

import java.util.List;

import com.kh.hospital.main.model.vo.News;

public interface MainDao {

	int insertNews(News n);

	List<News> selectNewsList();

}
