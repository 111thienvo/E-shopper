package com.demo.services.admin;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.demo.entities.Product;
import com.demo.entities.User;
import com.demo.models.UserAjax;


public interface ProductServiceAdmin {
	public long getCountProduct();

	public List<Product> getNewPrododuct(int n);
	
	public List<Product> getAllProduct();
	
	public void delete(int id);
	
	public Product add(Product product);
}

