package com.gdj37.coronagram.web.coinfo_info.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoCoinfo_Infopage implements IDaoCoinfo_Infopage {
	@Autowired
	public SqlSession sqlSession;
}
