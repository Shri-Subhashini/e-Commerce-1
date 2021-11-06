<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Shopp |Customer Sign Up</title>
<link rel="icon" type="image/png" href="img/logo.png">
<link rel="stylesheet" type="text/css" href="forms.css">
<script type="text/javascript">
	function validation() {
		$('#msg1').html('')
		$('#msg2').html('')
		$('#msg3').html('')
		$('#msg4').html('')
		$('#msg5').html('')
		var name = document.forms["theform"]["customerName"].value;
		var mob = document.forms["theform"]["customerPhone"].value;
		var mail = document.forms["theform"]["customerMail"].value;
		var password = document.forms["theform"]["customerPassword"].value;
		var cpassword = document.forms["theform"]["customerCPassword"].value;

		var correct_way = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/;
		var phoneno = /^\d{10}$/;
		var email = /^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$/;
		var pass = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;

		if (name == "") {
			document.getElementById("msg1").innerHTML = "Please fill your Name";
			return false;
		}
		if (name.match(correct_way)) //name validation
		{
			if (mob.match(phoneno)) //mobile number validation
			{
				if (mail.match(email)) //email validation
				{
					if (password.match(pass)) //password strength validation
					{
						if (password == cpassword) //confirm password validation
						{
							return true;
						} else {
							document.getElementById('msg5').innerHTML = "Password does not matches!";
							return false;
						}
						return true;
					} else {
						document.getElementById('msg4').innerHTML = "Password is not Strong";
						return false;
					}

					return true;
				} else {
					document.getElementById('msg3').innerHTML = "Enter valid mail id!";
					return false;
				}
				return true;
			} else {
				document.getElementById("msg2").innerHTML = "Enter valid mobile number";
				return false;
			}
			return true;
		} else {
			document.getElementById("msg1").innerHTML = "Only alphabets are allowed in Name";
			return false;
		}
	}
</script>
<style>
#toggle_pwd {
	cursor: pointer;
	color: #6C44C4;
	margin-left: -30px;
}
</style>
</head>


<body>
	<div class="container">
		<center>
			<a id="logo" href="home.jsp"><img src="shopp.png"></a>
		</center>
		<center>
			<h2>CUSTOMER SIGN UP</h2>
		</center>
		<form id="theform" action="AdminController" method="post"
			onsubmit="return validation()">
			<input type="hidden" name="page" value="sign-up-form">
			<!-- Validations errors -->
			<font color="#6C44C4"><c:out value="${msg }"></c:out></font> <br>
			<label for="customerName"> NAME:</label> <input type="text"
				id="customerName" name="customerName"> <span id="msg1"></span>
			<br>
			<br> <label for="customerPhone">PHONE NUMBER: </label> <input
				type="text" id="customerPhone" name="customerPhone" required>
			<span id="msg2"></span> <br>
			<br> <label for="customerMail">EMAIL:</label> <input type="text"
				id="customerMail" name="customerMail" required> <span
				id="msg3"></span> <br>
			<br> <label for="customerPassword">PASSWORD:</label> <input
				type="password" id="customerPassword" name="customerPassword"
				placeholder="Atleast 8 characters " required> <span
				id="toggle_pwd" class="bi bi-eye-slash"></span>
			<script type="text/javascript">
				$(function() {
					$("#toggle_pwd").click(
							function() {
								$(this).toggleClass("bi-eye");
								var type = $(this).hasClass("bi-eye") ? "text"
										: "password";
								$("#customerPassword").attr("type", type);
							});
				});
			</script>
			<span id="msg4"></span> <br>
			<br> <label for="customerCPassword">CONFIRM PASSWORD:</label> <input
				type="password" id="customerCPassword" name="customerCPassword"
				required> <span id="msg5"></span> <br>
			<br>
			<center>
				<input id="submit" type="submit" value="SUBMIT">
			</center>
		</form>
		<center>
			<p>
				By creating an account or logging in,<br> you agree to <span
					class="spanagree">Conditions of Use</span> and <span
					class="spanagree">Privacy Policy</span>.
			</p>
		</center>
		<center>
			<p>
				Already have an account? <a href="customersignin.jsp"><span
					class="spanagree">Sign in</span></a><br>
			<center>
				<a href="home.jsp"><span class="spanagree">Back to Home</span></a>
				</p>
			</center>
			<br>
	</div>
</body>

</html>