package com.gdj37.coronagram.web.edit_profile.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceEdit_profile {

	public List<HashMap<String, String>> getedit_profileList(HashMap<String, String> params)throws Throwable;

	public int getprofileIdCheck(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getedit_profile(HashMap<String, String> params)throws Throwable;

	public int getprofileUp(HashMap<String, String> params)throws Throwable;

	public String update_edit_profile(HashMap<String, String> params);


}
