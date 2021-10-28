package com.gdj37.coronagram.web.edit_profile.dao;

import java.util.HashMap;


public interface IDaoEdit_profile {


	public HashMap<String, String> getedit_profile(HashMap<String, String> params)throws Throwable;

	public int getprofileUp(HashMap<String, String> params)throws Throwable;

	public int getNickCheck(HashMap<String, String> params)throws Throwable;

	public int crngSetting(HashMap<String, String> params)throws Throwable;

}
