package com.gdj37.coronagram.web.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.coronagram.web.shop.service.IServiceShop;

@Controller
public class ShopController {
	@Autowired
	public IServiceShop iServiceShop;
	
	@RequestMapping(value="/shop")
	public ModelAndView shopMain(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		mav.setViewName("shop_main/shop_main");
		return mav;
	}
	@RequestMapping(value="/shops" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String shopMains(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		List<HashMap<String,String>> list = iServiceShop.getProdList(params);
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/shopCart")
	public ModelAndView shopCart(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		mav.setViewName("shop_cart/shop_cart");
		return mav;
	}
	@RequestMapping(value="/prodDetail")
	public ModelAndView prodDetail(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		HashMap<String,String> data = iServiceShop.getProd(params);
		
		mav.addObject("data", data);
		mav.setViewName("prod_dtl/prod_dtl");
		return mav;
	}
	@RequestMapping(value="/prodDetails" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prodDetails(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		List<HashMap<String,String>> opt = iServiceShop.getOptList(params);
		modelMap.put("opt", opt);
		
		return mapper.writeValueAsString(modelMap);
	}
}
