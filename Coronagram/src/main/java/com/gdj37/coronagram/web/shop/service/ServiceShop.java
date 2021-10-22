package com.gdj37.coronagram.web.shop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.shop.dao.IDaoShop;

@Service
public class ServiceShop implements IServiceShop{
	@Autowired
	public IDaoShop iDaoShop;

	@Override
	public List<HashMap<String, String>> getProdList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.getProdList(params);
	}

	@Override
	public HashMap<String, String> getProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.getProd(params);
	}

	@Override
	public int addOpt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.addOpt(params);
	}

	@Override
	public List<HashMap<String, String>> getOptList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.getOptList(params);
	}

	@Override
	public List<HashMap<String, String>> getProdImgList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.getProdImgList(params);
	}

	@Override
	public int addCart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.addCart(params);
	}

	@Override
	public List<HashMap<String, String>> getCartList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.getCartList(params);
	}

	@Override
	public HashMap<String,String> getCartCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.getCartCnt(params);
	}

	@Override
	public int cartDel(Integer integer) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.cartDel(integer);
	}

	@Override
	public int addOrder(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.addOrder(params);
	}

	

	@Override
	public int getOrdNo(HashMap<String, String> params)throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.getOrdNo(params);
	}


	@Override
	public int addOrdP( HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.addOrdP(params);
	}

	@Override
	public int cartAllDel(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.cartAllDel(params);
	}

	@Override
	public int pointMinus(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.pointMinus(params);
	}

	@Override
	public HashMap<String, String> getPoint(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.getPoint(params);
	}

	@Override
	public List<HashMap<String, String>> getOrdList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoShop.getOrdList(params);
	}



	
}
