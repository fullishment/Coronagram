package com.gdj37.coronagram.web.login.dao;

import java.util.HashMap;

import com.gdj37.coronagram.web.login.VO.MemberVO;

public interface IDaoFind_Idpw {
	
	public String findId(HashMap<String, String> params) throws Throwable;
	
	/*
	 * public String find_pws(HashMap<String, String> params) throws Throwable;
	 * 
	 * public String updateM1(HashMap<String, String> params) throws Throwable;
	 */
	
	public int updatePw(MemberVO vo) throws Exception;

	public MemberVO readMember(String m_ID) throws Exception;

	public MemberVO idCheck(String m_ID)throws Exception;

}
