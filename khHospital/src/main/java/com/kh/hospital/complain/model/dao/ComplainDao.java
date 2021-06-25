package com.kh.hospital.complain.model.dao;

import java.util.List;

import com.kh.hospital.complain.model.vo.CB_Reply;
import com.kh.hospital.complain.model.vo.Complain;
import com.kh.hospital.complain.model.vo.PageInfo;
import com.kh.hospital.complain.model.vo.Search;
import com.kh.hospital.counsel.model.vo.Reply;

public interface ComplainDao {

	int selectListCount();

	List<Complain> selectList(PageInfo pi);

	int insertComplain(Complain c);

	void updateReadCount(int cbid);

	Complain seletComplain(int cbid);

	int updateComplain(Complain c);

	int deleteComplain(int cbid);

	List<Complain> searchList(Search search);

	List<CB_Reply> selectReplyList(int cbid);
	
	void insertReply(CB_Reply r);

	int deleteReply(int rid);

	int updateReply(CB_Reply r);

}
