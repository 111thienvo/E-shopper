package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Product;
import com.demo.services.admin.AccountServiceAdmin;
import com.demo.services.admin.ProductServiceAdmin;
import com.demo.services.user.AccountServiceUser;



@Controller
@RequestMapping(value = { "admin/manage_user" })
public class ManageUserController {

	@Autowired
	private AccountServiceAdmin accountServiceAdmin; 
	
	@Autowired
	private ProductServiceAdmin productServiceAdmin; 
	
	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("users", accountServiceAdmin.getListUser(2));
		
		
		return "admin/manage_user/index";
	}

	
}
