package com.demo.repositoties.admin;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Discount;
import com.demo.entities.Product;






@Repository
public interface DiscountRepositoryAdmin extends CrudRepository<Discount, Integer> {

	
}
