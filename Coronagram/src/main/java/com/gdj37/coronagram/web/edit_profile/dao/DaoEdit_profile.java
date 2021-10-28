package com.gdj37.coronagram.web.edit_profile.dao;

import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoEdit_profile implements IDaoEdit_profile{
	@Autowired
	public SqlSession sqlSession;


	@Override
	public HashMap<String, String> getedit_profile(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("editProfile.getEditP", params);
	}


	@Override
	public int getprofileUp(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("editProfile.getprofileUp",params);
	}


	@Override
	public int getNickCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("editProfile.getNickCheck", params);
	}


	@Override
	public int crngSetting(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("editProfile.crngSetting",params);
	}


}
