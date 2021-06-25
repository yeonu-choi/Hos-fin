package com.kh.hospital.faq.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hospital.common.PageInfo;
import com.kh.hospital.faq.model.dao.FaqDao;
import com.kh.hospital.faq.model.vo.Faq;
import com.kh.hospital.faq.model.vo.Search;

@Service
public class FaqServiceImpl implements FaqService{
	@Autowired
	public FaqDao fDao;
	
	@Override
	public int selectListCount() {
		return fDao.selectListCount();
	}

	@Override
	public List<Faq> selectList(PageInfo pi) {
		return fDao.selectList(pi);
	}

	@Override
	public int insertFaq(Faq f) {
		return fDao.insertFaq(f);
	}

	@Override
	public Faq selectFaq(int fid) {
		return fDao.selectFaq(fid);
	}

	@Override
	public List<Faq> selectAdList(PageInfo pi) {
		return fDao.selectAdList(pi);
	}

	@Override
	public int updateFaq(Faq f) {
		return fDao.updateFaq(f);
	}

	@Override
	public int deleteFaq(int fid) {
		return fDao.deleteFaq(fid);
	}

	@Override
	public List<Faq> searchList(Search search) {
		return fDao.searchList(search);
	}

	@Override
	public List<Faq> searchList2(Search search, PageInfo pi) {
		return fDao.searchList2(search, pi);
	}

	@Override
	public int searchListCount(Search search) {
		return fDao.searchListCount(search);
	}

	
	

}
