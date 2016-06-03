<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script src="<c:url value="/js/makePayment.js"/>"></script>

<link rel="stylesheet" href="<c:url value="/css/custHomePage.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/supplierWorkArea.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/orderHistory.css"/>" />
<title>Art Gallery</title>

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
	<div class="auth">
		<div class="row formDiv">
			<div id="big-form" class="well auth-box">
				<h3>My Order History</h3>
				<hr />
				<table id="myTable">
					<tr>
						<th class="col-lg-4">Order ID</th>
						<th class="col-lg-4">Product</th>
						<th class="col-lg-4">Price</th>
					</tr>
					<c:forEach var="order" items="${orderList}">
						<c:forEach var="orderItem" items="${order.orderItem}">


							<tr>
								<td class="col-lg-4"><c:out value="${order.orderId}" /></td>
								<td class="col-lg-4"><c:out
										value="${orderItem.painting.name}" /></td>
								<td class="col-lg-4"><c:out value="${orderItem.painting.price}" /></td>

							</tr>


						</c:forEach>
					</c:forEach>
				</table>
			</div>
		</div>
		</div>
		<div class="clearfix"></div>
	</div>
</body>
</html>




