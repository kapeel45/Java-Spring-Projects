<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


<%@page import="com.aloha.model.Login"%>  
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>Welcome to Shop</title>
<!-- CSS Internal Styling -->
<style>

#imgSize {
display: block;
width: 100% \9;
max-width: 100%;
height: 322px;
}

.span3{

float: left;
margin: 50px;
}

#shop1 {

	margin: 50px;
}


table {
    border-collapse: collapse;
    width: 100%;
}
table,td {
   align: center;
   height: 50px;
}

#order{
	float: right;

}

	#order:hover {
	background: 
  	
}
#mob:hover{
box-shadow: inset 0 0 0 5px #3071A9;
}
</style>

<script>
$(document).ready(function(){
    
	$("#mobile1").hide();
	
	$("#laptop1").hide();
	$("#computer1").hide();
	$("#kartdiv").hide();
	
    $("#mob").click(function(){
        $("#mobile1").show();
        $("#laptop1").hide();
    	$("#computer1").hide();
    });
    
    $("#lap").click(function(){
        $("#laptop1").show();
        $("#mobile1").hide();
    	$("#computer1").hide();
    });
    
    $("#comp").click(function(){
        $("#computer1").show();
        $("#mobile1").hide();
    	$("#laptop1").hide();
    });
    $("#cart").click(function(){
       //adding cart funtion to collection
       $("#kartdiv").show();
    });
});
</script>
</head>
<body>

<form action="order" method="post">
    
        
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">ShopShop.com</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li class="active"><a href="#">${message}!</a></li>
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
<br><br><br>
   
      <div class="page-header">

      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img src="<c:url value='/resources/image/Asus.jpg'/>" alt="First slide"/>
          </div>
          <div class="item">
            <img src="<c:url value='/resources/image/samsungNote1.jpg'/>" alt="Second slide">
          </div>
          <div class="item">
            <img src="<c:url value='/resources/image/motoe1.jpg'/>" alt="Third slide">
          </div>
        </div>
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
   
  </div>
     
    
    
    <div id="shop1">
    <input type="button" id = "mob" class="btn btn-primary" value ="Mobile Shopping">
    <input type="button" id= "lap" class="btn btn-primary" value= "Laptop Shopping">
    <input type="button" id ="comp" class="btn btn-primary" value="Computer Accessories Shopping">
    <input type="submit" id="order" class="btn btn-success" value="Place Order"/>
    </div>
    
    <hr>

<div id="mobile1" class="row">
<c:forEach items="${products}" var="product" varStatus="counter">
<div class="col-sm-12 col-xs-12 col-md-4 col-lg-4">
    <div class="thumbnail bootsnipp-thumb">
	    <div>
	    	<p class="pull-right view-counts hidden-md">
	    		<a href="#" class="tip" data-toggle="tooltip" title="Viewed">21.4K <i class="icon-eye-open"></i></a> 

	    		<a href="#" class="tip" data-toggle="tooltip" title="Favorited">34 <i class="icon-thumbs-up"></i></a> 
	    		<a href="#"><span class="label label-info tip" data-toggle="tooltip" title="Bootstrap version">3.1.0</span></a>
	    	</p>
	    	<p class="lead snipp-title">
	    		<a href="showProduct?param1=${product.name}&param2=${product.price}&param3=${product.description}&param4=${product.quant}">${product.name}</a>
	    	</p>
	    </div>
	    <a href="#">
    		<img  id ='imgSize'class="lazy" src="<c:url value='${product.imagePath}'/>" alt="Easy Sticky Footer">
    	</a>
    	<div class="caption">
        	<p><a href="showProduct?param1=${product.name}&param2=${product.price}&param3=${product.description}&param4=${product.quant}" class="btn btn-primary btn-lg btn-block">Show Detail</a></p>
     		<p><strong>${product.name}</strong></p>
	        <p>Available: ${product.quant} </p>
	   		<p><strong>Price: $ ${product.price}</strong></p>
    	</div>
    </div>
	</div>
  	</c:forEach>
    </div>
 

    <div id="laptop1" class="row">
    <div class="col-sm-4">
    <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Title</h3>
            </div>
           <div class="panel-body">
	    		<div class="col-sm-4">
	            <p><strong>Asus LP5189</strong></p>
	            <p>Available: 4 </p>
	   			<p>Price: $340</p>
	   			</div>
           </div>       
          </div>
   </div><!-- /.col-sm-4 -->
     <div class="col-sm-4">
    	<div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Title</h3>
            </div>
         <div class="panel-body">
   		<div class="col-sm-4">
           <p><strong>Samsung Kp8i92</strong></p>
           <p>Available: 3 </p>
  			<p>Price: $400</p>
  			</div>
         </div>       
          </div>
 	</div><!-- /.col-sm-4 -->
	 	<div class="col-sm-4">
	 	<div class="panel panel-info">
	        <div class="panel-heading">
	          <h3 class="panel-title">Title</h3>
	        </div>
		 	<p><strong>Sony viao 89i</strong></p>
		 	<p>Available: 3 </p>
		 	<p>Price: $390</p>
	    </div>
	    </div><!-- /.col-sm-4 -->
    </div>
    
    
    <div id="computer1" class="row">
    <div class="col-sm-4">
    <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Title</h3>
            </div>
           <div class="panel-body">
	    		<div class="col-sm-4">
	            <p><strong>Screen guard</strong></p>
	            <p>Available: 8 </p>
	   			<p>Price: $2</p>
	   			</div>
           </div>       
          </div>
   </div><!-- /.col-sm-4 -->
     <div class="col-sm-4">
    	<div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Title</h3>
            </div>
         <div class="panel-body">
   		<div class="col-sm-4">
           <p><strong>Mouse</strong></p>
           <p>Available: 3 </p>
  			<p>Price: $11</p>
  			</div>
         </div>       
          </div>
 	</div><!-- /.col-sm-4 -->
	 	<div class="col-sm-4">
	 	<div class="panel panel-info">
	        <div class="panel-heading">
	          <h3 class="panel-title">Title</h3>
	        </div>
	         <div class="panel-body">
   			 <div class="col-sm-4">
		 	<p><strong>Key Board</strong></p>
		 	<p>Available: 3 </p>
		 	<p>Price: $20</p>
		 	</div>       
          </div>
	    </div>
	    </div><!-- /.col-sm-4 -->
    
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
                </div>
            </div>
        </footer>
</form>
</body>
</html>
