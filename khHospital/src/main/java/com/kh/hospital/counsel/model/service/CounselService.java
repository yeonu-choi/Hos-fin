package com.kh.hospital.counsel.model.service;

import java.util.List;

import com.kh.hospital.counsel.model.vo.Attachment;
import com.kh.hospital.counsel.model.vo.Counsel;
import com.kh.hospital.counsel.model.vo.PageInfo;
import com.kh.hospital.counsel.model.vo.Reply;
import com.kh.hospital.counsel.model.vo.Search;

public interface CounselService {

	int selectListCount(int did);

	List<Counsel> selectList(PageInfo pi, int did);

	int insertFile(Attachment f);

	int insertCounsel(Counsel c);

	Counsel selectCounsel(int cid, boolean flag);

	List<Attachment> selectFile(int cid);

	Attachment selectFileByFid(String fid);

	int updateFile(Attachment f);

	int updateCounsel(Counsel c);

	int deleteCounsel(int cid);

	int insertFileFromModify(Attachment f);

	List<Reply> insertReply(Reply r);

	List<Reply> selectReplyList(int cid);

	int deleteReply(int rid);

	int modifyCounselStatus(int cid);

	int updateReply(Reply r);
	
	int selectSearchListCount(Search s);

	List<Counsel> selectSearchList(PageInfo pi, Search s);

}
