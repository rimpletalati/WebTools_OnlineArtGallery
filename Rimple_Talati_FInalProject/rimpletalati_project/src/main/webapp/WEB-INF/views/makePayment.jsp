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
<!-- <script type="text/javascript">
	/* window.history.forward(); */
	function noBack() {
		window.history.forward();
	}
</script>
 -->
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script src="<c:url value="/js/makePayment.js"/>"></script>


<link rel="stylesheet" href="<c:url value="/css/custHomePage.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/supplierWorkArea.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/makePayment.css"/>" />
<title>Art Gallery Home Page</title>

</head>
<!-- <body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload=""> -->
	<body>

	<div class="container ">

		<div class="row myheader">
			<div class="col-lg-6 header">
			<a herf="goToHomepage.go">
				<p>ART GALLERY</p>
				<p class="headerP">bove & Beyond</p></a>
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

		<div class="row auth formDiv">
			<div id="big-form" class="well auth-box">
				<form name="makePayment" id="makePayment" action="makepayment.htm"
					method="post">
					<fieldset>
						<input type="hidden" name="orderId" value="${orderId}">
						<!-- Form Name -->
						<h2>Make Payment</h2>
						<hr/>
						<div class="form-group" id="errors"></div>

						<div class="form-group">
							<label class=" control-label" for="name">Name on Card</label>
							<div class="">
								<input id="name" name="name" class="form-control input-md"
									type="text" maxlength="100">
							</div>
						</div>

						<div class="form-group">
							<label class=" control-label" for="cardNumber">Card
								Number</label>
							<div class="">
								<input id="cardNumber1" name="cardNumber"
									class="form-control input-md" type="text" maxlength="4"
									onkeyup="jump(this)"> <input id="cardNumber2"
									name="cardNumber" class="form-control input-md" type="text"
									maxlength="4" onkeyup="jump(this)"> <input
									id="cardNumber3" name="cardNumber"
									class="form-control input-md" type="text" maxlength="4"
									onkeyup="jump(this)"> <input id="cardNumber4"
									name="cardNumber" class="form-control input-md" type="text"
									maxlength="4" onkeyup="jump(this)">

							</div>
						</div>


						<!-- Select Basic -->
						<div class="form-group">
							<div id="info">
								<p id="errormsg" class="text-danger"></p>
							</div>
							<label class=" control-label" for="selectbasic">Expiration
								Date</label>
							<div class="exp">
								<select id="month" name="month" class="form-control">
									<option value="1">01</option>
									<option value="2">02</option>
									<option value="3">03</option>
									<option value="4">04</option>
									<option value="5">05</option>
									<option value="6">06</option>
									<option value="7">07</option>
									<option value="8">08</option>
									<option value="9">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>

								</select> <select id="year" name="year" class="form-control">
									<option value="13">2017</option>
									<option value="14">2018</option>
									<option value="15">2019</option>
									<option value="16">2020</option>
									<option value="17">2021</option>
									<option value="18">2022</option>

								</select>
							</div>
						</div>



						<!-- Password input-->
						<div class="form-group">
							<label class=" control-label" for="cvv">CVV</label> 
							<img alt="cvv hint" class="cvvImg"
						src="resources/images/cvv.png">
							<div class="">
								<input id="cvv" name="cvv" class="form-control input-md"
									type="text" maxlength="3">
							</div>
						</div>



						<!-- Button -->
						<div class="form-group">
							<div class="">
								<input type="submit" class="btn btn-warning" id="singlebutton"
									name="pay" value="Pay"  />

							</div>
						</div>


					</fieldset>
				</form>

			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</body>
</html>