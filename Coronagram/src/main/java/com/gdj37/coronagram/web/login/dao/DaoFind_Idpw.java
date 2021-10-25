package com.gdj37.coronagram.web.login.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gdj37.coronagram.web.login.VO.MemberVO;

@Repository
public class DaoFind_Idpw implements IDaoFind_Idpw{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public String findId(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("find_id.findId", params);
	}

	/*
	 * @Override public String find_pws(HashMap<String, String> params) throws
	 * Throwable { return sqlSession.selectOne("find_id.find_pws", params); }
	 */

	/*
	 * @Override public String updateM1(HashMap<String, String> params) throws
	 * Throwable { return sqlSession.selectOne("find_id.updateM1", params); }
	 */

	@Override
	public int updatePw(MemberVO vo) throws Exception {
		return sqlSession.update("find_pw.updatePw", vo);
	}

	@Override
	public MemberVO readMember(String m_ID) throws Exception {
		return sqlSession.selectOne("find_pw.readMember", m_ID);
	}

	@Override
	public MemberVO idCheck(String m_ID) throws Exception {
		return sqlSession.selectOne("find_pw.idCheck", m_ID);
	}
	
}
