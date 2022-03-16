package com.demo.tags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.services.user.CategoryServiceUser;



public class CategoryTag extends RequestContextAwareTag {
	
	@Autowired
	private CategoryServiceUser categoryServiceUser;
	
	

	@Override
	protected int doStartTagInternal() throws Exception {
		if (categoryServiceUser == null) {
			WebApplicationContext applicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory autowireCapableBeanFactory = applicationContext.getAutowireCapableBeanFactory();
			autowireCapableBeanFactory.autowireBean(this);
		}
		return SKIP_BODY;
	}

	@Override
	public void doFinally() {
		try {
			String jspPage = "../../tags/category/index.jsp";
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			request.setAttribute("categories", categoryServiceUser.findAll());
			request.getRequestDispatcher(jspPage);
			pageContext.include(jspPage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}