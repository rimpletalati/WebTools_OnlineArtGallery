<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>

<script src="<c:url value="/js/adminWorkArea.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/adminWorkArea.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/supplierWorkArea.css"/>" /> 
<link rel="stylesheet" href="<c:url value="/css/header.css"/>" /> 
 
<title>Admin Work Area</title>

</head>
<body background="resources/images/backgroundImg.jpg">

	<div class="container ">
		<div class="row">
			<div class="col-lg-7 header">
				<p>ART GALLERY</p>
				<p class="headerP">bove & Beyond</p>

			</div>
		</div>
		<div class="row logoutbtnDiv">
			
			<div class="">
				<form action="logout.go" method="get" class="text-right">
					<input type="submit" class="btn btn-warning" value="Logout" />
				</form>
			</div>
		</div>
		<div class="row auth text-center">

			<div id="big-form" class="well auth-box" style="display: none">
				<form name="addCategory" id="addCategory" action="addCatgeory.go"
					method="post">
					<fieldset>
						<div class="form-group" id="errors2"></div>
						<div class="form-group">
							<label class=" control-label" for="paintingCaetgoryName">Painting
								Category Name</label>
							<div class="">
								<input id="paintingCaetgoryName" name="paintingCaetgoryName"
									class="form-control input-md" type="text" maxlength="100"
									onblur="validatePaintingName()">

							</div>
						</div>
						<input type="submit" id="singlebutton" class="btn btn-info"
							name="submit" value="Submit" />
					</fieldset>
				</form>
			</div>

			<div id="supplierForm" class="well auth-box" style="display: none">
				<form name="addSupplier" id="register-form" novalidate="novalidate"
					action="addArtist.go" method="post">
					<fieldset>
						<div class="form-group" id="errors1"></div>
						<div class="form-group">
							<label class=" control-label" for="firstName">Artist
								First Name</label>
							<div class="">
								<input id="firstName" name="firstName"
									class="form-control input-md" type="text" maxlength="100"
									onblur="validatePaintingName()">

							</div>
						</div>
						<div class="form-group">
							<label class=" control-label" for="lastName">Artist Last
								Name</label>
							<div class="">
								<input id="lastName" name="lastName"
									class="form-control input-md" type="text" maxlength="100"
									onblur="validatePaintingName()">
								<p id="lastNameError" class="text-danger"></p>
							</div>
						</div>
						<!-- <div class="form-group">
            <label class=" control-label" for="email">email</label>  
            <div class="">
              <input id="email" name="email" class="form-control input-md" type="text" maxlength ="100" onblur="validatePaintingName()">
              <p id="emailError" class="text-danger"></p>
            </div>
          </div>  -->
						<div class="form-group">
							<label class=" control-label" for="username">Username</label>
							<div class="">
								<input id="username" name="username"
									class="form-control input-md" type="text" maxlength="100">

							</div>
						</div>
						<div class="form-group">
							<label class=" control-label" for="password">Password</label>
							<div class="">
								<input id="password" name="password"
									class="form-control input-md" type="password" maxlength="15">

							</div>
						</div>
						<input type="submit" id="singlebutton" class="btn btn-info"
							name="submit" value="Submit" />
					</fieldset>
				</form>
			</div>


			<!-- <div class="mybutton1">
<button type="button" class="btn btn-info" data-container="body" data-toggle="popover" data-content="" data-placement = "left" title="Add Category" >Add Painting Category</button>
<button type="button" class="btn btn-info" data-container="body" data-toggle="popover" data-content="" data-placement = "right" title="Add Artists" >Add Artists</button>


</div> -->

			<div>
				<button type="button" class="btn btn-info mybutton1">Add
					Artists</button>

			</div>

			<div class="">
				<button type="button" class="btn btn-info mybutton2">Add
					Painting Category</button>
			</div>


		</div>
	</div>

</body>
</html>