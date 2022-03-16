package com.demo.services.user;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.entities.User;



public interface AccountService extends UserDetailsService {

	public User save(User user);
	
	public User findByUsername(String username);
	
	public User findById(int accountId);
	
	public User update(User user);
}
