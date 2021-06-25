package com.kh.hospital.counsel.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hospital.counsel.model.dao.CounselDao;
import com.kh.hospital.counsel.model.vo.Attachment;
import com.kh.hospital.counsel.model.vo.Counsel;
import com.kh.hospital.counsel.model.vo.PageInfo;
import com.kh.hospital.counsel.model.vo.Reply;
import com.kh.hospital.counsel.model.vo.Search;

@Service
public class CounselServiceImpl implements CounselService{
	@Autowired
	private CounselDao cDao;

	@Override
	public int selectListCount(int did) {
		return cDao.selectListCount(did);
	}

	@Override
	public List<Counsel> selectList(PageInfo pi, int did) {
		return cDao.selectList(pi, did);
	}

	@Override
	public int insertFile(Attachment f) {
		return cDao.insertFile(f);
	}

	@Override
	public int insertCounsel(Counsel c) {
		return cDao.insertCounsel(c);
	}

	@Override
	public Counsel selectCounsel(int cid, boolean flag) {
		if(!flag) cDao.updateReadCount(cid);
		return cDao.selectCounsel(cid);
	}

	@Override
	public List<Attachment> selectFile(int cid) {
		return cDao.selectFile(cid);
	}

	@Override
	public Attachment selectFileByFid(String fid) {
		return cDao.selectFileByFid(fid);
	}

	@Override
	public int updateFile(Attachment f) {
		return cDao.updateFile(f);
	}

	@Override
	public int updateCounsel(Counsel c) {
		return cDao.updateCounsel(c);
	}

	@Override
	public int deleteCounsel(int cid) {
		return cDao.deleteCounsel(cid);
	}

	@Override
	public int insertFileFromModify(Attachment f) {
		return cDao.insertFileFromModify(f);
	}

	@Override
	public List<Reply> selectReplyList(int cid) {
		return cDao.selectReplyList(cid);
	}
	
	@Override
	public List<Reply> insertReply(Reply r) {
		cDao.insertReply(r);
		return cDao.selectReplyList(r.getCid());
	}

	@Override
	public int deleteReply(int rid) {
		return cDao.deleteReply(rid);
	}

	@Override
	public int modifyCounselStatus(int cid) {
		return cDao.modifyCounselStatus(cid);
	}

	@Override
	public int updateReply(Reply r) {
		return cDao.modifyReply(r);
	}

	@Override
	public int selectSearchListCount(Search s) {
		return cDao.selectSearchListCount(s);
	}

	@Override
	public List<Counsel> selectSearchList(PageInfo pi, Search s) {
		return cDao.selectSearchList(pi,s);
	}

	@Override
	public int modifyCounselStatus2(int cid) {
		return cDao.modifyCounselStatus2(cid);
	}

	@Override
	public int selectReplyList2(int cid) {
		return 0;
	}

}
