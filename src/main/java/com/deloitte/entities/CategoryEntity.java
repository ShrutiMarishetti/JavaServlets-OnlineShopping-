package com.deloitte.entities;

import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table (name="CATEGORY_DETAILS")
public class CategoryEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
	
	@Column(name="CATEGORY_NAME", length=30)
    private String categoryName;
	
	@Column(name="CATEGORY_DESC", length=50)
    private String categoryDesc;
	
	//one category many products
	@OneToMany(mappedBy= "productCategory") 
	private List <ProductEntity> productList=new ArrayList<ProductEntity>();
	
	
	public List<ProductEntity> getProductList() {
		return productList;
	}
	public void setProductList(List<ProductEntity> productList) {
		this.productList = productList;
	}
	
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryDesc() {
		return categoryDesc;
	}
	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
}
