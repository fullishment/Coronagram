package com.gdj37.coronagram.web.qna.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.qna.dao.IDaoQna;

@Service
public class ServiceQna implements IServiceQna{
	@Autowired
	public IDaoQna iDaoQna;

	@Override
	public List<HashMap<String, String>> getQnaList(HashMap<String, String> params) throws Throwable {
		return iDaoQna.getQnaList(params);
	}

	@Override
	public HashMap<String, String> getQna(HashMap<String, String> params) throws Throwable {
		return iDaoQna.getQna(params);
	}

	@Override
	public int qnaAdd(HashMap<String, String> params) throws Throwable {
		return iDaoQna.qnaAdd(params);
	}
}
