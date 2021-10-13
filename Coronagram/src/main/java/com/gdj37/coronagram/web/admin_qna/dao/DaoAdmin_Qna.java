package com.gdj37.coronagram.web.admin_qna.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoAdmin_Qna implements IDaoAdmin_Qna{
	@Autowired
	public SqlSession sqlSession;
}
