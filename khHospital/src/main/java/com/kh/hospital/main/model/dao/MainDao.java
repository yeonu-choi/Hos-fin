package com.kh.hospital.main.model.dao;

import java.util.List;

import com.kh.hospital.main.model.vo.News;
import com.kh.hospital.notice.model.vo.Notice;

public interface MainDao {

	int insertNews(News n);

	List<News> selectNewsList();

	List<Notice> selectNoticeList();

}
