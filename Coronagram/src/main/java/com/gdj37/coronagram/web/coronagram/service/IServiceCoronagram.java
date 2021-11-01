package com.gdj37.coronagram.web.coronagram.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceCoronagram {

	public List<HashMap<String, String>> getPostList(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getPostCmt(HashMap<String, String> params)throws Throwable;

	public int aHeart(HashMap<String, String> params)throws Throwable;

	public int dHeart(HashMap<String, String> params)throws Throwable;

	public int addPostCmt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getListFollow(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getNotFollow(HashMap<String, String> params)throws Throwable;

	public int FollowAdd(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> ModalInfo(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getMimg(HashMap<String, String> params)throws Throwable;
	
	public int followDel(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getLastAcctNum(HashMap<String, String> params)throws Throwable;

	public int postAdd(HashMap<String, String> params)throws Throwable;

	public int postAcctAdd(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getLkMList(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getCrngDtl(HashMap<String, String> params)throws Throwable;

	public int delCmt(HashMap<String, String> params)throws Throwable;
}
