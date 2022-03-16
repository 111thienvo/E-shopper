package com.demo.services.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.entities.Role;

import com.demo.repositoties.user.AccountRepository;
import com.demo.repositoties.user.AccountRepositoryUser;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountRepositoryUser accountRepository;
	
	

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		com.demo.entities.User account = accountRepository.findByUsername(username);
		if(account == null) {
			throw new UsernameNotFoundException("UsernameNotFound");
		}else {
			List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
			for (Role role : account.getRoles()) {
				grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
			}
			return new User(account.getUsername(), account.getPassword(), grantedAuthorities);
		}
		
	}

	@Override
	public com.demo.entities.User findByUsername(String username) {
		
		return accountRepository.findByUsername(username);
	}

	@Override
	public com.demo.entities.User save(com.demo.entities.User user) {
		return accountRepository.save(user);
	}

	@Override
	public com.demo.entities.User findById(int accountId) {
		return accountRepository.findById(accountId).get();
	}

	@Override
	public com.demo.entities.User update(com.demo.entities.User user) {
		return accountRepository.save(user);
	}
	
}
