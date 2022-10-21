package com.deloitte.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.deloitte.dao.UserDAO;
import com.deloitte.entities.UserEntity;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserEntity userInputValues=new UserEntity();
		
		userInputValues.setUserAddress(request.getParameter("address"));
		userInputValues.setUserEmail(request.getParameter("emailId"));
		userInputValues.setUserName(request.getParameter("userName"));
		userInputValues.setUserPassword(request.getParameter("password"));
		userInputValues.setUserPhone(Integer.parseInt(request.getParameter("phone")));
		
		
		//assign role here based on emailId//
		
		//(or)userInputValues.getUserEmail().contains(getServletInfo())
		if(request.getParameter("emailId").contains("@deloitte"))
		{
			userInputValues.setUserRole("admin");
		}
		else
			userInputValues.setUserRole("user");
			
		
		
		//System.out.println(request.getParameter("address"));

		UserDAO userDBOperation = new UserDAO();
		
		boolean userRegDetailsSaved= userDBOperation.saveUserRegDetails(userInputValues);
		
		System.out.println("user details saved status: "+userRegDetailsSaved);
		
		if(userRegDetailsSaved)
		{
			request.setAttribute("RegistrationSuccessful", "User::"+userInputValues.getUserName()+"::Reg Successful");
			//add the same in .jsp also
			//TODO: Direct to some page
			//Sending response back to browser
			request.getRequestDispatcher("register.jsp").forward(request, response);
		    //send response back to a certain component that is in other server
			//response.sendRedirect(getServletInfo());//like amazon link with bank
			
		}
		
		else
		{
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
