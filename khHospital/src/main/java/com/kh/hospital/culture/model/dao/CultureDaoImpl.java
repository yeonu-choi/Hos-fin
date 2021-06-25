package com.kh.hospital.culture.model.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hospital.culture.model.vo.Culture;

@Repository
public class CultureDaoImpl implements CultureDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cultureMapper.selectListCount");
	}
	
	@Override
	public List<Culture> selectList() {
		//int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		//RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("cultureMapper.selectList"/*, null, rowBounds*/);
				
	}

	@Override
	public int insertCulture(Culture c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cultureMapper.insertCulture", c);
	}

	@Override
	public Culture selectCulture(int cid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cultureMapper.selectCulture", cid);
	}

	@Override
	public int updateCulture(Culture c) {
		// TODO Auto-generated method stub
		return sqlSession.update("cultureMapper.updateCulture", c);
	}

	@Override
	public int deleteCulture(int cid) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cultureMapper.deleteCulture", cid);
	}

	@Override
	public List<Culture> morelist(int stepIndex) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cultureMapper.morelist", stepIndex);
	}

	

}
