package com.demo.controllers.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Product;
import com.demo.services.user.ProductServiceUser;

@Controller
@RequestMapping(value = {"user/shop"})
public class ShopController {

	@Autowired
	private ProductServiceUser productServiceUser;
	
	
	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		List<Product> products = productServiceUser.findAll();		
		modelMap.put("products", products);
		return "user/shop/index";
	}
	
	@RequestMapping(value = { "detail" }, method = RequestMethod.GET)
	public String product_details(ModelMap modelMap,@RequestParam("id") int id) {
	
		Product product = productServiceUser.findById(id);	
		if(product != null) {
			modelMap.put("product", product);
			List<Product> products = productServiceUser.findAll();		
			modelMap.put("products", products);
			
			return "user/shop/product_detail";
		}else {
			return "redirect:/user/home/404";
		}
		
	}
	
	@RequestMapping(value = {"category/find/{idCategory}" }, method = RequestMethod.GET)
	public String getListProductByIdCategory(ModelMap modelMap,@PathVariable("idCategory") int idCategory) {
		
		System.out.println(idCategory);
		List<Product> products = productServiceUser.listProductByIdCategory(idCategory);	
		 
		
			modelMap.put("products", products);
			return "user/shop/index";
		
		
	}
	
	@RequestMapping(value = {"search"}, method = RequestMethod.GET)
	public String search(@RequestParam("keyword") String keyword, ModelMap modelMap) {
		modelMap.put("products", productServiceUser.searchByKeyword(keyword));
		return "user/shop/index";
	}
	
	
	
}
