package com.gdj37.coronagram.web.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

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
		List<HashMap<String,String>> attc = iServiceShop.getProdImgList(params);
		modelMap.put("opt", opt);
		modelMap.put("attc", attc);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/cartAdd" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cartAdd(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result="success";
		try {
			int cart = iServiceShop.addCart(params);
			if(cart==0) {
				result="failed";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result="error";
		}
		
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/shopCart")
	public ModelAndView shopCart(ModelAndView mav,HttpSession session, @RequestParam HashMap<String,String> params) throws Throwable {
		if(session.getAttribute("sMNo")!=null) {
			mav.setViewName("shop_cart/shop_cart");
		}else {
			mav.setViewName("login/login");
		}
		
		return mav;
	}

	@RequestMapping(value="/shopCarts" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cartList(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		List<HashMap<String,String>> list = iServiceShop.getCartList(params);
		HashMap<String,String> cnt = iServiceShop.getCartCnt(params);
		HashMap<String,String> mP = iServiceShop.getPoint(params);
		modelMap.put("mP", mP);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/cartDel" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cartDel(ModelAndView mav, @RequestParam HashMap<String,String> params, @RequestParam(value="valueArr[]") List<Integer> cartList) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result ="success";
		for(int i=0;i<cartList.size();i++) {
			try {
				int cartDel = iServiceShop.cartDel(cartList.get(i));
				if(cartDel==0) {
					result="failed";
				}
			} catch (Exception e) {
				
				e.printStackTrace();
				result="error";
			}
			
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/orderAdd" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String orderAdd(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result="success";
		try {
			int addO = iServiceShop.addOrder(params);
			if(addO!=0) { 
				
				result="failed";
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			result="error";
		}
		
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/orderAdds" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String orderAdds(ModelAndView mav, @RequestParam HashMap<String,String> paramss) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result="success";
		int addOP = iServiceShop.addOrdP(paramss);
		if(addOP==0) {
			result="failed";
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}  
	
	@RequestMapping(value="/cartAllDel" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cartAllDel(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result="success";
		int cartAllDel = iServiceShop.cartAllDel(params);
		int pointM = iServiceShop.pointMinus(params);
		if(cartAllDel==0 || pointM==0) {
			result="failed";
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	@RequestMapping(value="/prodShipping")
	public ModelAndView prodShipping(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		mav.setViewName("prod_shipping/prod_shipping");
		return mav;
	}
	@RequestMapping(value="/prodSpList" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prodSpList(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		List<HashMap<String,String>> list = iServiceShop.getOrdList(params);
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/adminShopList")
	public ModelAndView adminShopList(ModelAndView mav) throws Throwable {
		mav.setViewName("shop_list/shop_list");
		return mav;
	}
	@RequestMapping(value="/adminShopLists" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String adminShopLists(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		List<HashMap<String,String>> list = iServiceShop.getShopList(params);
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/prodInfo")
	public ModelAndView prodInfo(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		HashMap<String,String> data = iServiceShop.getProdInfo(params);
		List<HashMap<String,String>> list = iServiceShop.getProdAttcList(params);
		List<HashMap<String,String>> catlist = iServiceShop.getProdCatList(params);
		mav.addObject("data", data);
		mav.addObject("list", list);
		mav.addObject("catList", catlist);
		mav.setViewName("prod_info/prod_info");
		return mav;
	}
	@RequestMapping(value="/prodAttcAdd" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prodAttcAdd(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result="success";
		int prodAttcAdd = iServiceShop.prodAttcAdd(params);
		if(prodAttcAdd ==0) {
			result="failed";
		}
		
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/prodAttcDel" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prodAttcDel(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result="success";
		int prodAttcDel = iServiceShop.prodAttcDel(params);
		if(prodAttcDel ==0) {
			result="failed";
		}
		
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/prodU" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prodU(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result="success";
		int prodAttcAdd = iServiceShop.prodU(params);
		
		if(prodAttcAdd ==0) {
			result="failed";
		}else {
			int prodAttcDel = iServiceShop.prodAttcDel(params);
			if(prodAttcDel ==0) {
				result="failed";
			}
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value="/prodAdd")
	public ModelAndView prodAdd(ModelAndView mav, @RequestParam HashMap<String,String> params,HttpSession session) throws Throwable {
		if(session.getAttribute("sMNo")!=null) {
			List<HashMap<String,String>> catlist = iServiceShop.getProdCatList(params);
			HashMap<String,String> nextPNo = iServiceShop.getProdNextNo(params);
			mav.addObject("catList", catlist);
			mav.addObject("nextPNo", nextPNo);
			mav.setViewName("prod_add/prod_add");
		}else {
			mav.setViewName("login/login");
		}
		
		return mav;
	}
	@RequestMapping(value="/prodAdds" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prodAdds(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result="success";
		int prodAttcAdd = iServiceShop.prodAdd(params);
		if(prodAttcAdd ==0) {
			result="failed";
		}
		
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/adminShopMgt")
	public ModelAndView adminShopMgt(ModelAndView mav) throws Throwable {
		mav.setViewName("admin_shop_mgt/admin_shop_mgt");
		return mav;
	}
}
