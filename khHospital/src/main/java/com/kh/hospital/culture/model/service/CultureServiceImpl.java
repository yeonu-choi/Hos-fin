package com.kh.hospital.culture.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hospital.culture.model.dao.CultureDao;
import com.kh.hospital.culture.model.vo.Culture;


@Service
public class CultureServiceImpl implements CultureService {
	@Autowired
	private CultureDao cDao;
	
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return cDao.selectListCount();
	}
	
	@Override
	public List<Culture> selectList() {
		// TODO Auto-generated method stub
		return  cDao.selectList();
	}

	@Override
	public int insertCulture(Culture c) {
		// TODO Auto-generated method stub
		return cDao.insertCulture(c);
	}

	@Override
	public Culture selectCulture(int cid) {
		// TODO Auto-generated method stub
		return cDao.selectCulture(cid);
	}

	@Override
	public int updateCulture(Culture c) {
		// TODO Auto-generated method stub
		return cDao.updateCulture(c);
	}

	@Override
	public int deleteCulture(int cid) {
		// TODO Auto-generated method stub
		return cDao.deleteCulture(cid);
	}

	@Override
	public List<Culture> moreList(int stepIndex) {
		// TODO Auto-generated method stub
		return cDao.morelist(stepIndex);
	}

	

	
}
