package com.deloitte.entities;

import javax.persistence.Column;
import javax.persistence.Entity;//part of hibernate helps convert these into tables in back end
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="USER_DETAILS")
public class UserEntity {// this is pojo class
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int userId;
	
	@Column(name="USER_NAME", length=30)
	private String userName;
	
	@Column(name="USER_EMAIL", length=50)
	private String userEmail;
	
	@Column(name="USER_PASSWORD", length=50)
	private String userPassword;
	
	@Column(name="USER_PHONE", length=15)
	private int userPhone;
	
	@Column(name="USER_ADDRESS", length=50)
	private String userAddress;
	
	@Column(name="USER_ROLE", length=50)
	private String userRole;
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(int userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	
	

}
