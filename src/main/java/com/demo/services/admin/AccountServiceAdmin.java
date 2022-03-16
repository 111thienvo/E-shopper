package com.demo.services.admin;

import java.util.List;

import org.springframework.data.repository.query.Param;


import com.demo.entities.User;
import com.demo.models.UserAjax;


public interface AccountServiceAdmin {


	
	public long getCountUser(int id);
	
	public List<User> getListUser(int id);
}
