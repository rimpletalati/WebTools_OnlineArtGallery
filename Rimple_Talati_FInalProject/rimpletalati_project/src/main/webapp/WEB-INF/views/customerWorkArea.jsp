<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
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
<script src="<c:url value="/js/custHomePage.js"/>"></script>

<title>Art Gallery</title>
<style>
</style>
</head>
<body>
	<div class="container">
		<div class="row myheader">
			<div class="col-lg-6 header">
				
				<p>ART GALLERY</p>
				<p class="headerP">bove & Beyond
				</p>
				<svg>

    <polygon points="60,30 90,90 30,90" style="fill:white">
        <animateTransform attributeName="transform"
                          attributeType="XML"
                          type="rotate"
                          from="0 60 70"
                          to="360 60 70"
                          dur="10s"
                          
                          repeatCount="indefinite"/>
    </polygon>

</svg>

			</div>

			<div class="col-lg-5 searchbox">
				<form name="myform" action="getProducts.go" method="post"
					class="form-search ">
					<div class="form-group">

						<div class="form-group">

							<div class="">
								<input id="paintingName" name="productName"
									placeholder="Search for.."
									class="form-control input-md pull-left" type="text"
									maxlength="100" onblur="validatePaintingName()"
									onKeyUp="ajaxFunction()">
							</div>




						</div>
						<div class="">
							<select id="selectbasic" name="category"
								class="form-control pull-left">
								<c:forEach var="item" items="${paintingCategory}">
									<option value="${item}">${item}</option>
								</c:forEach>
							</select>
						</div>

					</div>

					<div>

						<input type="submit" class="btn mybutton1" value="">
					</div>
					<br />
					<div class="pull-left">
						<p id="suggestions"></p>
					</div>
				</form>
			</div>



			<div class="col-lg-1 logBtn">
				<form action="logout.go" method="get">
					<input type="submit" class="btn btn-warning" value="Logout" />
				</form>
			</div>

			<div class="col-lg-1 logBtn ">
				<form action="viewmycart.go" method="get" class="cart">
					<input type="submit" class="btn btn-warning cartImg"
						value="My cart" />
				</form>
			</div>


		</div>

		<div class="row navLink">

			<div class="col-lg-2 col-lg-offset-8">
				<form method="POST" action="getOrderHistory.go" role="form">
					<input type="hidden" name="customerId" value="${customerID}">
					<div class="form-group marginLogout">
						<div class="input-group input-group-lg">
							<input type="submit" name="orderHistory" value="Order History"
								class="btn btn-sm" />
						</div>

					</div>
				</form>
			</div>

			<!-- LOGOUT BUTTON -->

			<div class="col-lg-2">
				<form action="PasswordChangeTo.go" method="post">
					<input type="submit" class="btn" value="Change Password" />
				</form>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12 changeMargin">
				<div id="myCarousel" class="carousel slide carousel-fade"
					data-ride="carousel">

					<div class="carousel-inner">
						<div class="item active car1">

							<img src="resources/images/hp3.jpg" class="mycar1">
							<div class="container">
								<div class="carousel-caption"></div>
							</div>

						</div>
						<div class="item car2">

							<img src="resources/images/hp5.jpg" class="mycar2">
							<div class="container">
								<div class="carousel-caption"></div>
							</div>

						</div>
						<div class="item car3">

							<img src="resources/images/hp4.jpg" class="mycar3">
							<div class="container">
								<div class="carousel-caption"></div>
							</div>

						</div>
						<div class="item car4">

							<img src="resources/images/hp7.jpg" class="mycar4">
							<div class="container">
								<div class="carousel-caption"></div>
							</div>

						</div>


					</div>
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>

		</div>

		<div class="row quickRow">
			<div class="col-lg-12 myclass">
				<form action="quickSearch.do" method="post"
					class="quickSearchForm form-horizontal col-lg-offset-2">
					<div class="form-group divUnderQuickSearch">
						<div class=" pull-left">
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
							<div class="col-lg-8 col-lg-offset-1 text-center">
								<div class="form-group">
									<input type="submit" class="btn btn-warning quickButton"
										name="submit" value="Find Art" />
								</div>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h2>New Art Collection</h2>
			</div>
		</div>
		<!-- <div class="row">
			<div class="col-lg-12 newArt">
				<div class="col-lg-4 pic">
					<img src="resources/images/nart1.jpg" class="">
					<h4>Good Vibrations - Painting</h4>
					<h4>Barry Johnson</h4>
				</div>

				<div class="col-lg-4 pic">
					<img src="resources/images/nart2.jpg" class="">
					<h4>Close your Eyes - Painting</h4>
					<h4>Beata Belanzky - Demko</h4>
				</div>
				<div class="col-lg-4 pic">
					<img src="resources/images/nart3.jpg" class="">
					<h4>Greek Islands I - Painting</h4>
					<h4>Michael Goro</h4>
				</div>
			</div>
		</div> -->
		<div class="row">
			<div class="col-lg-12">
				<div class="col-lg-4 text-center">
					<h4>Good Vibrations - Painting</h4>
					<h4>Barry Johnson</h4>
					<h4>$500</h4>
				</div>
				<div class="col-lg-4 text-center">
					<h4>Close your Eyes - Painting</h4>
					<h4>Beata Belanzky - Demko</h4>
					<h4>$2,500</h4>
				</div>
				<div class="col-lg-4 text-center">
					<h4>Greek Islands I - Painting</h4>
					<h4>Michael Goro</h4>
					<h4>$1,500</h4>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 ">
				<div class="col-lg-4 pic newArt">
					<img src="resources/images/nart1.jpg" class="">

				</div>

				<div class="col-lg-4 pic newArt">
					<img src="resources/images/nart2.jpg" class="">
					<!-- <h4>Close your Eyes - Painting</h4>
					<h4>Beata Belanzky - Demko</h4> -->
				</div>
				<div class="col-lg-4 pic newArt">
					<img src="resources/images/nart3.jpg" class="">
					<!-- <h4>Greek Islands I - Painting</h4>
					<h4>Michael Goro</h4> -->
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="col-lg-4 text-center">
					<h4>Orange Organic - Drawing</h4>
					<h4>Marijah Bac Kam</h4>
					<h4>$1,110</h4>
				</div>
				<div class="col-lg-4 text-center">
					<h4>I'm sorry but I didn't hear a word.. - Painting</h4>
					<h4>Mars Black</h4>
					<h4>$200</h4>
				</div>
				<div class="col-lg-4 text-center">
					<h4>Susprio - Photography</h4>
					<h4>Juan Calle</h4>
					<h4>$1,200</h4>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12 ">
				<div class="col-lg-4 pic newArt">
					<img src="resources/images/nart4.jpg" class="">

				</div>

				<div class="col-lg-4 pic newArt">
					<img src="resources/images/nart5.jpg" class="">
					<!-- <h4>Close your Eyes - Painting</h4>
					<h4>Beata Belanzky - Demko</h4> -->
				</div>
				<div class="col-lg-4 pic newArt">
					<img src="resources/images/nart6.jpg" class="">
					<!-- <h4>Greek Islands I - Painting</h4>
					<h4>Michael Goro</h4> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>