function validateFirstName() {

	var firstName = document.forms["signupform"]["firstName"].value;

	if (firstName.trim() == null || firstName.trim() == "") {
		document.getElementById('firstNameError').innerHTML = "First name is mandatory";
	} else {
		document.getElementById('firstNameError').innerHTML = "";
	}
}

function validateLastName() {
	var lastName = document.forms["signupform"]["lastName"].value;
	if (lastName.trim() == null || lastName.trim() == "") {
		document.getElementById('lastNameError').innerHTML = "Last name is mandatory";
	} else {
		document.getElementById('lastNameError').innerHTML = "";
	}
}

function validateAddress() {
	var address = document.forms["signupform"]["address"].value;
	if (address.trim() == null || address.trim() == "") {
		document.getElementById('addressError').innerHTML = "Address is mandatory";
	} else {
		document.getElementById('addressError').innerHTML = "";
	}
}

function validatedob() {
	var dateOfBirth = document.forms["signupform"]["dateOfBirth"].value;
	if (dateOfBirth.trim() == null || dateOfBirth.trim() == "") {
		document.getElementById('dobError').innerHTML = "Date Of Birth is mandatory";
	} else {
		document.getElementById('dobError').innerHTML = "";
	}
}

function validateEmail() {
	var email = document.forms["signupform"]["email"].value;
	if (email.trim() == null || email.trim() == "") {
		document.getElementById('emailError').innerHTML = "Email is mandatory";
	} else {
		document.getElementById('emailError').innerHTML = "";
	}
}

function validatePhoneNo() {
	var phoneNo = document.forms["signupform"]["phoneNo"].value;
	var patt1 = /^\d{10}$/g;
	if (phoneNo.trim() == null || phoneNo.trim() == "") {
		document.getElementById('phoneNoError').innerHTML = "Phone Number is mandatory";
	} else if (isNaN(phoneNo) || phoneNo < 0 || !phoneNo.match(patt1)) {
		document.getElementById('phoneNoError').innerHTML = "Enter valid digits of Phone Number";

	}

	else {
		document.getElementById('phoneNoError').innerHTML = "";
	}

}

function validateUsername() {
	var username = document.forms["signupform"]["username"].value;
	if (username.trim() == null || username.trim() == "") {
		document.getElementById('usernameError').innerHTML = "Username is mandatory";
	} else {
		ajaxFunction();
		document.getElementById('usernameError').innerHTML = "";

	}
}

function validatePassword() {
	var password = document.forms["signupform"]["password"].value;
	if (password.trim() == null || password.trim() == "") {
		document.getElementById('passwordError').innerHTML = "Password is mandatory";
	} else {
		document.getElementById('passwordError').innerHTML = "";
	}
}

function validatematchOrConfirm() {
	var password = document.forms["signupform"]["password"].value;
	var confirmpassword = document.forms["signupform"]["confirmPassword"].value;
	if (confirmpassword == null || confirmpassword == "") {
		document.getElementById('confirmPasswordError').innerHTML = "Confirm Password is mandatory";
	} else if (password != confirmpassword) {
		document.getElementById('confirmPasswordError').innerHTML = "Password and Confirm Password does not match!";
	} else {
		document.getElementById('confirmPasswordError').innerHTML = "";
	}
}

function validate() {

	var firstName = document.forms["signupform"]["firstName"].value;
	var lastName = document.forms["signupform"]["lastName"].value;
	var address = document.forms["signupform"]["address"].value;
	var dateOfBirth = document.forms["signupform"]["dateOfBirth"].value;
	var email = document.forms["signupform"]["email"].value;
	var phoneNo = document.forms["signupform"]["phoneNo"].value;
	var username = document.forms["signupform"]["username"].value;
	var password = document.forms["signupform"]["password"].value;
	var confirmpassword = document.forms["signupform"]["confirmPassword"].value;
	var patt1 = /^\d{10}$/g;
	if (firstName.trim() == null || firstName.trim() == ""
			|| lastName.trim() == null || lastName.trim() == ""
			|| address.trim() == null || address.trim() == ""
			|| dateOfBirth.trim() == null || dateOfBirth.trim() == ""
			|| phoneNo.trim() == null || phoneNo.trim() == ""
			|| username.trim() == null || username.trim() == ""
			|| password.trim() == null || password.trim() == ""
			|| isNaN(phoneNo) || phoneNo < 0 || !phoneNo.match(patt1)
			|| confirmpassword == null || confirmpassword == ""
			|| password != confirmpassword) {
		document.getElementById('errormsg').innerHTML = "Form is incomplete!";
		return false;

	} else {
		return true;
	}
}

$(document).ready(function() {
	$("#submitbtn").click(function() {
		$("#errormsg").addClass("errormsgjquery");
		blink();
		/*$("#datepicker").datepicker();*/
	});

});
function blink() {
	$("#info").fadeOut(800).fadeIn(800).fadeOut(400).fadeIn(400).fadeOut(400)
			.fadeIn(400);
}

/*$(function() {
	$("#datepicker").datepicker();
});*/

function ajaxFunction() {

	var xmlhttp;
	var username = document.getElementById("username").value;

	// document.getElementById("match").innerHTML = oldPass;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest(); // for IE7+, Firefox, Chrome, Opera,
		// Safari
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); // for IE6, IE5
	}

	xmlhttp.open("POST", "checkforusername.do", true);
	xmlhttp.setRequestHeader("username", username);

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				if (xmlhttp.responseText == "false") {
					document.getElementById("usernameError").innerHTML = "User name available";
					document.getElementById("submitbtn").disabled = false;
				} else {
					document.getElementById("usernameError").innerHTML = "Username already exists, please try another one.";
					document.getElementById("submitbtn").disabled = true;
				}
			} else {
				alert('Something is wrong !!');
			}
		}
	}
	xmlhttp.send(null);
}
