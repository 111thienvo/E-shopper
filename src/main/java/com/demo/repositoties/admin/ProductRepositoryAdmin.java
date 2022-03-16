package com.demo.repositoties.admin;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Product;






@Repository
public interface ProductRepositoryAdmin extends CrudRepository<Product, Integer> {

	@Query(value = "select count(id) from product", nativeQuery = true)
	public long getCountProduct();
	
	@Query(value = "select * from Product order by created_at desc limit :n", nativeQuery = true) 
	public List<Product> getNewPrododuct(@Param("n") int n);
}
