package com.kh.hospital.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hospital.main.model.dao.MainDao;
import com.kh.hospital.main.model.vo.News;
import com.kh.hospital.notice.model.vo.Notice;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDao nDao;
	
	@Override
	public int insertNews(News n) {
		return nDao.insertNews(n);
	}

	@Override
	public List<News> selectNewsList() {
		return nDao.selectNewsList();
	}

	@Override
	public List<Notice> selectNoticeList() {
		return nDao.selectNoticeList();
	}

}
