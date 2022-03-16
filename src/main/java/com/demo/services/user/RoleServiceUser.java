package com.demo.services.user;

import java.util.List;

import com.demo.entities.Role;


public interface RoleServiceUser {

		public Role find(int roleId);
		
		public List<Role> findAllRole();
		
}
