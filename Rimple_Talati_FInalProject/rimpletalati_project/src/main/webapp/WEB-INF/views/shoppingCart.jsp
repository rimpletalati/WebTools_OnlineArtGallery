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
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script src="<c:url value="/js/makePayment.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/custHomePage.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/supplierWorkArea.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/addToCart.css"/>" />
<title>Art Gallery Home Page</title>

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

		<div class="row auth tableDiv">
			<div class="col-lg-12">
				<div id="big-form" class="well auth-box">
					<h2>My Shopping Cart</h2>
					<hr />

					<table class="cartTable">
						<thead>
							<tr class="rowCartTable">
								<th class="col-lg-2">Product ID</th>
								<th class="col-lg-2">Product Name</th>
								<th class="col-lg-2">Price</th>
								<th class="col-lg-2">Quantity</th>
								<!-- 	<th class="col-lg-1">Subtotal</th> -->
								<th class="col-lg-1"></th>
							</tr>


						</thead>
						<tbody>
							<c:forEach var="orderItem" items="${cart.orderItem}">
								<tr>
									<td class="col-lg-2"><c:out
											value="${orderItem.painting.paintingId}" /></td>
									<td class="col-lg-2"><c:out
											value="${orderItem.painting.name}" /></td>
									<td class="col-lg-2"><c:out
											value="${orderItem.painting.price}" /></td>
									<td class="col-lg-2"><c:out value="${orderItem.quantity}" /></td>
									<%-- 	<td class="col-lg-1"><c:out value="${orderItem.painting.price}" /></td>  --%>
									<!-- for subtotal -->
									<td class="col-lg-1"><a
										href="deleteOrderItem.htm?orderItemid=${orderItem.orderItemId}&orderID=${cart.orderId}">
											<img src="resources/images/deleteIcon.png"
											alt="delete order item">
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4" align="right">Total:</td>
								<td>${cart.orderTotal}</td>
							</tr>
						</tfoot>

					</table>

					<form action="proceedPayment.go" method="post">
						<input type="hidden" name="orderID" value="${cart.orderId}">
						<input type="submit" class="btn btn-warning pull-right"
							id="payment" name="payment" value="Proceed To Payment" />
					</form>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>

</body>
</html>