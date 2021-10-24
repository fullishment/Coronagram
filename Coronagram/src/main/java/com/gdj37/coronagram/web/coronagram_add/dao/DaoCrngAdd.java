package com.gdj37.coronagram.web.coronagram_add.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoCrngAdd implements IDaoCrngAdd {
	@Autowired
	public SqlSession sqlSession;
}
