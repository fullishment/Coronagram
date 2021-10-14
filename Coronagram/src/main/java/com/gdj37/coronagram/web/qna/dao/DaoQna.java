package com.gdj37.coronagram.web.qna.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoQna implements IDaoQna {
 @Autowired
 public SqlSession sqlSession;

@Override
public List<HashMap<String, String>> getQnaList(HashMap<String, String> params) throws Throwable {
	return sqlSession.selectList("qna.getQnaList", params);
}

@Override
public HashMap<String, String> getQna(HashMap<String, String> params) throws Throwable {
	return sqlSession.selectOne("qna.getQna", params);
}

@Override
public int qnaAdd(HashMap<String, String> params) throws Throwable {
	return sqlSession.insert("qna.qnaAdd",params);
}
}
