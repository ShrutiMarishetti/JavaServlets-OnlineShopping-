package com.deloitte.dao;


import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


import com.deloitte.entities.UserEntity;
import com.deloitte.util.HibernateSessionFactoryUtil;

public class UserDAO {


	public boolean saveUserRegDetails(UserEntity userRegDetails) {
		
		boolean userDetailsSaved = false;
		
		try {
			
			Session dbSession = HibernateSessionFactoryUtil.getSessionFactoryInstance().openSession();
			Transaction dbTransaction = dbSession.beginTransaction();
			dbSession.save(userRegDetails);
			dbTransaction.commit();
			dbSession.close();
			
			userDetailsSaved = true;
			
		}
		catch(Exception ex) {
			
			System.out.println("Error while saving registration details:  "+ ex.getStackTrace());
		}
				
		return userDetailsSaved;
	}
	
	public UserEntity getUserDetails(String emailId, String password) {
		
		
		UserEntity singleUserDetail = null;
		
		try {
			
			Session hibSession = HibernateSessionFactoryUtil.getSessionFactoryInstance().openSession();
			
			CriteriaBuilder criteriaBuilder = hibSession.getCriteriaBuilder();
			CriteriaQuery <UserEntity> criteriaQuery = criteriaBuilder.createQuery(UserEntity.class);
			Root<UserEntity> rootUser = criteriaQuery.from(UserEntity.class);
			
			criteriaQuery.select(rootUser).where(criteriaBuilder.equal(rootUser.get("userEmail"), emailId));
			
			
			Query<UserEntity> hibQuery = hibSession.createQuery(criteriaQuery);
			singleUserDetail = hibQuery.getSingleResult();
			
			if(emailId.equals(singleUserDetail.getUserEmail()) && password.equals(singleUserDetail.getUserPassword())){
				
				return singleUserDetail;
			}
			else {
				return null;
			}
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("Error while retrieving User Details!"+ex.getMessage());
			
		}
		System.out.println("finally");
		return singleUserDetail;
	}


	
	
}

























