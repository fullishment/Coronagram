package com.gdj37.coronagram.web.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.qna.dao.IDaoQna;

@Service
public class ServiceQna implements IServiceQna{
	@Autowired
	public IDaoQna iDaoQna;
}
