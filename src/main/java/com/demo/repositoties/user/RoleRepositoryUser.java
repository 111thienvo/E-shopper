package com.demo.repositoties.user;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Role;



@Repository
public interface RoleRepositoryUser extends CrudRepository<Role, Integer> {

	
	@Query("from Role where roleId = :roleId")
	public Role findById(@Param("roleId") String roleId);
	
	
}
