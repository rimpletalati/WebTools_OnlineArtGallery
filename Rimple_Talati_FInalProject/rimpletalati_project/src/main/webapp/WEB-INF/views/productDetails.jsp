<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
	<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<c:url value="/js/productDetails.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/custHomePage.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/productDetails.css"/>" />
<title>Art Gallery Home Page</title>
<style>
</style>

<script>
	/* $(document).ready(function(){
	
	
	 $('.paintingImg').mouseover(function(){
	 $('.addToCartbtn').show();
	 })
	 $('.paintingImg').mouseout(function(){
	 $('.addToCartbtn').hide();
	 })
	
	 }) */
</script>
</head>
<body>

	<div class="container">
		<div class="row myheader">
			<div class="col-lg-6 header">
				<a href="goToHomepage.go">
					<p>ART GALLERY</p>
					<p class="headerP">bove & Beyond</p>
				</a>
			</div>
			<div class="col-lg-6">
				<form action="logout.go" method="get" class="text-right">
					<input type="submit" class="btn btn-warning" value="Logout" />
				</form>
			</div>
			<div class="col-lg-6 logBtn ">
				<form action="viewmycart.go" method="get" class="cart text-right">
					<input type="submit" class="btn btn-warning cartImg"
						value="My cart" />
				</form>
			</div>
		</div>

		<div class="row detailsRow">
			<form action="addToCart.htm" method="post" id="productDetailsForm">

				<input type="hidden" name="productID"
					value=${requestScope.product.paintingId}>

				<!-- ---------image------- -->
				<div class="col-lg-6 paintingImgDiv">
					<!-- <input type="submit" class="btn addToCartbtn " value=""/> -->
					<div class="imageDiv">
						<img alt="prod" class="paintingImg magnify"
							src="resources/images/${requestScope.product.path}" width="80%"
							height="350px">
					</div>
				</div>
				<!-- ---------image------- -->


				<div class="col-lg-6 pull-left">
					<h3>Painting Name:</h3>
					<p>${requestScope.product.name}</p>
					<h3>Price:</h3>
					<p>${requestScope.product.price}</p>
					<%-- <h3>Quantity:</h3> <p>${requestScope.product.quantity}</p> --%>
					<h3>Description:</h3>
					<p>${requestScope.product.description}</p>
				</div>

				<input type="submit" class="btn btn-warning"
					value="Add To Collection">

			</form>
		</div>
	</div>
</body>
</html>