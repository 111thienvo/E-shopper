package com.demo.services.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Product;
import com.demo.entities.User;
import com.demo.models.UserAjax;
import com.demo.repositoties.user.AccountRepositoryUser;
import com.demo.repositoties.admin.AccountRepositoryAdmin;
import com.demo.repositoties.admin.ProductRepositoryAdmin;


@Service
public class ProductSeviceAdminImpl implements ProductServiceAdmin{

	
	
	@Autowired
	private ProductRepositoryAdmin productRepositoryAdmin;

	@Override
	public long getCountProduct() {
		return productRepositoryAdmin.getCountProduct();
	}

	@Override
	public List<Product> getNewPrododuct(int n) {
		return productRepositoryAdmin.getNewPrododuct(n);
	}

	@Override
	public List<Product> getAllProduct() {
		
		return (List<Product>) productRepositoryAdmin.findAll();
	}

	@Override
	public void delete(int id) {
		productRepositoryAdmin.deleteById(id);
		
	}

	@Override
	public Product add(Product product) {
		return productRepositoryAdmin.save(product);
	}

}
