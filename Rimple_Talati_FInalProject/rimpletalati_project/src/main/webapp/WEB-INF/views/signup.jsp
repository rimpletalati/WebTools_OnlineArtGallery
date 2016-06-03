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
<%-- <script type="text/javascript" src="<c:url value="/js/signup.js"/>"></script> --%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/pepper-grinder/jquery-ui.css" />
<script src="<c:url value="/js/signup.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/signup.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/header.css"/>" />


<title>Art Gallery Home Page</title>
<style>
</style>
<script>
	$(function() {
		$("#datepicker").datepicker({});
	});
</script>
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
			<p>ART GALLERY</p>
			<p class="headerP">bove & Beyond</p>
		</div>

		<div id="signupform" class="col-sm-4 col-sm-offset-3">
			<form method="POST" action="signup.go" name="signupform">
				<h2 align="center">Sign Up for Free</h2>
				<div id="info">
					<p id="errormsg" class="text-danger"></p>
				</div>
				<!-- 				<div class="accordion myacc" id="accordion2">
					 1st accordion
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseOne"> <i>Personal
									Detail</i>
							</a>
						</div>
						<div id="collapseOne" class="accordion-body collapse in">
							<div class="accordion-inner">

								<div class="form-group">
									<div class="input-group input-group-lg center-block">
										<label class="control-label col-sm-5" for="firstName">First
											Name* </label> <input type="text" name="firstName" class=""
											onblur="validateFirstName()" maxlength="50" /><br />
										<p id="firstNameError" class="text-danger col-sm-12"></p>
									</div>
								</div>

								<div class="form-group">
									<div class="input-group input-group-lg center-block">
										<label class="control-label col-sm-5" for="lastName">Last
											Name* </label> <input type="text" name="lastName" class=""
											onblur="validateLastName()" maxlength="50" /><br />
										<p id="lastNameError" class="text-danger col-sm-12"></p>

									</div>
								</div>

								<div class="form-group">
									<div class="input-group input-group-lg center-block">
										<label class="control-label col-sm-5" for="address">Address*
										</label> <input type="text" name="address" class=""
											onblur="validateAddress()" maxlength="100" /><br />
										<p id="addressError" class="text-danger col-sm-12"></p>
									</div>
								</div>


								<div class="form-group">
									<div class="input-group input-group-lg center-block">
										<label class="control-label col-sm-5" for="dateOfBirth">Date
											Of Birth* </label> <input type="text" name="dateOfBirth" class=""
											onblur="validatedob()" /><br />
										<p id="dobError" class="text-danger col-sm-12"></p>
									</div>
								</div>

								<div class="form-group">
									<div class="input-group input-group-lg center-block">

										<label class="control-label col-sm-2" for="gender">Male</label>
										<input type="radio" checked="checked" name="gender"
											value="Male" class="col-sm-1" /> <label
											class="control-label col-sm-2" for="gender">Female</label> <input
											type="radio" name="gender" value="Female" />
									</div>
								</div>

								<div class="form-group">
									<div class="input-group input-group-lg center-block">
										<label class="control-label col-sm-5" for="email">Email*
										</label> <input type="text" name="email" class=""
											onblur="validateEmail()" /><br />
										<p id="emailError" class="text-danger col-sm-12"></p>
									</div>
								</div>

								<div class="form-group">
									<div class="input-group input-group-lg center-block">
										<label class="control-label col-sm-5" for="phoneNo">Phone
											Number* </label> <input type="text" name="phoneNo"
											onblur="validatePhoneNo()" />
										<p id="phoneNoError" class="text-danger col-sm-12"></p>
									</div>
								</div>


							</div>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseTwo"> <i> User
									Account Details</i>
							</a>
						</div>
						<div id="collapseTwo" class="accordion-body collapse">
							<div class="accordion-inner">

								<div class="form-group">
									<div class="input-group input-group-lg center-block">
										<label class="control-label col-sm-5" for="username">Username*
										</label> <input type="text" name="username" id="username" class=""
											onblur="validateUsername() " /><br />
										<p id="usernameError" class="text-danger col-sm-12"></p>
									</div>
								</div>

								<div class="form-group">
									<div class="input-group input-group-lg center-block">
										<label class="control-label col-sm-5" for="password">Password*
										</label> <input type="text" name="password"
											onblur="validatePassword()" />
										<p id="passwordError" class="text-danger col-sm-12"></p>
									</div>
								</div>

								<div class="form-group">
									<div class="input-group input-group-lg center-block">
										<label class="control-label col-sm-5" for="confirmPassword">Confirm
											Password* </label> <input type="text" name="confirmPassword"
											onblur="validatematchOrConfirm()" />
										<p id="confirmPasswordError" class="text-danger col-sm-12"></p>
									</div>
								</div>

							</div>
						</div>
					</div>
					<input type="submit" class="btn" id="submitbtn" name="signup"
						value="Sign Up Me!" disabled onclick="return validate()" />
				</div> -->

				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#collapseOne"> <i>Personal
										Detail</i>
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="form-group">
								<div class="input-group input-group-lg center-block">
									<label class="control-label col-sm-5" for="firstName">First
										Name* </label> <input type="text" name="firstName" class=""
										onblur="validateFirstName()" maxlength="50" /><br />
									<p id="firstNameError" class="text-danger col-sm-12"></p>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group input-group-lg center-block">
									<label class="control-label col-sm-5" for="lastName">Last
										Name* </label> <input type="text" name="lastName" class=""
										onblur="validateLastName()" maxlength="50" /><br />
									<p id="lastNameError" class="text-danger col-sm-12"></p>

								</div>
							</div>

							<div class="form-group">
								<div class="input-group input-group-lg center-block">
									<label class="control-label col-sm-5" for="address">Address*
									</label> <input type="text" name="address" class=""
										onblur="validateAddress()" maxlength="100" /><br />
									<p id="addressError" class="text-danger col-sm-12"></p>
								</div>
							</div>


							<div class="form-group">
								<div class="input-group input-group-lg center-block">
									<label class="control-label col-sm-5" for="dateOfBirth">Date
										Of Birth* </label> <input type="text" name="dateOfBirth" class=""
										onblur="validatedob()" id="datepicker" /><br />
									<p id="dobError" class="text-danger col-sm-12"></p>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group input-group-lg center-block">

									<label class="control-label col-sm-2" for="gender">Male</label>
									<input type="radio" checked="checked" name="gender"
										value="Male" class="col-sm-1" /> <label
										class="control-label col-sm-2" for="gender">Female</label> <input
										type="radio" name="gender" value="Female" />
								</div>
							</div>

							<div class="form-group">
								<div class="input-group input-group-lg center-block">
									<label class="control-label col-sm-5" for="email">Email*
									</label> <input type="text" name="email" class=""
										onblur="validateEmail()" /><br />
									<p id="emailError" class="text-danger col-sm-12"></p>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group input-group-lg center-block">
									<label class="control-label col-sm-5" for="phoneNo">Phone
										Number* </label> <input type="text" name="phoneNo"
										onblur="validatePhoneNo()" />
									<p id="phoneNoError" class="text-danger col-sm-12"></p>
								</div>
							</div>

						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#collapseTwo"> <i> User
										Account Details</i>
								</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="form-group">
								<div class="input-group input-group-lg center-block">
									<label class="control-label col-sm-5" for="username">Username*
									</label> <input type="text" name="username" id="username" class=""
										onblur="validateUsername() " /><br />
									<p id="usernameError" class="text-danger col-sm-12"></p>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group input-group-lg center-block">
									<label class="control-label col-sm-5" for="password">Password*
									</label> <input type="text" name="password" onblur="validatePassword()" />
									<p id="passwordError" class="text-danger col-sm-12"></p>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group input-group-lg center-block">
									<label class="control-label col-sm-5" for="confirmPassword">Confirm
										Password* </label> <input type="text" name="confirmPassword"
										onblur="validatematchOrConfirm()" />
									<p id="confirmPasswordError" class="text-danger col-sm-12"></p>
								</div>
							</div>

						</div>
					</div>
				</div>
				<input type="submit" class="btn" id="submitbtn" name="signup"
					value="Sign Up Me!" disabled onclick="return validate()" />
			</form>
		</div>
	</div>
</body>
</html>