package com.demo.repositoties.user;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import com.demo.entities.User;
import com.demo.models.UserAjax;




@Repository
public interface AccountRepositoryUser extends CrudRepository<User, Integer> {

	@Query("from User where username = :username")
	public User findByUsername(@Param("username") String username);
	
	@Query("select new com.demo.models.UserAjax(id, username, password, firstName, lastName, email, address, phone, enabled, verificationCode, resetPasswordToken, photo, createdAt, modifiedAt, dob) from User where id = :id")
	public UserAjax findByIdAjax(@Param("id") int id);
	
	@Query("from User where email = :email")
	public User findByEmail(@Param("email") String email);
}
