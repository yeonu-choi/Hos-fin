package com.kh.hospital.complain.model.service;

import java.util.List;

import com.kh.hospital.complain.model.vo.CB_Reply;
import com.kh.hospital.complain.model.vo.Complain;
import com.kh.hospital.complain.model.vo.PageInfo;
import com.kh.hospital.complain.model.vo.Search;
import com.kh.hospital.counsel.model.vo.Reply;

public interface ComplainService {

	int selectListCount();

	List<Complain> selectList(PageInfo pi);

	int insertComplain(Complain c);

	Complain selectComplain(int cbid, boolean flag);

	int updateComplain(Complain c);

	int deleteComplain(int cbid);

	List<Complain> searchList(Search search);

	List<CB_Reply> insertReply(CB_Reply r);

	List<CB_Reply> selectReplyList(int cbid);

	int deleteReply(int rid);

	int updateReply(CB_Reply r);

	
}
