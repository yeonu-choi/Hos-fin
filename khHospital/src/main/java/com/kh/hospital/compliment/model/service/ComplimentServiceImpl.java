package com.kh.hospital.compliment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.hospital.common.model.vo.PageInfo;
import com.kh.hospital.compliment.model.dao.ComplimentDao;
import com.kh.hospital.compliment.model.vo.Attachment;
import com.kh.hospital.compliment.model.vo.Compliment;
import com.kh.hospital.compliment.model.vo.Good;
import com.kh.hospital.compliment.model.vo.Reply;
import com.kh.hospital.compliment.model.vo.Search;

@Service
public class ComplimentServiceImpl implements ComplimentService{
	
	@Autowired
	private ComplimentDao cDao;

	@Override
	public int selectListCount() {
		return cDao.selectListCount();
	}

	@Override
	public List<Compliment> selectList(PageInfo pi) {
		return cDao.selectList(pi);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertCompliment(Compliment c, Attachment a1, Attachment a2) {
		int result = cDao.insertCompliment(c);
		
		if(a1.getOriginName() != null) cDao.uploadFile(a1);
		if(a2.getOriginName() != null) cDao.uploadFile(a2);
	
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Compliment selectCompliment(int cno, boolean flagcno) {
		if(flagcno) cDao.updateReadCount(cno);
		return cDao.selectCompliment(cno);
	}

	@Override
	public List<Attachment> selectAttachment(int cno) {
		return cDao.selectAttachment(cno);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateCompliment(Compliment c, Attachment a1, Attachment a2, Integer cno) {
		int result = cDao.updateCompliment(c);
		
		if(a1.getOriginName() != null || a2.getOriginName() != null) cDao.deleteFile(cno);
		
		if(a1.getOriginName() != null) cDao.uploadFile2(a1);
		if(a2.getOriginName() != null) cDao.uploadFile2(a2);
		
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteCompliment(int cno) {
		cDao.deleteFile(cno);
		return cDao.deleteCompliment(cno);
	}
	
	@Override
	public int selectSearchCount(Search s) {
		return cDao.selectSearchCount(s);
	}

	@Override
	public List<Compliment> searchCompliment(Search s, PageInfo pi) {
		return cDao.searchCompliment(s, pi);
	}

	@Override
	public int goodCheck(Good g) {
		return cDao.goodCheck(g);
	}

	@Override
	public int goodUp(Good g) {
		return cDao.goodUp(g);
	}

	@Override
	public int goodDown(Good g) {
		return cDao.goodDown(g);
	}

	@Override
	public int selectGoodCount(int cno) {
		return cDao.selectGoodCount(cno);
	}

	@Override
	public List<Reply> selectReplyList(int cno) {
		return cDao.selectReplyList(cno);
	}

	@Override
	public List<Reply> insertReply(Reply r) {
		cDao.insertReply(r);
		return cDao.selectReplyList(r.getCno());
	}

	@Override
	public List<Reply> updateReply(Reply r) {
		cDao.updateReply(r);
		return cDao.selectReplyList(r.getCno());
	}
	
	@Override
	public int checkReply(Reply r) {
		return cDao.checkReply(r);
	}

	@Override
	public List<Reply> deleteReply(int rno, int cno) {
		cDao.deleteReply(rno);
		return cDao.selectReplyList(cno);
	}

	@Override
	public List<Compliment> selectTopList() {
		return cDao.selectTopList();
	}

	

	

	

	
}
