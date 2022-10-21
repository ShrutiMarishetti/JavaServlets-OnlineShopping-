package com.deloitte.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


import com.deloitte.entities.ProductEntity;
import com.deloitte.util.HibernateSessionFactoryUtil;

public class ProductDAO {
	
	public ProductEntity saveProductDetails(ProductEntity inputProductValues) {
		
		ProductEntity returningSavedProduct = null;
		try {
			
			Session dbSession = HibernateSessionFactoryUtil.getSessionFactoryInstance().openSession();
			Transaction dbTransaction = dbSession.beginTransaction();
			dbSession.save(inputProductValues);
			dbTransaction.commit();
			dbSession.close();
			
			returningSavedProduct = inputProductValues;
		}
		catch(Exception ex) {
			
			ex.printStackTrace();
			System.out.println("Error while saving Product");
		}
		return returningSavedProduct;
	}

	public List<ProductEntity> getAllProducts() {
		
		List<ProductEntity> productList=new ArrayList<ProductEntity>();
		try {
			 
			Session dbSession= HibernateSessionFactoryUtil.getSessionFactoryInstance().openSession();
			
			 CriteriaBuilder criteriaBuilder = dbSession.getCriteriaBuilder();
			 CriteriaQuery <ProductEntity>criteriaQuery =  criteriaBuilder.createQuery(ProductEntity.class); 
			 Root<ProductEntity> rootUserCategories =	  criteriaQuery.from(ProductEntity.class);
			  
			 criteriaQuery.select(rootUserCategories);
			  
			 Query<ProductEntity>hibQuery = dbSession.createQuery(criteriaQuery);
			 productList = hibQuery.getResultList();
			 return productList;
			
		}
		catch(Exception ex)
		{
			System.out.println("Error while retrieving product details");
			
		}
		return productList;
		
	}
}

