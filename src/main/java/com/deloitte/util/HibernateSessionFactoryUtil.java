package com.deloitte.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateSessionFactoryUtil {
             
	   //singleton design pattern
	 private static SessionFactory hibernateSessionFactory;
	 
	 private HibernateSessionFactoryUtil() //stops using new itself
	 {
		 
	 }
	 
	 public static SessionFactory getSessionFactoryInstance() {
		 
		 if(null == hibernateSessionFactory)
		 {
			 hibernateSessionFactory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			 
		 }
		 return hibernateSessionFactory;
		 
	 }
	 
}
