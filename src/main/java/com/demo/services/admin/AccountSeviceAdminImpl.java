package com.demo.services.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.User;
import com.demo.models.UserAjax;
import com.demo.repositoties.user.AccountRepositoryUser;
import com.demo.repositoties.admin.AccountRepositoryAdmin;


@Service
public class AccountSeviceAdminImpl implements AccountServiceAdmin{

	@Autowired
	private AccountRepositoryUser accountRepositoryUser;
	
	@Autowired
	private AccountRepositoryAdmin accountRepositoryAdmin;
	
	

	@Override
	public long getCountUser(int id) {
		return accountRepositoryAdmin.getCountUser(id);
	}



	@Override
	public List<User> getListUser(int id) {
		
		return accountRepositoryAdmin.getListUser(id);
	}



}
