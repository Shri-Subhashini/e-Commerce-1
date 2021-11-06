<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<title>Online Shopping site</title>
<link rel="icon" type="image/png" href="img/shopp.png">
<style>
body {
	padding: 0;
	margin: 0;
	height: calc(100vh - 40px);
	font-family: Tahoma, Century Gothic;
	overflow: auto;
}

/* style for header*/
#header {
	background-color: #6C44C4;
	height: 60px;
	position: relative;
}

#logo {
	position: absolute;
	color: #fff;
	margin-top: 10px;
	margin-left: 10px;
}

#logo img {
	height: 40px;
	width: 120px;
}

.headerlogin {
	float: right;
	list-style: none;
	margin-top: 10px;
	margin-left: 10px;
}

.headerlogin li {
	display: inline-block;
}

.headerlogin1 {
	float: right;
	list-style: none;
	margin-top: 0.001%;
	margin-center: 2px;
}

.headerlogin1 li {
	display: inline-block;
}

#searchbar {
	border: 2px solid white;
	border-radius: 5px;
	outline: none;
	height: 36px;
	width: 500px;
	background: none;
}

#searchbar:focus {
	border-color: black;
}

#searchsubmit {
	border-radius: 5px;
	color: black;
	background-color: white;
	border: none;
	height: 40px;
	width: 40px;
	margin-right: 300px;
}

#searchsubmit:hover {
	background-color: black;
	color: white;
	border: none;
}

::placeholder {
	color: white;
	opacity: 1;
}

.headerlogin li a {
	color: #6C44C4;
	padding: 10px 20px;
	border-radius: 5px;
	background-color: white;
	font-size: 16px;
	text-transform: uppercase;
	text-decoration: none;
}

.headerlogin li a:hover {
	background: black;
	color: white;
	z-index
	=1;
}

.headerlogin1 li a {
	color: #6C44C4;
	padding: 5px 10px;
	border-radius: 5px;
	background-color: white;
	font-size: 13px;
	text-transform: uppercase;
	text-decoration: none;
	z-index
	=1;
}

.headerlogin1 li a:hover {
	background: black;
	color: white;
	z-index
	=1;
}

.logindropdown {
	position: relative;
	display: inline;
}

.dropbutton1 {
	color: #6C44C4;
	padding: 10px 20px 9px 20px;
	background-color: white;
	font-size: 16px;
	text-transform: uppercase;
	text-decoration: none;
	border: none;
	border-radius: 5px;
	margin-top: -10px;
}

.dropbutton {
	color: #6C44C4;
	padding: 5px 28px 3px 18px;
	background-color: white;
	font-size: 16px;
	text-transform: uppercase;
	text-decoration: none;
	border: none;
	border-radius: 5px;
	margin-top: -10px;
	margin-right: 7px;
}

.logindropdown:hover .dropbutton1 {
	background-color: black;
	color: white;
}

.dropdowncontent {
	display: none;
	position: absolute;
	width: 200px;
	z-index: 2;
}

.dropdowncontent a {
	display: block;
	border: none;
}

.logindropdown:hover .dropbutton {
	background-color: black;
	color: white;
}

.dropdowncontent a:hover {
	background-color: black;
	color: white
}

.logindropdown:hover .dropdowncontent {
	display: block;
}

#contactus {
	top: 396px;
	position: fixed;
	width: 100%;
	height: 43%;
	background-color: #6C44C4;
	left: 0;
}

h2 {
	color: white;
	margin-left: 10px;
}

.address {
	text-align: center;
}

.social {
	text-align: center;
	margin-top: 2%;
	bottom: 2%;
}

.address li {
	display: block;
	list-style: none;
	font-size: 20px;
	padding: 10px 20px;
}

.social li, .btt li {
	display: inline-block;
	list-style: none;
	font-size: 20px;
	padding: 10px 20px;
}

.address li a, .social li a {
	text-decoration: none;
	color: white;
}

.address li a:hover, .social li a:hover, .btt li a:hover {
	text-decoration: none;
	color: black;
}

.btt {
	text-align: center;
	bottom: 2%;
}

.btt li a {
	color: #6C44C4;
}

.center {
	display: block;
	margin-left: 210px;
	margin-right: auto;
	margin-bottom: auto;
	margin-top: -10px;
	position: fixed;
}

.center1 {
	display: block;
	margin-left: 370px;
	margin-bottom: 10px;
	margin-top: 110px;
	position: relative;
}

.center2 {
	display: block;
	margin-left: 370px;
	margin-bottom: 10px;
	margin-top: 10px;
	position: relative;
}

#submit {
	display: block;
	width: 200px;
	height: 30px;
	font-size: 15px;
	margin-left: 350px;
	margin-top: 20px;
	position: fixed;
	color: white;
	background-color: #6C44C4;
	border-radius: 5px;
	cursor: pointer;
}

#submit1 {
	width: 200px;
	height: 30px;
	font-size: 15px;
	margin-left: 570px;
	margin-top: 20px;
	position: fixed;
	color: white;
	background-color: #6C44C4;
	border-radius: 5px;
	cursor: pointer;
}
</style>

</head>

<body>
	<div id="header">
		<a id="logo" href="home.jsp"><img src="img/logo.png"></a>
		<ul class="headerlogin">
			<li><input type="text"
				placeholder="Search for products,brands and more" id="searchbar">
			</li>
			<li>
				<button type="submit" id="searchsubmit">
					<i class="fa fa-search"></i>
				</button>
			</li>
			<li><a href="home.jsp">HOME</a></li>
			<li><a href="#">ORDERS</a></li>
		</ul>
	</div>

	<div>
		<img src="img/cartlogo.png" width="650" height="275" class="center">
		<h5 class="center1">
			<b>Your Shopp Cart is Empty</b>
		</h5>
		<h5 class="center2">Get Shopping and Enjoy with your Family!</h5>
		<input id="submit" type="submit"
			onclick="location.href='customersignup.jsp'"
			value="Signup to your account"> <input id="submit1"
			type="submit" onclick="location.href='customersignin.jsp'"
			value="Signin to your account">

	</div>
	<ul class="btt">
		<li><a href="home.jsp">BACK TO TOP</a>
		<li>
	</ul>
	<div id="product"></div>
	<div id="contactus">
		<h2>CONTACT US</h2>
		<ul class="address">
			<li><a href="https://goo.gl/maps/fAhLmLkRXpg5g3GX7"
				target=_blank> Shopp | Chennai | India </a></li>
			<li><a href="tel:+919789480351" target=_blank>Telephone:
					+919789480351</a></li>
			<li><a href="mailto:shoppexpleo@gmail.com" target=_blank>shoppexpleo@gmail.com</a></li>
		</ul>
		<ul class="social">
			<li><a href="tel:+919789480351" target=_blank><i
					class="fa fa-phone"></i></a></li>
			<li><a href="mailto:shoppexpleo@gmail.com" target=_blank><i
					class="fa fa-envelope"></i></a></li>
			<li><a
				href="https://www.youtube.com/channel/UCHu8bRBcPabhnhIF0UUR1Bw"
				target=_blank><i class="fa fa-youtube"></i></a></li>
			<li><a href="https://www.instagram.com/shoppadmin/"
				target=_blank><i class="fa fa-instagram"></i></a></li>
			<li><a
				href="https://www.facebook.com/profile.php?id=100073813025423"
				target=_blank><i class="fa fa-facebook"></i></a></li>
			<li><a href="https://twitter.com/Shopp88845346" target=_blank><i
					class="fa fa-twitter"></i></a></li>
		</ul>
	</div>
</body>

</html>