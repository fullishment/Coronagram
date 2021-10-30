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

	@Override
	public int addOrder(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("shop.addOrder", params);
	}


	@Override
	public int getOrdNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.getOrdNo",params);
	}


	@Override
	public int addOrdP(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("shop.addOrdP",params);
	}

	@Override
	public int cartAllDel(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.delete("shop.cartAllDel", params);
	}

	@Override
	public int pointMinus(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("shop.pointMinus", params);
	}

	@Override
	public HashMap<String, String> getPoint(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.getPoint",params);
	}

	@Override
	public List<HashMap<String, String>> getOrdList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shop.getOrdList",params);
	}

	@Override
	public List<HashMap<String, String>> getShopList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shop.getShopList",params);
	}

	@Override
	public HashMap<String, String> getProdInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.getProdInfo",params);
	}

	@Override
	public List<HashMap<String, String>> getProdAttcList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shop.getProdAttcList", params);
	}

	@Override
	public int prodAttcAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("shop.prodAttcAdd",params);
	}

	@Override
	public int prodU(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("shop.prodU", params);
	}

	@Override
	public HashMap<String, String> getPAttcNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.getPAttcNo",params);
	}

	@Override
	public int prodAttcDel(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.delete("shop.prodAttcDel", params);
	}

	@Override
	public List<HashMap<String, String>> getProdCatList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shop.getProdCatList", params);
	}

	@Override
	public HashMap<String, String> getProdNextNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.getProdNextNo",params);
	}

	@Override
	public int prodAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("shop.prodAdd",params);
	}

	@Override
	public List<HashMap<String, String>> getProdTopList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shop.getProdTopList", params);
	}





	
}
