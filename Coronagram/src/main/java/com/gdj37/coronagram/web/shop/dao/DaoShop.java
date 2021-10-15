package com.gdj37.coronagram.web.shop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoShop implements IDaoShop {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getProdList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shop.getProdList",params);
	}

	@Override
	public HashMap<String, String> getProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.getProd",params);
	}

	@Override
	public int addOpt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("shop.getOpt", params);
	}

	@Override
	public List<HashMap<String, String>> getOptList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shop.getOptList",params);
	}

	@Override
	public List<HashMap<String, String>> getProdImgList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shop.getProdImgList",params);
	}

	@Override
	public int addCart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("shop.addCart",params);
	}

	@Override
	public List<HashMap<String, String>> getCartList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shop.getCartList",params);
	}

	@Override
	public HashMap<String,String> getCartCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.getCartCnt",params);
	}

	@Override
	public int cartDel(Integer integer) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.delete("shop.cartDel", integer);
	}
}
