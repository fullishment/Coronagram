package com.gdj37.coronagram.web.edit_profile.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoEdit_profile implements IDaoEdit_profile{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getedit_profileList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("editProfile.getedit_profileList", params);
	}

	@Override
	public int getprofileIdCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("editProfile.getprofileIdCheck", params);
	}

	@Override
	public HashMap<String, String> getedit_profile(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("editProfile.getedit_profile", params);
	}

	@Override
	public int getprofileUp(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("editProfile.getprofileUp",params);
	}

}
