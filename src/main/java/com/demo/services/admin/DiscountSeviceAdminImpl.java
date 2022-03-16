package com.demo.services.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Discount;
import com.demo.entities.Product;
import com.demo.entities.User;
import com.demo.models.UserAjax;
import com.demo.repositoties.user.AccountRepositoryUser;
import com.demo.repositoties.admin.AccountRepositoryAdmin;
import com.demo.repositoties.admin.DiscountRepositoryAdmin;
import com.demo.repositoties.admin.ProductRepositoryAdmin;


@Service
public class DiscountSeviceAdminImpl implements DiscountServiceAdmin{

	
	
	@Autowired
	private DiscountRepositoryAdmin discountRepositoryAdmin;

	@Override
	public List<Discount> findAll() {
		return (List<Discount>) discountRepositoryAdmin.findAll();
	}



}
