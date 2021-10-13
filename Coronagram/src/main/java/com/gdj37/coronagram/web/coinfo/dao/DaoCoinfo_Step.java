package com.gdj37.coronagram.web.coinfo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoCoinfo_Step implements IDaoCoinfo_Step {
@Autowired
public SqlSession sqlSession;
}
