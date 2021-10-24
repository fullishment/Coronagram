package com.gdj37.coronagram.web.coronagram_add.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.coronagram_add.dao.IDaoCrngAdd;

@Service
public class ServiceCrngAdd implements IServiceCrngAdd {
	@Autowired
	public IDaoCrngAdd iDaoCrngAdd;
}
