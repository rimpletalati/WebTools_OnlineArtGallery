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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value="/css/header.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/login.css"/>" />

<title>Art Gallery Home Page</title>
<style>
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="videoplay">
			<video loop="loop" width="100%" autoplay>
				<source src="/edu/resources/videos/MyVideo.mp4" type="video/mp4">
				<%-- <source src="<c:url value="/videos/MyMovie.mp4"/>" type="video/mp4"> --%>
			</video>

		</div>


		<div class="col-lg-7 header">
			<div class="col-lg-7"><p>ART GALLERY</p>
			<p class="headerP">bove & Beyond</p></div>

		</div>
		<div id="searchForm" class="col-sm-3 col-sm-offset-4">
			<form:form method="POST" commandName="userAccount" action="login.go"
			align="center">

			<div class="form-group ">
				<div class="input-group input-group-lg center-block">
					<form:input path="username" placeholder="Enter Username" />
					<br/>
					<form:errors path="username" class="errormsgs"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group input-group-lg center-block">
					<form:input path="password" placeholder="Enter Password" />
					<br />
					<form:errors path="password" class="errormsgs"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group input-group-lg center-block">
					<input type="checkbox" name="rememberme" value="RememberMe" /> <label
						class="control-label" for="rememberme">Remember Me</label> <input
						type="submit" class="btn" id = "submitbtn" name="signin" value="Sign In" />
				</div>
			</div>
		</form:form>
 
			
			
			<div class="signuphere ">
				<div class="" align="center">
					<label class="control-label" for="signup">Not a member?</label> <a
						href="goToSignUp.go">Sign up now -></a>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>