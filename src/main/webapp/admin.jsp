<%@page import="com.deloitte.entities.CategoryEntity"%>
<%@page import="com.deloitte.entities.ProductEntity"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%-- <%
	User u = (User) session.getAttribute("current-user");

if (u == null) {
	session.setAttribute("warning", "You are not logged in!! Login first");
	response.sendRedirect("login.jsp");
	return;
} else if ("enduser".equals(u.getRole())) {
	session.setAttribute("warning", "You are not an Admin!! No access to this page");
	response.sendRedirect("homepage.jsp");
	return;
}
%> --%>

<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<%@include file="components/common.jsp"%>
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
	<%@include file="components/navbar.jsp"%>
	

	<div class="container admin">
		
		<div class=" mt-3">
			<%-- <%@include file="components/response.jsp"%> --%>
		</div>
							     <!-- dao invocation shouldn't be in jsp not a good practce -->
					     <%
					        List <CategoryEntity> categoryList=null;
					        List <ProductEntity> productList=null;
					        if(null!=request.getAttribute("categoryList")|| null!=request.getAttribute("productList"))
					        {
					        	categoryList=(List<CategoryEntity>)request.getAttribute("categoryList");
					        	productList=(List<ProductEntity>)request.getAttribute("productList");
					        			
					        }
					     
					     
					     %>
		
		<!-- First row -->
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								src="images/users.png" alt="user_icon" />
						</div>
						<h3>12345</h3>
						
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								src="images/list.png" alt="list_icon" />
						</div>
						
						<%if(null!=categoryList)
						{%>
							<h3><%=categoryList.size() %></h3>
					<%	}
						%>
					<!-- <h3>12345</h3> -->	
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								src="images/product.png" alt="product_icon" />
						</div>
								<%if(null!=productList)
						{%>
							<h3><%=productList.size() %></h3>
					<%}
						%>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>


		</div>

		<!-- Second row -->
		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card border-dark" data-toggle="modal" data-target="#add-category-modal">
					
	         	   <%if(null!=request.getAttribute("success")&&"categorySaved".equalsIgnoreCase((String)request.getAttribute("success"))) 
					   {%>
					   <h5 style="color:green"> Category Details saved successfully</h5>
					   <%} %>
					   
					  <%if(null!=request.getAttribute("success")&&"categoryExists".equalsIgnoreCase((String)request.getAttribute("success"))) 
					   {%>
					   <h5 style="color:orange"> Category already exists</h5>
					   <%} %> 
					   
					   <%if(null!=request.getAttribute("success")&&"categoryFailed".equalsIgnoreCase((String)request.getAttribute("success"))) 
					   {%>
					   <h5 style="color:red"> Category addition failed</h5>
					   <%} %> 
			 
					   
					   
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								src="images/plus.png" alt="plus_icon" />
						</div>
						<h3 class="mt-4">Click here to Add new Category</h3>
						<h1 class="text-uppercase text-muted">Add Category</h1>
				
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card border-dark"  data-toggle="modal" data-target="#add-product-modal">
				<%if(null!= request.getAttribute("productSaved")){
					ProductEntity savedProduct = (ProductEntity) request.getAttribute("productSaved");
				%>
				
					<h4 style = "color: green">Product <%= savedProduct.getProductName() %> succesfully added</h4>
				<%} %>
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid"
								src="images/addProduct.png" alt="addProduct_icon" />
						</div>
						<h3 class="mt-4">Click here to Add new Product</h3>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>

		</div>


	</div>


	<!-- Category Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form action="AdminServlet" method="post">
					
						<input type="hidden" name="operation" value="addCategory"/>
					
						<div class="form-group">
								<input type="text" class="form-control" name="catTitle" placeholder="Enter Category title" required/> 
						</div>
						
						<div class="form-group">
								<textarea style="height: 150px" class="form-control" name="catDescription" placeholder="Enter Category Description" required></textarea> 
						</div>
						
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
								
			</div>
		</div>
	</div>
	
	
	
	<!-- Product Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form action="AdminServlet" method="post" >  <!--  enctype="multipart/form-data"-->
						
						<input type="hidden" name="operation" value="addProduct"/>
					
						<div class="form-group">
								<input type="text" class="form-control" name="productName" placeholder="Enter Product Name" required/> 
						</div>
						
						<div class="form-group">
								<textarea style="height: 150px" class="form-control" name="productDescription" placeholder="Enter Product Description" required></textarea> 
						</div>
						
						<!-- <div class="form-group">
							<div class="container">
								<div class="row">
									<div class="col-md-6"><textarea style="height: 150px" class="form-control" name="catDescription" placeholder="Enter Category Description" required></textarea></div>
									<div class="col-md-3"><input type="text" class="form-control" name="productQty" placeholder="Quantity"/></div>
									<div class="col-md-3"><input type="text" class="form-control" name="productQty" placeholder="Discount"/></div>
								</div>
							</div>
								<input type="text" class="form-control" name="productQty" placeholder="Enter Product Quantity"/>
								<input type="text" class="form-control" name="productDiscount" placeholder="Enter Product Discount"/> 
						</div> -->
						
						<div class="form-group">
								<input type="text" class="form-control" name="productPrice" placeholder="Enter Product Price" required> 
						</div>
						
						<div class="form-group">
								<input type="text" class="form-control" name="productDiscount" placeholder="Enter Product Discount" required> 
						</div>
						
						<div class="form-group">
								<input type="text" class="form-control" name="productQty" placeholder="Enter Product Qty" required> 
						</div>
						
						<div class="form-group">
								<select name="catId" class="form-control">
									
								<%
								if(null!=categoryList)
								{
									for(CategoryEntity catObj:categoryList)
									{%>
									
									<option value="<%=catObj.getCategoryId() %>"><%=catObj.getCategoryName() %>
										
									<%}
								}
								
								%>
									
								</select>
						</div>
						
						<div class="form-group">
								<label for="productImage" > Select The Product Image</label>
								<input type="file" class="form-control" id="productImage" name="productImage" placeholder="Enter Product Discount" required> 
						</div>
						
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
								
			</div>
		</div>
	</div>
	
	<%-- <%@include file="components/common_modals.jsp" %> --%>
	
	
	
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