package com.kh.hospital.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.hospital.common.PageInfo;
import com.kh.hospital.notice.model.dao.NoticeDao;
import com.kh.hospital.notice.model.vo.Notice;
import com.kh.hospital.notice.model.vo.Search;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao nDao;
	
	@Override
	public List<Notice> selectList(PageInfo pi) {
		return nDao.selectList(pi);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(n);
	}

	@Override
	public Notice selectNotice(int nid) {
		return nDao.selectNotice(nid);
	}

	@Override
	public int updateNotice(Notice n) {
		return nDao.updateNotice(n);
	}

	@Override
	public int deleteNotice(int nid) {
		return nDao.deleteNotice(nid);
	}

	@Override
	public List<Notice> searchList(Search search, PageInfo pi) {
		return nDao.searchList(search, pi);
	}

	@Override
	public int selectListCount() {
		return nDao.selectListCount();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Notice selectNotice(int nid, boolean flag) {
		if(flag) nDao.updateReadCount(nid);
		return nDao.selectNotice(nid);
	}

	@Override
	public int searchListCount(Search search) {
		return nDao.searchListCount(search);
	}

	
}
