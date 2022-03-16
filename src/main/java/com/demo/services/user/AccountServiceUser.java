package com.demo.services.user;

import java.util.List;

import org.springframework.data.repository.query.Param;


import com.demo.entities.User;
import com.demo.models.UserAjax;


public interface AccountServiceUser {

	public User findByUsername(String username);
	
	public List<User> findAllAccount();

	public User find(int id);

	public User create(User user);

	public User update(User user);

	public void delete(int id);

	public long countAccountUser();
	
	public UserAjax findByIdAjax(int id);
	
	public User findByEmail(String email);
}
