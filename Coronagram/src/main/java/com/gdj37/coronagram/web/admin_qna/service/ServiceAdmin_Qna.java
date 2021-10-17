package com.gdj37.coronagram.web.admin_qna.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.admin_qna.dao.IDaoAdmin_Qna;

@Service
public class ServiceAdmin_Qna implements IServiceAdmin_Qna {
	@Autowired
	public IDaoAdmin_Qna iDaoAdmin_Qna;

	@Override
	public int getadminQnaCnt(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Qna.getadminQnaCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getadminQnaList(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Qna.getadminQnaList(params);
	}

	@Override
	public HashMap<String, String> getadminQna(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Qna.getadminQna(params);
	}

	@Override
	public int getadminQnaUp(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Qna.getadminQnaUp(params);
	}

	@Override
	public int getadminQnaDel(HashMap<String, String> params) throws Throwable {
		return iDaoAdmin_Qna.getadminQnaDel(params);
	}
}
