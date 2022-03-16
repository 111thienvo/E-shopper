package com.demo.services.user;

import java.util.List;



import com.demo.entities.Product;
import com.demo.models.ProductAjax;

public interface ProductServiceUser {

	public List<Product> findAll();
	
	public Product findById(int id);
	
	public List<Product> listProductByIdCategory(int idCategory);
	
	public List<ProductAjax> listProductAjaxByIdCategory(int idCategory);
	
	public List<String> searchByTerm(String term);
	
	public List<Product> searchByKeyword(String keyword);
}
