package com.kh.hospital.culture.model.service;

import java.util.List;

import com.kh.hospital.culture.model.vo.Culture;


public interface CultureService {
	
	// 게시글 수 카운트
	int selectListCount();
	
	// 1. 문화센터 조회
	List<Culture> selectList();
	
	// 2. 작성
	int insertCulture(Culture c);
	
	// 3. 상세조회
	Culture selectCulture(int cid);
	
	// 4. 수정
	int updateCulture(Culture c);
	
	// 5. 삭제
	int deleteCulture(int cid);

	// 더보기
	List<Culture> moreList(int stepIndex);

	
	
	
	
}
