package com.deloitte.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deloitte.dao.CategoryDAO;
import com.deloitte.dao.ProductDAO;
import com.deloitte.dao.UserDAO;
import com.deloitte.entities.CategoryEntity;
import com.deloitte.entities.ProductEntity;
import com.deloitte.entities.UserEntity;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
		UserEntity userEntityObj = null;
		
		
		UserDAO userDao = new UserDAO();
		userEntityObj = userDao.getUserDetails(userEmail, userPassword);
		
		if(null != userEntityObj) {
			
			HttpSession userSession = request.getSession();				
			userSession.setAttribute("User", userEntityObj);
			
			CategoryDAO categoryDao = new CategoryDAO();
			
			List<CategoryEntity> categoryList = categoryDao.getAllCategories();
			request.getSession().setAttribute("categoryList", categoryList);
			
			ProductDAO productDao = new ProductDAO();
			List<ProductEntity> productList = productDao.getAllProducts();
			request.getSession().setAttribute("productList", productList);
			
			
			if("admin".equalsIgnoreCase(userEntityObj.getUserRole())) {
				

				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
			else {
				
				request.getRequestDispatcher("homepage.jsp").forward(request, response);
			}
		}
		else {
			
			request.setAttribute("authentication", "Fail");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
