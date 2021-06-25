package com.kh.hospital.counsel.model.dao;

import java.util.List;

import com.kh.hospital.counsel.model.vo.Attachment;
import com.kh.hospital.counsel.model.vo.Counsel;
import com.kh.hospital.counsel.model.vo.PageInfo;
import com.kh.hospital.counsel.model.vo.Reply;
import com.kh.hospital.counsel.model.vo.Search;

public interface CounselDao {

	int selectListCount(int did);

	List<Counsel> selectList(PageInfo pi, int did);

	int insertFile(Attachment f);

	int insertCounsel(Counsel c);

	void updateReadCount(int cid);

	Counsel selectCounsel(int cid);

	List<Attachment> selectFile(int cid);

	Attachment selectFileByFid(String fid);

	int updateFile(Attachment f);

	int updateCounsel(Counsel c);

	int deleteCounsel(int cid);

	int insertFileFromModify(Attachment f);

	List<Reply> selectReplyList(int cid);

	void insertReply(Reply r);

	int deleteReply(int rid);

	int modifyCounselStatus(int cid);

	int modifyReply(Reply r);

	int selectSearchListCount(Search s);

	List<Counsel> selectSearchList(PageInfo pi, Search s);

	int modifyCounselStatus2(int cid);

	int selectReplyList2(int cid);

}
