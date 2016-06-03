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

<link rel="stylesheet" href="<c:url value="/css/supplierWorkArea.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/header.css"/>" />
<script src="<c:url value="/js/supplierWorkArea.js"/>"></script>
<title>Art Gallery Home Page</title>
<style>
</style>
</head>
<body background="resources/images/backgroundImg.jpg">

	<div class="container">
		<div class="col-lg-7 header">
			<a href="goToSupplierHome.do">
			<p>ART GALLERY</p>
			<p class="headerP">bove & Beyond</p>
			</a>

		</div>
		<div class="row">
			<div class="">
				<h3 class="text-center">Welcome ${artist.person.supplierName }
				</h3>
			</div>
			<div class="">
				<form action="logout.go" method="get" class="text-right">
					<input type="submit" class="btn btn-warning" value="Logout" />
				</form>
			</div>
		</div>
		<div class="auth">
			<div id="big-form" class="well auth-box">
				<form name="addPainting" action="addPaintingToCategory.go"
					method="post">
					<fieldset>
						<input type="hidden" value="${artist.person.supplierName }"
							name="artistName">
						<!-- Form Name -->
						<h3>Add Painting</h3>
						<hr />


						<div class="form-group">
							<div id="info">
								<p id="errormsg" class="text-danger"></p>
							</div>
							<label class=" control-label" for="selectCategory">Select
								Category</label>
							<div class="">
								<select id="selectCategory" name="selectCategory"
									class="form-control">
									<c:forEach var="item" items="${paintingCategory}">
										<option value="${item}">${item.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class=" control-label" for="paintingName">Painting
								Name</label>
							<div class="">
								<input id="paintingName" name="paintingName"
									class="form-control input-md" type="text" maxlength="100"
									onblur="validatePaintingName()">
								<p id="paintingNameError" class="text-danger"></p>
							</div>
						</div>

						<!-- Textarea -->
						<div class="form-group">
							<label class=" control-label" for="textarea">Description</label>
							<div class="">
								<textarea class="form-control" id="description" maxlength="200"
									name="description" placeholder="Description of painting"></textarea>

							</div>
						</div>


						<div class="form-group">
							<label class=" control-label" for="price">Price</label>
							<div class="">
								<input id="price" name="price" class="form-control input-md"
									type="text" onblur="validatePrice()">
								<p id="priceError" class="text-danger"></p>
							</div>
						</div>


						<!-- File Button -->
						<div class="form-group">
							<label class=" control-label" for="filebutton">Upload
								Picture</label>
							<div class="">
								<input id="image" name="image" class="input-file" type="file">
							</div>
							<div>
								<input type="button" class="upload" onclick="uploadIt()" value="Upload Files" />
							</div>
							<div>
								<input type="text" name="textPath" id="textPath" />
							</div>
						</div>


						<!-- Button -->
						<div class="form-group">
							<div class="">
								<input type="submit" class="btn btn-primary" id="singlebutton" name="singlebutton"
									value="Add and Save" onclick="return validate()" disabled />
								<!-- <button id="singlebutton" name="singlebutton"
									class="btn btn-primary" onclick="return validate()" disabled>Add
									and Save</button> -->
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