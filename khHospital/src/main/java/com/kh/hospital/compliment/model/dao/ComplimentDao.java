package com.kh.hospital.compliment.model.dao;

import java.util.List;

import com.kh.hospital.common.model.vo.PageInfo;
import com.kh.hospital.compliment.model.vo.Attachment;
import com.kh.hospital.compliment.model.vo.Compliment;
import com.kh.hospital.compliment.model.vo.Good;
import com.kh.hospital.compliment.model.vo.Reply;
import com.kh.hospital.compliment.model.vo.Search;

public interface ComplimentDao {

	int selectListCount();

	List<Compliment> selectList(PageInfo pi);
	
	int insertCompliment(Compliment c);
	
	void uploadFile(Attachment a);
	
	void updateReadCount(int cno);

	Compliment selectCompliment(int cno);

	List<Attachment> selectAttachment(int cno);

	int updateCompliment(Compliment c);

	void deleteFile(Integer cno);

	void uploadFile2(Attachment a);

	int deleteCompliment(int cno);

	int selectSearchCount(Search s);
	
	List<Compliment> searchCompliment(Search s, PageInfo pi);

	int goodCheck(Good g);

	int goodUp(Good g);

	int goodDown(Good g);

	int selectGoodCount(int cno);

	List<Reply> selectReplyList(int cno);

	//List<Reply> selectReReplyList(int cno);

	int insertReply(Reply r);

	int updateReply(Reply r);

	int deleteReply(int rno);

	int checkReply(Reply r);

	List<Compliment> selectTopList();

	

	

}
