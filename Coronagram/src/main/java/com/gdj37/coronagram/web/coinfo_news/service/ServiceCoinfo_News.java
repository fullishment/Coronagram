package com.gdj37.coronagram.web.coinfo_news.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.coinfo_news.dao.IDaoCoinfo_News;

@Service
public class ServiceCoinfo_News implements IServiceCoinfo_News {
	@Autowired
	public IDaoCoinfo_News iDaoCoinfo_News;

}
