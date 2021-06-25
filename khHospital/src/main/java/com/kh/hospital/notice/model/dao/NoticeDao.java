package com.kh.hospital.notice.model.dao;

import java.util.List;

import com.kh.hospital.common.PageInfo;
import com.kh.hospital.notice.model.vo.Notice;
import com.kh.hospital.notice.model.vo.Search;

public interface NoticeDao {
	// 공지사항 목록 조회
	List<Notice> selectList(PageInfo pi);
	// 공지사항 작성
	int insertNotice(Notice n);
	// 공지사항 상세 조회
	Notice selectNotice(int nid);
	// 공지사항 수정
	int updateNotice(Notice n);
	// 공지사항 삭제
	int deleteNotice(int nid);
	// 공지사항 검색
	List<Notice> searchList(Search search, PageInfo pi);
	// 공지사항 개수
	int selectListCount();
	// 개시글 조회 카운트
	void updateReadCount(int nid);
	// 검색용 조회 카운트
	int searchListCount(Search search);
}
