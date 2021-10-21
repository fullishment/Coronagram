package com.gdj37.coronagram.web.coinfo_info.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoCoinfo_Infolist implements IDaoCoinfo_Infolist {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getInfolist(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("coinfo.getInfolist", params);
	}

	@Override
	public HashMap<String, String> getInfopage(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("coinfo.getInfopage", params);
	}

	@Override
	public HashMap<String, String> getCoinfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("coinfo.getCoinfo", params);
	}

	@Override
	public int updateCoinfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("coinfo.updateCoinfo", params);
	}

	@Override
	public int deleteCoinfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("coinfo.deleteCoinfo", params);
	}


}
