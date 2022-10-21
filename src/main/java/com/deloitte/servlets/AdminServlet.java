package com.deloitte.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.deloitte.dao.CategoryDAO;
import com.deloitte.dao.ProductDAO;
import com.deloitte.dao.UserDAO;
import com.deloitte.entities.CategoryEntity;
import com.deloitte.entities.ProductEntity;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void addProduct(HttpServletRequest request, HttpServletResponse response)
	{
	        ProductEntity browserInputValues=new ProductEntity();
	        
	        browserInputValues.setProductName(request.getParameter("productName"));
	        browserInputValues.setProductDesc(request.getParameter("productName"));
	        browserInputValues.setProductDiscount(Integer.parseInt(request.getParameter("productDiscount")));
	        browserInputValues.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
	        browserInputValues.setProductQty(Integer.parseInt(request.getParameter("productQty")));
	        browserInputValues.setProductImage(request.getParameter("productImage"));
	        browserInputValues.getProductCategory().setCategoryId(Integer.parseInt(request.getParameter("catId")));
	        
	        
	        ProductDAO productDao = new ProductDAO();
			ProductEntity productReturned = productDao.saveProductDetails(browserInputValues);
			
			request.setAttribute("productSaved", productReturned);
	}
    
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
		CategoryEntity catInputValues=new CategoryEntity();
	    CategoryDAO catDBOperation = new CategoryDAO();
	    
	    List <CategoryEntity> categoryList=catDBOperation.getAllCategories();
        request.setAttribute("categoryList", categoryList);
	    
        String userOperation =request.getParameter("operation");
        
        if("addProduct".equalsIgnoreCase(userOperation)) {
        	
        	addProduct(request,response);
        	
			
	//	  List<CategoryEntity> categoryList = catDBOperation.getAllCategories();
	//	  request.setAttribute("categoryList", categoryList);
			 
			
			request.getRequestDispatcher("admin.jsp").forward(request, response);
        	
        }
        else if(null!=request.getParameter("category"))//&& !"All".equals(request.getParameter("category")))
        {
        	String catId=request.getParameter("category");
        	CategoryDAO categoryDAO=new CategoryDAO();
        	
        	List<ProductEntity> catProductList=categoryDAO.getProductDetailsForCategory(Integer.parseInt(catId));
        	
        	//List <CategoryEntity> categoryList=categoryDAO.getAllCategories();
            //request.setAttribute("categoryList", categoryList);
        	
            request.setAttribute("productList", catProductList);
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
        	
        }
        
        else {
	    
        	catInputValues.setCategoryName(request.getParameter("catTitle"));
    		catInputValues.setCategoryDesc(request.getParameter("catDescription"));
    		
	    //save only if already doesn't exists
	    if(null!=catDBOperation.getCategoryDetails(request.getParameter("catTitle"), request.getParameter("catDescription")))
	    		{
				    	request.setAttribute("success", "categoryExists");
			        	request.getRequestDispatcher("admin.jsp").forward(request, response);
	    	
	    		}
	    else {
	    
		        CategoryEntity categoryObjReturned=catDBOperation.saveCategoryDetails(catInputValues);

		        
		        if(null!= categoryObjReturned)
		        {
			       // List <CategoryEntity> catgoryList=catDBOperation.getAllCategories();
			        //request.setAttribute("categoryList", catgoryList);
		        	
		        	request.setAttribute("success", "categorySaved");
		        	request.getRequestDispatcher("admin.jsp").forward(request, response);
		        }
		        else
		        {
		        	request.setAttribute("success", "categoryFailed");
		        	request.getRequestDispatcher("admin.jsp").forward(request, response);
		        }
		        //response.getWriter().append("Served at: ").append(request.getContextPath());
	    }
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
     
	
}
