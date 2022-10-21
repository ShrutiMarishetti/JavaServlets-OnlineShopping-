<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

<%-- <%@page import="com.deloitte.entities.Category"%> --%>
<%@page import="com.deloitte.dao.CategoryDAO"%>
<%-- <%@page import="com.deloitte.entities.Product"%> --%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@page import="com.deloitte.dao.ProductDAO"%>
<%@page import="com.deloitte.entities.CategoryEntity"%>
<%@page import="com.deloitte.entities.ProductEntity"%>
<%-- <%@page import="com.deloitte.util.HibernateHelper"%> --%>


    
<%-- <%
	User u = (User) session.getAttribute("current-user");

	if(u == null){
		session.setAttribute("warning", "You are not logged in!! Login first");
		response.sendRedirect("login.jsp");
		return;
	} 
%>    
 --%>    
<!DOCTYPE html>
<html>
	<%-- <head>
		<meta charset="UTF-8">
		<title>About Us</title>		
		<%@include file="components/common.jsp"%>		
	</head>
	
	<body>
		<%@include file="components/navbar.jsp"%>
		<h1>This is HOME PAGE</h1>
	</body> --%>
	
	<head>
	
		<!-- Required Tag -->
		<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
		<title>eCommerce Application</title>
		<%@ include file="components/common.jsp"%>
	</head>
		<style>
	
	.custom-bg{
	  background: #f4511e!important;
	}
	
	.jumbotron {
	  background-color: #f4511e; /* Orange */
	  color: #ffffff;
	  border-top: solid;
	}
	
	
	/* Add an orange color to all icons and set the font-size */
	.logo-small {
	  color: #f4511e;
	  font-size: 50px;
	}
	
	.carousel-control-next {
	  background-image: linear-gradient(to right, rgba(244, 81, 30,0.2), rgba(244, 81, 30,100));
	  color: #f4511e;
	}
	
	.carousel-control-prev{
	  background-image: linear-gradient(to left, rgba(244, 81, 30,0.2), rgba(244, 81, 30,100));
	  color: #f4511e;
	}
	
	.carousel-indicators li {
	  border-color: #f4511e!important;	  
	}
	
	.carousel-indicators li.active {
	  background-color: #f4511e;
	}
	
	.carousel-item h4 {
	  font-size: 19px;
	  line-height: 1.375em;
	  font-weight: 400;
	  font-style: italic;
	  margin: 70px 0;
	}
	
	.carousel-item span {
	  font-style: normal;
	}
	
	footer {
	  padding-top: 10px;
	  background-color: #f4511e;/*#292c2f;*/
	  color: white;
	}
	
	footer a {
	  color: white;
	  /*text-decoration:none;*/
	}
	
	footer a:hover, footer a:focus {
	  color: #aaa;
	  text-decoration:none;
	  border-bottom:1px dotted #999;
	}
	
	footer .form-control {
	    background-color: white;
	    box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.9);
	    border: none;
	    resize: none;
	    color: #d1d2d2;
	    padding: 0.7em 1em;
	}
	</style>
	
	<body>
		<%@ include file="components/navbar.jsp"%>	
		 
					   <%   String catId = request.getParameter("category");
					   
					        List <CategoryEntity> categoryList=null;
					        List <ProductEntity> productList=null;
						        if(null!=request.getSession().getAttribute("categoryList")||null!=request.getAttribute("productList"))
						        {
						        	categoryList=(List<CategoryEntity>)request.getSession().getAttribute("categoryList");
						        
						        	productList=(List<ProductEntity>)request.getAttribute("productList");			
						        }
					    %>
					     
		
	
		<div class="container-fluid">
			<div class="row mt-3 mx-2">
				
				<!-- display Categories  -->
				<div class="col-md-2">
				
					<div class="list-group">
					
					
						 <%
							String isAllProductsActive="";
							if("All".equals(catId) || "".equals(catId) || null == catId) {
								isAllProductsActive = "active";
								if(null!=request.getSession().getAttribute("productList") )
								{
									productList=(List<ProductEntity>)request.getSession().getAttribute("productList");
								}
							} 
						%> 
					
					
					
						<a href="homepage.jsp?category=All" class="list-group-item list-group-item-action  <%=isAllProductsActive%> " aria-current="true">
						    All Categories
						</a>
				         <%    
								if(null!=categoryList && categoryList.size()>0)
								{%>
					           	<h5> Number of Categories ::: <%=categoryList.size()%>></h5>	
								<%}%>

																	
						<%	String categoryActive;
						 
						if(null!= categoryList){
							for(CategoryEntity c: categoryList){								
								if( !isAllProductsActive.equals("active") && c.getCategoryId()==Integer.parseInt(catId))  {
									System.out.println(catId);
									categoryActive = "active";
								} else {
									categoryActive = "";
								}
								
						%> 
								<a href="AdminServlet?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action  <%=categoryActive%> ">  <%=c.getCategoryName() %>  </a>
						
						 <%
						        
								categoryActive = "";
							}}
						%>	 
					</div>	
				</div>
				
				<!-- display Products  -->			
				<div class="col-md-10 mt-3">		
				
					<div class="row">
							<div class="col-md-12">
							
								<div class="card-columns">
									
									 <%
										if(null != productList && !productList.isEmpty()){
											
									
											for(ProductEntity p: productList){
									%> 
									        
												<div class="card product-card">
													
													<div class="container text-center">
														<img src="images/<%=p.getProductImage() %> " style="max-height: 200px; max-width: 100% ; width: auto" class="m-2" alt="Product_Image">
													</div>
													
													<div class="card-body">
														<h5 class="card-title" style="max-height: 125px;">
															  <%=p.getProductName()%>
														</h5>
														<p>
															 
														</p>
													</div>
													
													<div class="card-footer text-center">
														<button class="btn custom-bg text-white" onclick="add_to_cart( <%=p.getProductId()%>,'<%=p.getProductName()%>',<%=p.getProductPrice()%> )">Add to Cart</button>
														<button class="btn btn-outline-success">
															&#8377; <%=p.getProductDiscount()%> /- 
															<span class="text-secondary original-price"> <%=p.getProductPrice()%> </span> 
															<span class="text-secondary discount-label"> <%=p.getProductDiscount()%> % Off
															</span>
														</button>
													</div>
												</div>
						
									 <%
											}
											
										} else {
									%> 
												<div class="card-body">
														<h5 class="card-title" style="max-height: 125px;">
															 No Products for the Category
														</h5>
												</div>									
												
									 <%
										}
									%> 
									
								</div>
							
							</div>
					</div>
				
				</div>
			
			</div>
		</div>
	
		<%@include file="components/common_modals.jsp" %> 
			
	
	
	<footer>
			 <div class="container mt-5">
		        <div class="row">
		            <div class="col-md-5">
		                <h5><i class="fa fa-road"></i> De-Kart</h5>
		                <div class="row">
		                    <div class="col-6">
		                        <ul class="list-unstyled">
		                            <li><a href="">Product</a></li>
		                            <li><a href="">Benefits</a></li>
		                            <li><a href="">Partners</a></li>
		                            <li><a href="">Team</a></li>
		                        </ul>
		                    </div>
		                    <div class="col-6">
		                        <ul class="list-unstyled">
		                            <li><a href="">Documentation</a></li>
		                            <li><a href="">Support</a></li>
		                            <li><a href="">Legal Terms</a></li>
		                            <li><a href="">About</a></li>
		                        </ul>
		                    </div>
		                </div>
		                <ul class="nav">
		                    <li class="nav-item"><a href="" class="nav-link pl-0"><i class="fa fa-facebook fa-lg"></i></a></li>
		                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-twitter fa-lg"></i></a></li>
		                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-github fa-lg"></i></a></li>
		                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-instagram fa-lg"></i></a></li>
		                </ul>
		                <br>
		            </div>
		            <div class="col-md-2">
		                <h5 class="text-md-right">Contact Us</h5>
		            </div>
		            <div class="col-md-5">
		                <form>
		                    <fieldset class="form-group">
		                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
		                    </fieldset>
		                    <fieldset class="form-group">
		                        <textarea class="form-control" id="exampleMessage" placeholder="Message"></textarea>
		                    </fieldset>
		                    <fieldset class="form-group text-xs-right">
		                        <button type="button" class="btn btn-secondary-outline btn-lg">Send</button>
		                    </fieldset>
		                </form>
		            </div>
		        </div>
		    </div>
		 </footer>
	</body> 
	
</html>