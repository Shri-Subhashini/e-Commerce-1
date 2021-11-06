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
<title>Shopp| Changing Password</title>
<link rel="icon" type="image/png" href="img/logo.png">
<style>
body {
	height: 100%;
	width: 100%;
	font-family: Tahoma, Century Gothic;
	background-color: rgba(204, 204, 204, .3);
}

.container {
	background: rgba(204, 204, 204, .7);
	width: 38%;
	height: 100%;
	margin-left: 30%;
	border-radius: 15px;
}

form {
	max-width: 400px;
	margin: auto;
}

label {
	width: 200px;
	display: inline-block;
}

input {
	border: 2px solid #6C44C4;
	height: 20px;
	width: 160px;
	outline: none;
	border-radius: 5px;
	background: none;
}

input:focus {
	border-color: black;
}

#submit {
	width: 120px;
	height: 30px;
	font-size: 16px;
	color: white;
	background-color: #6C44C4;
	border: none;
	margin-bottom: 2%;
}

#submit:hover {
	background-color: #6C44C4;
	color: black;
	cursor: -webkit-grab;
	cursor: grab;
}

.spanagree {
	color: #6C44C4;
}

a {
	display: block;
	border: none;
	text-decoration: none;
}

.spanagree:hover {
	color: black;
	text-decoration: underline;
}

span {
	color: black;
}

#logo img {
	margin-top: 2%;
	height: 40px;
	width: 120px;
}

#msg1 {
	color: #6C44C4;
}
</style>
</head>
<body>
	<div class="container">
		<%
			String mail = request.getParameter("customerMail");
		%>
		<center>
			<a id="logo" href="home.jsp"><img src="shopp.png"></a>
		</center>
		<center>
			<h2>CHANGE PASSWORD</h2>
		</center>
		<form id="theform" action="AdminController" method="post">
			<input type="hidden" name="customerMail" id="customerMail"
				value=<%=mail%>> <input type="hidden" name="page"
				value="changing-password-form"> <label
				for="customerPassword">ENTER PASSWORD: </label> <input
				type="password" id="customerPassword" name="customerPassword"
				required> <br>
			<br>
			<center>
				<input id="submit" type="submit" value="SUBMIT">
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