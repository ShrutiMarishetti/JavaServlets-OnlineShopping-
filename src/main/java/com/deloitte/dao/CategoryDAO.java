package com.deloitte.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.criteria.HibernateCriteriaBuilder;

import com.deloitte.entities.CategoryEntity;
import com.deloitte.entities.ProductEntity;
import com.deloitte.entities.UserEntity;
import com.deloitte.util.HibernateSessionFactoryUtil;

public class CategoryDAO {
	
	public CategoryEntity saveCategoryDetails(CategoryEntity catEntry)
	{
		
		
		CategoryEntity returncategoryValues =null;
		
		try {
			Session dbSession = HibernateSessionFactoryUtil.getSessionFactoryInstance().openSession();
			Transaction dbTransaction = dbSession.beginTransaction();
			dbSession.save(catEntry);
			dbTransaction.commit();
			dbSession.close();
			returncategoryValues = catEntry;
		}catch(Exception ex) {
			
			ex.printStackTrace();
			System.out.println("Error while saving cat registration details ==>"+ ex.getMessage());
			
		}
		
		
		
		
		return returncategoryValues;
	}
	

	public CategoryEntity getCategoryDetails(String categoryName, String CategoryDesc)
	{
		CategoryEntity singleCategoryDetails=null;
		  try { 
				 
		  Session hibSession =  HibernateSessionFactoryUtil.getSessionFactoryInstance().openSession();
		  
		  CriteriaBuilder criteriaBuilder = hibSession.getCriteriaBuilder();
		  CriteriaQuery<CategoryEntity>criteriaQuery =  criteriaBuilder.createQuery(CategoryEntity.class); 
		  Root<CategoryEntity> rootUser =	  criteriaQuery.from(CategoryEntity.class);
		  
		  criteriaQuery.select(rootUser).where(criteriaBuilder.equal(rootUser.get("categoryName"), categoryName));
		  
		  Query<CategoryEntity>hibQuery = hibSession.createQuery(criteriaQuery);
		  singleCategoryDetails = hibQuery.getSingleResult();
		  
			  if(categoryName.equals(singleCategoryDetails.getCategoryName())){// && CategoryDesc.equals(singleCategoryDetails.getCategoryDesc())) {
			       return singleCategoryDetails;
				  //userAuthenticationSuccess = true;
			  }
		  }catch(Exception ex) {
		  
			  	System.out.println("Error while retrieving cat registration details ==>"+ex.getMessage());
		  }
		 
		return singleCategoryDetails;
		
	}
	//////////////////////////////////////
	public boolean isPresent(String categoryName, String CategoryDesc) {
		
		boolean presence = false;
		CategoryEntity singleCategoryDetails=null;
		  try { 
				 
		  Session hibSession =  HibernateSessionFactoryUtil.getSessionFactoryInstance().openSession();
		  
		  CriteriaBuilder criteriaBuilder = hibSession.getCriteriaBuilder();
		  CriteriaQuery<CategoryEntity>criteriaQuery =  criteriaBuilder.createQuery(CategoryEntity.class); 
		  Root<CategoryEntity> rootUser =	  criteriaQuery.from(CategoryEntity.class);
		  
		  criteriaQuery.select(rootUser).where(criteriaBuilder.equal(rootUser.get("categoryName"), categoryName));
		  
		  Query<CategoryEntity>hibQuery = hibSession.createQuery(criteriaQuery);
		  singleCategoryDetails = hibQuery.getSingleResult();
		  
			  if(categoryName.equals(singleCategoryDetails.getCategoryName()) && CategoryDesc.equals(singleCategoryDetails.getCategoryDesc())) {
			       presence =true;
				  //userAuthenticationSuccess = true;
			  }
		}
		catch(Exception ex) {
			  
			System.out.println("Error while retrieving cat registration details ==>"+ex.getMessage());
		 }
		 
		return presence;

	}
	////////////////////////////
	public List<CategoryEntity> getAllCategories() {
		
		List<CategoryEntity> categoryList=new ArrayList<CategoryEntity>();
		try {
			 
			Session dbSession= HibernateSessionFactoryUtil.getSessionFactoryInstance().openSession();
			
			 CriteriaBuilder criteriaBuilder = dbSession.getCriteriaBuilder();
			 CriteriaQuery <CategoryEntity>criteriaQuery =  criteriaBuilder.createQuery(CategoryEntity.class); 
			 Root<CategoryEntity> rootUserCategories =	  criteriaQuery.from(CategoryEntity.class);
			  
			 criteriaQuery.select(rootUserCategories);
			  
			 Query<CategoryEntity>hibQuery = dbSession.createQuery(criteriaQuery);
			 categoryList = hibQuery.getResultList();
			 return categoryList;
			
		}
		catch(Exception ex)
		{
			System.out.println("Error while retrieving cat details");
			
		}
		return categoryList;
		
	}


	public List<ProductEntity> getProductDetailsForCategory(int catId) {
		// TODO Auto-generated method stub
		List<ProductEntity> productListForCat=null;
		
		try
		{
			Session dbSession= HibernateSessionFactoryUtil.getSessionFactoryInstance().openSession();
		
			 CriteriaBuilder criteriaBuilder = dbSession.getCriteriaBuilder();
			 CriteriaQuery <CategoryEntity>criteriaQuery =  criteriaBuilder.createQuery(CategoryEntity.class); 
			 Root<CategoryEntity> rootUserCategories =	  criteriaQuery.from(CategoryEntity.class); 
			 criteriaQuery.select(rootUserCategories).where(criteriaBuilder.equal(rootUserCategories.get("categoryId"), catId));
			 Query<CategoryEntity>hibQuery = dbSession.createQuery(criteriaQuery);
			 CategoryEntity category= hibQuery.getSingleResult();
			 productListForCat=category.getProductList();
			
			
		}
		catch(Exception ex)
		{
			System.out.println("Error while retrieving products for cat ");
			
		}
		return productListForCat;
		}

	


}
