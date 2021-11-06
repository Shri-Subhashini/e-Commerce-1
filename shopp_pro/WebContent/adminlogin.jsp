<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<title>Shopp | Admin Sign in</title>
<link rel="icon" type="image/png" href="img/logo.png">
<link rel="stylesheet" type="text/css" href="forms.css">
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
			<a id="logo" href="home1.jsp"><img src="shopp.png"></a>
		</center>
		<center>
			<h1>ADMIN SIGN IN</h1>
		</center>
		<form id="theform" method="post" action="AdminController">
			<input type="hidden" name="page" value="admin-login-form">
			<!-- Validations errors -->
			<font color="#6C44C4"><c:out value="${msg}"></c:out></font> <br>
			<label for="adminId">ADMIN ID: </label> <input type="text"
				id="adminId" name="adminId" required> <span id="msg1"></span>
			<br>
			<br> <label for="adminPassword">PASSWORD: </label> <input
				type="password" id="adminPassword" name="adminPassword" required>
			<span id="toggle_pwd" class="bi bi-eye-slash"></span>
			<script type="text/javascript">
				$(function() {
					$("#toggle_pwd").click(
							function() {
								$(this).toggleClass("bi-eye");
								var type = $(this).hasClass("bi-eye") ? "text"
										: "password";
								$("#adminPassword").attr("type", type);
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
			<a href="home.jsp"><span class="spanagree">Back to Home</span></a>
			</p>
		</center>
		<br>
	</div>
</body>

</html>