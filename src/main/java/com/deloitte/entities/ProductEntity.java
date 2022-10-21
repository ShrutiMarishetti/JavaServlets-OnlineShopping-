package com.deloitte.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="PRODUCT_DETAILS")
public class ProductEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="PRODUCT_ID",length=10)
	private int productId;
	@Column(name="PRODUCT_NAME",length=20)
	private String productName;
	@Column(name="PRODUCT_DESC",length=100)
	private String productDesc;
	@Column(name="PRODUCT_PRICE",length=20)
	private int productPrice;
	@Column(name="PRODUCT_DISCOUNT",length=20)
	private int productDiscount;
	@Column(name="PRODUCT_QTY",length=20)
	private int productQty;
	@Column(name="PRODUCT_IMAGE",length=100)
	private String productImage;
	
	@ManyToOne
	private CategoryEntity productCategory =new CategoryEntity();
	
	
	public CategoryEntity getProductCategory() {
		return productCategory;
	}
	
	public void setProductCategory(CategoryEntity productCategory) {
		this.productCategory = productCategory;
	}
	
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductDiscount() {
		return productDiscount;
	}
	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}
	public int getProductQty() {
		return productQty;
	}
	public void setProductQty(int productQty) {
		this.productQty = productQty;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	
	

}
