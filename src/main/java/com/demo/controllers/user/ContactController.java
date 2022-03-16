package com.demo.controllers.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = {"user/contact"})
public class ContactController {

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index() {
		return "user/contact_us/index";
	}
	
	
	
}
