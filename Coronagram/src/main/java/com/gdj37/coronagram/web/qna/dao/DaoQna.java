package com.gdj37.coronagram.web.qna.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoQna implements IDaoQna {
 @Autowired
 public SqlSession sqlSession;
}
