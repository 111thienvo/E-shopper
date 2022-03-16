package com.demo.repositoties.admin;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import com.demo.entities.User;
import com.demo.models.UserAjax;




@Repository
public interface AccountRepositoryAdmin extends CrudRepository<User, Integer> {

	@Query(value = "select count(User.id) from User JOIN user_role ON user_role.user_id = user.id JOIN role on user_role.role_id=role.id WHERE role.id=:id", nativeQuery = true)
	public long getCountUser(int id);
	
	@Query(value = "select * from User JOIN user_role ON user_role.user_id = user.id JOIN role on user_role.role_id=role.id WHERE role.id=:id", nativeQuery = true)
	public List<User> getListUser(int id);
}
