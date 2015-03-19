<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Cart</title>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style>
.span3{
  	float: left;
  	margin: 50px;
  }
  </style>
</head>
<body>
<%
String userName = null;

Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
    if(cookie.getName().equals("user")) userName = cookie.getValue();
	}
}

%>

<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">ShopShop.com</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li><a href="shop">Home</a></li>
        <li class= "active"><a href="#"><%=userName %>!</a></li>
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
<br><hr>

<p><font face="Verdana, Arial, Helvetica, sans-serif"><strong>Shopping Cart</strong></font></p>

<table width="75%" class="table table-bordered">
  <tr bgcolor="#CCCCCC">
    <td><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Model Description</font></strong></td>
    <td><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Quantity</font></strong></td>
    <td><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Unit Price</font></strong></td>
    <td><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Total</font></strong></td>
  </tr>
  
  <jsp:useBean id="cart" scope="session" class="com.aloha.model.CartBean" />
  <c:if test="${cart.lineItemCount==0}">
  <td colspan="4">
  <font size="2" face="Verdana, Arial, Helvetica, sans-serif">- Cart is currently empty -</font><br/>
  </tr>
  </c:if>

  <c:forEach var="cartItem" items="${cart.cartItems}" varStatus="counter">
	  <form name="item" method="POST" action="showCart">
		<tr>
	    <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
	    <b><c:out value="${cartItem.partName}"/></b><br/>
	    <c:out value="${cartItem.modelDescription}"/>
	    </font>
	    </td>
	    <td>
	    <font size="2" face="Verdana, Arial, Helvetica, sans-serif">
	    <input type='hidden' name='itemIndex' value='<c:out value="${counter.count}"/>'>
	    <input type='text' disabled name="quantity" value='<c:out value="${cartItem.quantity}"/>' size='2'>
	    <p><input style = "float:left;" type="submit" name="action" class="btn btn-primary" value="Delete"></p></font>
	    </td>
	    <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">$<c:out value="${cartItem.unitCost}"/></font></td>
	    <td><mark><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
	    $<c:out value="${cartItem.totalCost}"/>
	    </font></mark></td>
	  	</tr>
	  </form>
	  
  </c:forEach>
  <tr>
    <td colspan="2"> </td>
    <td></td>
    <td>
    <mark><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Subtotal: $<c:out value="${cart.orderTotal}"/>
    </font></mark></td>
  </tr>
</table>
	<form method="POST" action="order">
		<input style = "float:right;"type = "submit" class="btn btn-success" value= "Place Order">
	</form>
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
