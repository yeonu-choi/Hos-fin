package com.kh.hospital.notice.model.service;

import java.util.List;

import com.kh.hospital.common.PageInfo;
import com.kh.hospital.notice.model.vo.Notice;
import com.kh.hospital.notice.model.vo.Search;

public interface NoticeService {
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
	// 조회수 증가
	Notice selectNotice(int nid, boolean flag);
	// 검색용 페이지 리스트
	int searchListCount(Search search);
	
}
