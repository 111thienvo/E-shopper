package com.demo.services.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.User;
import com.demo.models.UserAjax;
import com.demo.repositoties.user.AccountRepositoryUser;


@Service
public class AccountSeviceUserImpl implements AccountServiceUser{

	@Autowired
	private AccountRepositoryUser accountRepository;
	
	@Override
	public User findByUsername(String username) {
		
		return accountRepository.findByUsername(username);
	}
	
	@Override
	public User find(int id) {
		return accountRepository.findById(id).get();
	}
	
	// this method was not be completed!
	@Override
	public User create(User user) {
		
		return accountRepository.save(user);
	}
	
	// this method was not be completed!
	@Override
	public User update(User user) {
		
		return accountRepository.save(user);
		
	}

	@Override
	public void delete(int id) {
		accountRepository.deleteById(id);
	}

	@Override
	public List<User> findAllAccount() {
		
		return (List<User>) accountRepository.findAll();
	}

	@Override
	public long countAccountUser() {
		return accountRepository.count();
	}

	@Override
	public UserAjax findByIdAjax(int id) {
		return accountRepository.findByIdAjax(id);
	}

	@Override
	public User findByEmail(String email) {
		return accountRepository.findByEmail(email);
	}



}
