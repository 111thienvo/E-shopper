package com.demo.services.admin;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.demo.entities.Discount;
import com.demo.entities.Product;
import com.demo.entities.User;
import com.demo.models.UserAjax;


public interface DiscountServiceAdmin {


	public List<Discount> findAll();
	

}

