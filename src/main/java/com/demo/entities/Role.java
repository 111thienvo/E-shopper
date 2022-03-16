package com.demo.entities;
// Generated Feb 12, 2022 4:10:07 PM by Hibernate Tools 5.1.10.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * Role generated by hbm2java
 */
@Entity
@Table(name = "role", catalog = "shopping_cart")
public class Role implements java.io.Serializable {

	private Integer id;
	private String name;
	private String description;
	private boolean status;
	private Set<User> users = new HashSet<User>(0);

	public Role() {
	}

	public Role(String name, String description, boolean status) {
		this.name = name;
		this.description = description;
		this.status = status;
	}

	public Role(String name, String description, boolean status, Set<User> users) {
		this.name = name;
		this.description = description;
		this.status = status;
		this.users = users;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "description", nullable = false, length = 50)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_role", catalog = "shopping_cart", joinColumns = {
			@JoinColumn(name = "role_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "user_id", nullable = false, updatable = false) })
	public Set<User> getUsers() {
		return this.users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}