package com.kh.hospital.faq.model.dao;

import java.util.List;

import com.kh.hospital.common.PageInfo;
import com.kh.hospital.faq.model.vo.Faq;
import com.kh.hospital.faq.model.vo.Search;

public interface FaqDao {
	// faq 게시글 개수
	int selectListCount();
	// faq 게시글 리스트 
	List<Faq> selectList(PageInfo pi);
	// faq 작성
	int insertFaq(Faq f);
	// faq 조회
	Faq selectFaq(int fid);
	// faq 관리자 리스트 조회
	List<Faq> selectAdList(PageInfo pi);
	// faq 수정
	int updateFaq(Faq f);
	// faq 삭제
	int deleteFaq(int fid);
	// faq 검색
	List<Faq> searchList(Search search);
	
	List<Faq> searchList2(Search search, PageInfo pi);
	// faq searchList 개수 
	int searchListCount(Search search);
	
	
}
