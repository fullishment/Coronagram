package com.gdj37.coronagram.web.admin_qna.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoAdmin_Qna implements IDaoAdmin_Qna{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getadminQnaCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("qna.getadminQnaCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getadminQnaList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("qna.getadminQnaList", params);
	}

	@Override
	public HashMap<String, String> getadminQna(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("qna.getadminQna", params);
	}

	@Override
	public int getadminQnaUp(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("qna.getadminQnaUp", params);
	}
}
