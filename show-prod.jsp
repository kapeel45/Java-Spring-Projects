<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" 
       uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show Product</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 <style>
 #quantity { padding:5px; width:35px; border: 1px solid #555; }
 
 .span3{
  	float: left;
  	margin: 50px;
  }
 </style>
 
 <script>
 
 $(document).ready(function(){
	    
	 $("#cartdiv").hide();
	 
	 $("#cart").click(function(){
	       //adding cart funtion to collection
	       $("#cartdiv").show();
	    });
 });
		
 </script>
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</head>
<body>


<% 
	  HttpSession session1=request.getSession(true); 
	  String userName=(String) session1.getAttribute("uname").toString();
	  String productName = request.getParameter("param1").toString();
	  String price = request.getParameter("param2").toString();
	  String desc = request.getParameter("param3").toString();
	  String quant = request.getParameter("param4").toString();
	  
	%> 
	

 <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">ShopShop.com</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li><a href="shop">Home</a></li>
        <li class="active"><a href="#" >Hello, <%=userName %>!</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        <li>
        <a href="logout"><span class="glyphicon glyphicon-log-out"></span> Log-out</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
	<br><br>
	
	<div class="page-header" class="center-block" >
        <h1><%= productName %></h1>
      </div>
      <form action="shop" >
      <input type = "submit" class="btn btn-primary" value="Go Back"/>
      </form>
      <p></p>

      
      <div class="row" >
      <div class="col-sm-4" style="float:center">
      	<div class="panel panel-info" >
            <div class="panel-heading">
              <h3 class="panel-title"><%= productName %> Detail</h3>
            </div>
           <div class="panel-body">
	            <table border = "0">
				<tr>
				<form name="modelDetail1" method="POST" action="showCart">
				 <input type="hidden" name = "userName" value="<%= userName %>">
				 <p><input type="hidden" name = "productName" value="<%= productName %>"><%= productName %></p>
				 <p><input type="hidden" name = "description" value="<%= desc %>"><%= desc %></p>
				 <p><input type="hidden" name= "price" value="<%= price %>"><%= price %></p>
				 <p>Select Quantity <input min="1" max = "<%= quant %>" type="number" value = "1" id="quantity" name="quantity"/></p>
				
				<input type="hidden" name="action" value="add">
				<input type = "submit" id = "cart" class="btn btn-primary" value="Add to Cart"/>
				</form>
				</tr>
				<tr>
				<form method="POST" action="order">
				<input style= "float: right;" type = "submit" class="btn btn-success" value="Place Order"/>
				</form>
				</tr>
				</table>
			</div>
		</div><!-- /.col-sm-4 -->
      </div>
      </div>

      <hr>
       <footer id="footer">
            <div class="row-fluid">
                <div class="span3">
                    <p> 
                        <a href="http://twitter.com" rel="nofollow" title="Bootply on Twitter" target="ext">Twitter</a><br>
                        <a href="https://plus.google.com" rel="publisher">Google+</a><br>
                        <a href="http://facebook.com"  title="Bootply on Facebook" target="ext">Facebook</a><br>
                        <a href="https://github.com" title="Bootply on GitHub" target="ext">GitHub</a><br>
                    </p>
                </div>
              
                <div class="span3">
                    <p>
                        <a href="#">Privacy</a><br>
                        <a href="#">Terms</a><br><br>
                        <span class="pull-right">Copyright 2015-2016 <a href="/">localhost</a></span>
                    </p>
                    
                </div>
            </div>
        </footer>
</body>
</html>
