package com.demo.repositoties.user;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Category;


@Repository
public interface CategoryRepositoryUser extends CrudRepository<Category, Integer>{

}
