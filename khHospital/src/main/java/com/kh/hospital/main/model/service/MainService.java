package com.kh.hospital.main.model.service;

import java.util.List;

import com.kh.hospital.main.model.vo.News;

public interface MainService {

	int insertNews(News n);

	List<News> selectNewsList();

}
