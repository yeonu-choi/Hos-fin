package com.kh.hospital.compliment.model.service;

import java.util.List;

import com.kh.hospital.common.model.vo.PageInfo;
import com.kh.hospital.compliment.model.vo.Attachment;
import com.kh.hospital.compliment.model.vo.Compliment;
import com.kh.hospital.compliment.model.vo.Good;
import com.kh.hospital.compliment.model.vo.Reply;
import com.kh.hospital.compliment.model.vo.Search;

public interface ComplimentService {

	int selectListCount();

	List<Compliment> selectList(PageInfo pi);

	int insertCompliment(Compliment c ,Attachment a1, Attachment a2);

	Compliment selectCompliment(int cno, boolean flagcno);

	List<Attachment> selectAttachment(int cno);
	
	int updateCompliment(Compliment c, Attachment a1, Attachment a2, Integer cno);

	int deleteCompliment(int cno);

	int selectSearchCount(Search s);
	
	List<Compliment> searchCompliment(Search s, PageInfo pi);

	int goodCheck(Good g);

	int goodUp(Good g);

	int goodDown(Good g);
	
	int selectGoodCount(int cno);

	List<Reply> selectReplyList(int cno);

	List<Reply> insertReply(Reply r);

	List<Reply> updateReply(Reply r);

	int checkReply(Reply r);

	List<Reply> deleteReply(int rno, int cno);

	List<Compliment> selectTopList();


	

}
