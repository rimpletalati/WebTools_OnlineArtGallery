<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
<link rel="stylesheet" href="<c:url value="/css/custHomePage.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/productDisplay.css"/>" />
<%-- <script src="<c:url value="/js/custHomePage.js"/>"></script> --%>
<title>Art Gallery Home Page</title>
<style>
</style>
</head>
<body>


	<%-- <c:forEach var="product" items="${paintingList}">
		<tr>
			<td><c:out value="${product.name}" /></td>
			<td><a
				href="showProductDetails.htm?productID=${product.paintingId}">
					Show Product Details</a></td>
		</tr>
	</c:forEach>
 --%>
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

		<div class="row quickRow">
			<div class="col-lg-12 myclassDiv">
				<form action="quickSearch.do" method="post"
					class="quickSearchForm form-horizontal col-lg-offset-2">
					<div class="form-group divUnderQuickSearch">
						<div class="pull-left">
							<!-- <label class=" control-label" for="productName">Product Name</label>   -->
							<div class="">
								<input id="paintingName" name="paintingName"
									placeholder="Painting Name"
									class="form-control input-md pull-left" type="text"
									maxlength="100">
							</div>
						</div>
						<div class=" pull-left">
							<label class="pull-left" for="company">Artist Name:</label> <select
								id="selectbasic" name="company"
								class="form-control pull-left priceInput">
								<c:forEach var="item" items="${companyList}">
									<option value="${item}">${item}</option>
								</c:forEach>
							</select>
						</div>
						<div class=" pull-left priceInput">
							<label class="pull-left" for="priceFrom">Price:</label> <input
								type="text" class="form-control pull-left " name="priceFrom"
								placeholder="from"> <input type="text"
								class="form-control" name="priceTo" placeholder="to">

						</div>
						<div class="row">
							<div class="col-lg-7 col-lg-offset-1 text-center">
								<div class="form-group">
									<input type="submit" class="btn btn-info quickButton"
										name="submit" value="Find Art" />
								</div>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>


		<div class="row">
			<h2>You found following results:</h2>
		</div>
		<div class="row searchResults">
			<div class="col-lg-12">

				<div class="margintopmd marginleft">
					<c:forEach var="product" items="${paintingList}">
						<div class="row col-lg-6 margintopmd">
							<div class="row col-lg-offset-1 display">
								<div class="col-lg-6  pull-left">
									<div class="row  pull-left">
										<h3>
											<c:out value="${product.name}" />
										</h3>
										<h4>
											<a
												href="showProductDetails.htm?productID=${product.paintingId}">
												Show Details</a>
										</h4>
									</div>
								</div>
								<div class="col-lg-6 pop">
									<div class="row imgRow">
										<img alt="product" src="resources/images/${product.path}"
											alt="Product Image" width="200px" height="150">
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>




	</div>
</body>
</html>