package com.gdj37.coronagram.web.shop.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.coronagram.web.shop.service.IServiceShop;

@Controller
public class ShopController {
	@Autowired
	public IServiceShop iServiceShop;
	
	@RequestMapping(value="/shop")
	public ModelAndView shopMain(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		List<HashMap<String,String>> list = iServiceShop.getProdList(params);
		mav.addObject("list",list);
		mav.setViewName("shop_main/shop_main");
		return mav;
	}
}
