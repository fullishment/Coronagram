package com.gdj37.coronagram.web.coronagram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.coronagram.dao.IDaoCoronagram;

@Service
public class ServiceCoronagram implements IServiceCoronagram{
	@Autowired
	public IDaoCoronagram iDaoCoronagrma;
}
