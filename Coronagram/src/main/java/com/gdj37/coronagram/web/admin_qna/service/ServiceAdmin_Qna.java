package com.gdj37.coronagram.web.admin_qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.admin_qna.dao.IDaoAdmin_Qna;

@Service
public class ServiceAdmin_Qna implements IServiceAdmin_Qna {
	@Autowired
	public IDaoAdmin_Qna iDaoAdmin_Qna;
}
