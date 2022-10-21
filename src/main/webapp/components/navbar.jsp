<%-- <%@page import="com.deloitte.entities.User"%> --%>
<%@page import="com.deloitte.entities.UserEntity"%>
<%@page import="com.deloitte.entities.CategoryEntity"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
    UserEntity userSession = (UserEntity) session.getAttribute("User");
 
 %>   
    
<%-- <%
	User u1 = (User) session.getAttribute("current-user");
%>
     --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
		<div class="container">
			  <a class="navbar-brand" href="index.jsp">De-Kart</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active">
			        <a class="nav-link" href="index.jsp">Home</a>
			      </li>
			<%-- 	<% if(null != u1){ %> --%>
			      <li class="nav-item dropdown">
			     <!--    <a class="nav-link dropdown-toggle" href="index.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          Categories
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="#">Action</a>
			          <a class="dropdown-item" href="#">Another action</a>
			          <div class="dropdown-divider"></div>
			          <a class="dropdown-item" href="#">Something else here</a>
			        </div> -->
			        
			         <%if(null !=session.getAttribute("User") &&userSession.getUserRole().equals("user")){%>
			         
			         <a class="nav-link dropdown-toggle" href="index.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          Categories
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <%
			          List <CategoryEntity> categoryList=null;
			            if( null!=request.getAttribute("categoryList"))
			            {
			            	categoryList=(List<CategoryEntity>)request.getAttribute("categoryList");
			            	for(CategoryEntity c:categoryList)
			            	{%>
			            		<a class="dropdown-item" href="AdminServlet?category= <%=c.getCategoryId()%>">  <%=c.getCategoryName()%></a>
			            <%	}
			            	
			            }
			         
			        
			         
			            
			       } %>
			        
			      </li>
			    <%-- <% } %> --%>  
			    </ul>
			    
			    <ul class="navbar-nav ml-auto">
			    

			    
			    <%-- 	<% if(null == u1){ %> --%>
			            <% if(null ==session.getAttribute("User")){ %>
			    		
			    		<li class="nav-item active">
				       		 <a class="nav-link" href="login.jsp">Login</a>
				      	</li>
				    	<li class="nav-item active">
				       		 <a class="nav-link" href="register.jsp">Register</a>
				      	</li>
				      	<%} %>
			    		
			    	<%-- <% }  else { %> --%>
			    		<%if(null!=userSession){ %>
			    		
				    	<li class="nav-item active">
					       		 <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart">
					       		 	<i class="fas fa-shopping-cart" style="font-size: 18px"></i>
					       		 	<span class="ml-0 cart-items" style="font-size: 18px">(0)</span>
					       		 </a>
					     </li>
			    		
			    		
			    		<li class="nav-item active">
			    		
				       		 <a class="nav-link font-weight-bold" href="#"> Welcome : <%=userSession.getUserName()%> </a>
				      	</li>
				    	<li class="nav-item active">
				       		 <a class="nav-link" href="LogoutServlet">Logout</a>
				       		 <!-- here, we are invoking servlet from link -->
				      	</li> 
				      	<%} %>
			    <%-- 	<% } %> --%>
			    
				      	
			    </ul>
			  </div>
		 </div>
	</nav>
</body>
</html>


