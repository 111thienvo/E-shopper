package com.demo.controllers.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.demo.entities.Product;
import com.demo.models.ProductAjax;
import com.demo.services.user.ProductServiceUser;

@RestController
@RequestMapping(value = {"user/shopAjax"})
public class ShopAjaxController {

	@Autowired
	private ProductServiceUser productServiceUser;
	
	@RequestMapping(value = "search", method = RequestMethod.GET,
			produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<String> search(@RequestParam("term") String term){
		System.out.println(term);
		return productServiceUser.searchByTerm(term);
	}
	
	
	@RequestMapping(value = {"findIdCategory" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public String getListProductByIdCategory(ModelMap modelMap,@RequestParam("idCategory") int idCategory) {
		
		System.out.println(idCategory);
		List<ProductAjax> products = productServiceUser.listProductAjaxByIdCategory(idCategory);		
		modelMap.put("products", products);
		return "user/shop/index";
	}
	
	
	
}
