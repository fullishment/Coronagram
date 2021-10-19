package com.gdj37.coronagram.web.coinfo_info.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoCoinfo_Infopage implements IDaoCoinfo_Infopage {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public HashMap<String, String> getInfopage(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("coinfo.getInfopage", params);
	}
}
