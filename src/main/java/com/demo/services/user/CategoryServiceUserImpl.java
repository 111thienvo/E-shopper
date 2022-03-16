package com.demo.services.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Category;

import com.demo.repositoties.user.CategoryRepositoryUser;


@Service
public class CategoryServiceUserImpl implements CategoryServiceUser {

	@Autowired
	private CategoryRepositoryUser categoryRepositoryUser;
	
	@Override
	public List<Category> findAll() {
		return (List<Category>) categoryRepositoryUser.findAll();
	}

}
