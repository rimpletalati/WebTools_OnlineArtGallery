<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" href="<c:url value="/css/changePassword.css"/>" />
<title>Art Gallery</title>


<script type="text/javascript">
	function changePwd() {

		var xmlhttpObj;
		var oldPwd = document.getElementById("oldPwdTF").value;

		if (window.XMLHttpRequest) {
			xmlhttpObj = new XMLHttpRequest(); //for IE, Firefox, Chrome, Opera, Safari
		} else {
			xmlhttpObj = new ActiveXObject("Microsoft.XMLHTTP"); //for IE6, IE5
		}

		xmlhttpObj.open("POST", "checkPassword.do", true);
		xmlhttpObj.setRequestHeader("oldPassword", oldPwd);

		xmlhttpObj.onreadystatechange = function() {
			if (xmlhttpObj.readyState == 4) {
				if (xmlhttpObj.status == 200) {
					if (xmlhttpObj.responseText == "true") {
						document.getElementById("textIfMatch").innerHTML = "Password is match";
						document.getElementById("passNew").disabled = false;
						document.getElementById("RePassNew").disabled = false;
						document.getElementById("submtBtn").disabled = false;
						
					} else {
						document.getElementById("textIfMatch").innerHTML = "Password does not match ";
						document.getElementById("passNew").disabled = true;
						document.getElementById("RePassNew").disabled = true;
						document.getElementById("submtBtn").disabled = true;
					}
				} else {
					alert("XMLHTTP status is not 200");
				}
			}
		}
		xmlhttpObj.send(null);
	}
	
	function chckPassword(){
		var newPassword = document.forms["myForm"]["passNew"].value;
		var confirmPassword = document.forms["myForm"]["RePassNew"].value;
		alert('call');
		if (confirmPassword == null || confirmPassword == "" || newPassword != confirmPassword) {
			document.getElementById('conPass').innerHTML = "Password and Confirm Password does not match!";
			alert('false');
			return false;
		} else {
			document.getElementById('conPass').innerHTML = "";
			return true;
		}
	}
</script>
</head>
<body>

	<div class="container ">

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


		<div class=" row passForm">
			<form action="PasswordChange.go" class="" method="post" name="myForm">
				<h3>Change your Password</h3>
				<div class="row">
					<div class="col-lg-5 text-right">
						<h4>Old Password:</h4>
					</div>
					<div class="col-lg-2">
						<input type="text" id="oldPwdTF" onkeyup="changePwd()" />
					</div>
					<div class="col-lg-2 text-left">
						<div id="textIfMatch"></div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-5 text-right">
						<h4>New Password:</h4>
					</div>
					<div class="col-lg-2">
						<input type="text" id="passNew" name="passNew" disabled />
						
					</div>
				</div>

				<div class="row ">
					<div class="col-lg-5 text-right">
						<h4>Confirm Password:</h4>
					</div>
					<div class="col-lg-2">
						<input type="text" id= "RePassNew" name="RePassNew" disabled />

					</div>
					<div class="col-lg-2 text-left">
						<div id="conPass"></div>
					</div>
				</div>
				<div class="row col-lg-offset-5">
				<input type="submit" class="btn btn-warning " onclick="return chckPassword()" id="submtBtn" disabled value="Change Password">
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>