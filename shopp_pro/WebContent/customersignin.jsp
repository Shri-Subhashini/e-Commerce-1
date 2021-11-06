<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="forms.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<title>Shopp| customer signin</title>
<link rel="icon" type="image/png" href="img/logo.png">
<link rel="stylesheet" type="text/css" href="forms.css">
<script type="text/javascript">
	function validation() {
		$('#msg1').html('')
		var id = document.forms["theform"]["customerId"].value;
		var phoneno = /^\d{10}$/;
		var email = /^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w{2,3})+$/;
		if (id.match(phoneno) || id.match(email)) {
			return true;
		} else {
			document.getElementById("msg1").innerHTML = "Invalid mobile number or mail id..";
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
			<h2>CUSTOMER SIGN IN</h2>
		</center>
		<form id="theform" action="AdminController" method="post"
			onsubmit="return validation()">
			<input type="hidden" name="page" value="signin-form">
			<!-- Validations errors -->
			<font color="#6C44C4"><c:out value="${msg}"></c:out></font> <br>
			<label for="customerId">USER ID: </label> <input type="text"
				id="customerId" name="customerId"
				placeholder="Enter mobile no or email id" required> <span
				id="msg1"></span> <br>
			<br> <label for="customerPassword">PASSWORD: </label> <input
				type="password" id="customerPassword" name="customerPassword"
				required> <span id="toggle_pwd" class="bi bi-eye-slash"></span>
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
			<br>
			<br>
			<center>
				<input id="submit" type="submit" value="SIGN IN">
			</center>
		</form>
		<center>
			<a href="forgotpassword.jsp"><span class="spanagree">Forgot
					password?</span></a><br>
			<center>
				<p>
					By creating an account or logging in,<br> you agree to <span
						class="spanagree">Conditions of Use</span> and <span
						class="spanagree">Privacy Policy</span>.
				</p>
			</center>
			<center>
				<p>
					New user? <a href="customersignup.jsp"><span class="spanagree">Sign
							Up</span></a><br>
				<center>
					<a href="home.jsp"><span class="spanagree">Back to Home</span></a>
					</p>
				</center>
				<br>
	</div>
</body>
</html>