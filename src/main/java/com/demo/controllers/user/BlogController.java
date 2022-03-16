package com.demo.controllers.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = {"user/blog"})
public class BlogController {

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index() {
		return "user/blog/index";
	}
	@RequestMapping(value = {"404"}, method = RequestMethod.GET)
	public String blog_single() {
		return "user/blog/blog_single";
	}
	
	
}
