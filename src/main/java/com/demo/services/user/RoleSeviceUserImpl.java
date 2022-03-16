package com.demo.services.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Role;
import com.demo.repositoties.user.RoleRepositoryUser;



@Service
public class RoleSeviceUserImpl implements RoleServiceUser{

	@Autowired
	private RoleRepositoryUser roleRepositoryUser;

	@Override
	public Role find(int roleId) {
		return roleRepositoryUser.findById(roleId).get();
		
	}

	@Override
	public List<Role> findAllRole() {
		return (List<Role>) roleRepositoryUser.findAll();
	}
	
	
	

}
