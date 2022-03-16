package com.demo.repositoties.user;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Product;

import com.demo.models.ProductAjax;

@Repository
public interface ProductRepositoryUser extends CrudRepository<Product, Integer>{

	@Query("from Product where category.id =:idCategory")
	public List<Product> listProductByIdCategory(@Param("idCategory") int idCategory);
	
	@Query("from Product where id =:id")
	public Product findById(@Param("id") int id);
	
	@Query("select new com.demo.models.ProductAjax(id, name, price, quantity, photo) from Product where category.id =:idCategory")
	public List<ProductAjax> listProducAjaxtByIdCategory(@Param("idCategory") int idCategory);
	
	@Query("select name from Product where name like %:term%")
	public List<String> searchByTerm(@Param("term") String term);
	
	@Query("from Product where name like %:keyword%")
	public List<Product> searchByKeyword(@Param("keyword") String keyword);
	
	@Query(value = "select * from Product order by createdAt desc limit :n", nativeQuery = true) 
	public List<Product> getBestNewProduct(@Param("n") int n);
}
