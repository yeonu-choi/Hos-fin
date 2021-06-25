package com.kh.hospital.complain.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hospital.complain.model.dao.ComplainDao;
import com.kh.hospital.complain.model.vo.CB_Reply;
import com.kh.hospital.complain.model.vo.Complain;
import com.kh.hospital.complain.model.vo.PageInfo;
import com.kh.hospital.complain.model.vo.Search;

@Service
public class ComplainServiceImpl implements ComplainService{
	@Autowired
	private ComplainDao cDao;
	
	@Override
	public int selectListCount() {
		return cDao.selectListCount();
	}

	@Override
	public List<Complain> selectList(PageInfo pi) {
		return cDao.selectList(pi);
	}

	@Override
	public int insertComplain(Complain c) {
		return cDao.insertComplain(c);
	}

	@Override
	public Complain selectComplain(int cbid, boolean flag) {
		if(flag) cDao.updateReadCount(cbid);
		
		return cDao.seletComplain(cbid);
	}

	@Override
	public int updateComplain(Complain c) {
		return cDao.updateComplain(c);
	}

	@Override
	public int deleteComplain(int cbid) {
		return cDao.deleteComplain(cbid);
	}

	@Override
	public List<Complain> searchList(Search search) {
		return cDao.searchList(search);
	}

	@Override
	public List<CB_Reply> insertReply(CB_Reply r) {
		cDao.insertReply(r);
		return cDao.selectReplyList(r.getCbid());
		
	}

	@Override
	public List<CB_Reply> selectReplyList(int cbid) {
		return cDao.selectReplyList(cbid);
	}

	@Override
	public int deleteReply(int rid) {
		return cDao.deleteReply(rid);
	}

	@Override
	public int updateReply(CB_Reply r) {
		return cDao.updateReply(r);
	}


}
