package com.demo.entities;
// Generated Feb 12, 2022 4:10:07 PM by Hibernate Tools 5.1.10.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Discount generated by hbm2java
 */
@Entity
@Table(name = "discount", catalog = "shopping_cart")
public class Discount implements java.io.Serializable {

	private Integer id;
	private String name;
	private String description;
	private long discountPercent;
	private Date createdAt;
	private Date modifiedAt;
	private Set<Product> products = new HashSet<Product>(0);

	public Discount() {
	}

	public Discount(String name, String description, long discountPercent, Date createdAt, Date modifiedAt) {
		this.name = name;
		this.description = description;
		this.discountPercent = discountPercent;
		this.createdAt = createdAt;
		this.modifiedAt = modifiedAt;
	}

	public Discount(String name, String description, long discountPercent, Date createdAt, Date modifiedAt,
			Set<Product> products) {
		this.name = name;
		this.description = description;
		this.discountPercent = discountPercent;
		this.createdAt = createdAt;
		this.modifiedAt = modifiedAt;
		this.products = products;
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

	@Column(name = "description", nullable = false, length = 250)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "discount_percent", nullable = false, precision = 10, scale = 0)
	public long getDiscountPercent() {
		return this.discountPercent;
	}

	public void setDiscountPercent(long discountPercent) {
		this.discountPercent = discountPercent;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "created_at", nullable = false, length = 10)
	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "modified_at", nullable = false, length = 10)
	public Date getModifiedAt() {
		return this.modifiedAt;
	}

	public void setModifiedAt(Date modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "discount")
	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

}
