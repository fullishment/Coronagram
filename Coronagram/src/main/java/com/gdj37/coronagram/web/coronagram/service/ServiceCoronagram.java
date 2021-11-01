package com.gdj37.coronagram.web.coronagram.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.coronagram.dao.IDaoCoronagram;

@Service
public class ServiceCoronagram implements IServiceCoronagram{
	@Autowired
	public IDaoCoronagram iDaoCoronagrma;

	@Override
	public List<HashMap<String, String>> getPostList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getPostList(params);
	}

	@Override
	public List<HashMap<String, String>> getPostCmt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getPostCmt(params);
	}

	@Override
	public int aHeart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.aHeart(params);
	}

	@Override
	public int dHeart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.dHeart(params);
	}

	@Override
	public int addPostCmt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.addPostCmt(params);
	}

	@Override
	public List<HashMap<String, String>> getListFollow(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getListFollow(params);
	}

	@Override
	public List<HashMap<String, String>> getNotFollow(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getNotFollow(params);
	}

	@Override
	public int FollowAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.FollowAdd(params);
	}

	@Override
	public HashMap<String, String> ModalInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.ModalInfo(params);
	}

	@Override
	public List<HashMap<String, String>> getMimg(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getMimg(params);
	}

	@Override
	public int followDel(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.followDel(params);
	}

	@Override
	public HashMap<String, String> getLastAcctNum(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getLastAcctNum(params);
	}

	@Override
	public int postAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.postAdd(params);
	}

	@Override
	public int postAcctAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.postAcctAdd(params);
	}

	@Override
	public List<HashMap<String, String>> getLkMList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getLkMList(params);
	}

	@Override
	public HashMap<String, String> getCrngDtl(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getCrngDtl(params);
	}

	@Override
	public int delCmt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.delCmt(params);
	}

}
