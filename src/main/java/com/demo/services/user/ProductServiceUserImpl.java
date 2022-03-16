package com.demo.services.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Product;
import com.demo.models.ProductAjax;
import com.demo.repositoties.user.ProductRepositoryUser;

@Service
public class ProductServiceUserImpl implements ProductServiceUser {

	@Autowired
	private ProductRepositoryUser productRepositoryUser;
	
	@Override
	public List<Product> findAll() {
		return (List<Product>) productRepositoryUser.findAll();
	}

	@Override
	public List<Product> listProductByIdCategory(int idCategory) {
		return productRepositoryUser.listProductByIdCategory(idCategory);
	}

	@Override
	public List<ProductAjax> listProductAjaxByIdCategory(int idCategory) {
		return productRepositoryUser.listProducAjaxtByIdCategory(idCategory);
	}

	@Override
	public List<String> searchByTerm(String term) {
		return productRepositoryUser.searchByTerm(term);
	}

	@Override
	public List<Product> searchByKeyword(String keyword) {
		return productRepositoryUser.searchByKeyword(keyword);
	}

	@Override
	public Product findById(int id) {
		return productRepositoryUser.findById(id);
	}

}
