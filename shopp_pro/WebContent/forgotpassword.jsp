<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Shopp</title>
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
	width: 150px;
	height: 30px;
	font-size: 16px;
	color: #6C44C4;
	background-color: black;
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
		<center>
			<a id="logo" href="home.jsp"><img src="shopp.png"></a>
		</center>
		<center>
			<h1>CHANGING PASSWORD</h1>
		</center>
		<form id="theform" action="AdminController" method="post">
			<input type="hidden" name="page" value="forgotpassword-form">
			<!-- Validations errors -->
			<font color="#6C44C4"><c:out value="${msg}"></c:out></font> <br>
			<label for="customerMail">Enter your Mail id: </label> <input
				type="text" name="customerMail" id="customerMail" required>
			<label for="question1">Enter your Nick Name: </label> <input
				type="text" id="question1" name="question1" required> <br>
			<br> <label for="question2">Enter your first pet name: </label>
			<input type="text" id="question2" name="question2" required>
			<br>
			<br> <label for="question3">Enter your Favorite Sports
				person: </label> <input type="text" id="question3" name="question3" required>
			<br>
			<br> <label for="question4">Enter your Blood group: </label> <input
				type="text" id="question4" name="question4" required> <br>
			<br> <label for="question5">Enter your Birth Place: </label> <input
				type="text" id="question5" name="question5" required> <br>
			<br>
			<center>
				<input id="submit" type="submit" value="SUBMIT">
			</center>
		</form>
		<center>
			<a href="customersignin.jsp"><span class="spanagree">Skip</span></a>
			</p>
		</center>
		<br>
		<center>
			<a href="home.jsp"><span class="spanagree">Back to Home</span></a>
			</p>
		</center>
		<br>
	</div>
</body>

</html>