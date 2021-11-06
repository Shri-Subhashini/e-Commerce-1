<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<title>Online Shopping site</title>
<link rel="icon" type="image/png" href="logo.png">
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
	margin-top: -17px;
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
	position: relative;
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

table th {
	text-align: left;
	background-color: #3a6070;
	color: white;
	padding: 4px 30px 4px 8px;
}

table td {
	border: 1px solid black;
	padding: 4px 8px;
}

table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 30px;
	margin-bottom: 30px;
}
</style>

</head>

<body>

	<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>
	<div id="header">
		<a id="logo" href="AdminController?page=continue"><img
			src="shopp.png"></a>
		<ul class="headerlogin">
			<li><input type="text"
				placeholder="Search for products,brands and more" id="searchbar">
			</li>
			<li>
				<button type="submit" id="searchsubmit">
					<i class="fa fa-search"></i>
				</button>
			</li>
			<li><a href="AdminController?page=continue">HOME</a></li>
			<sql:setDataSource user="root" password="Subha@2127"
				driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost:3307/test" var="ds" />

			<sql:query var="result" dataSource="${ds}">
		 
		select * from test.cart where customerMail="<c:out value="${username}"></c:out>"
	   </sql:query>
			<c:set var="count" value="0"></c:set>
			<c:forEach items="${result.rows }" var="row">
				<c:set var="count" value="${count + 1}"></c:set>
			</c:forEach>
			<li><a href="cart2.jsp"><i class="fa fa-shopping-cart"
					style="font-size: 18px"></i> CART(<c:out value="${count }"></c:out>)</a>
			</li>
			<li><a href="#">ORDERS</a></li>
			<li><a href="AdminController?page=customer_sign_out"><i
					class="fa fa-sign-out " style="font-size: 18px"></i>SIGN OUT</a></li>
		</ul>
	</div>


	<div class="container">

		<table>
			<tr>
				<th>Item Name</th>
				<th>Price</th>
				<th>Category</th>
				<th>Remove Item</th>
			</tr>
		</table>
		<sql:setDataSource user="root" password="Subha@2127"
			driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3307/test"
			var="ds" />

		<sql:query var="result" dataSource="${ds}">
		 
		select * from test.cart where customerMail="<c:out value="${username}"></c:out>"
	   </sql:query>


		<c:set var="total" value="0"></c:set>
		<c:set var="count" value="0"></c:set>
		<c:forEach items="${result.rows }" var="row">
			<c:set var="count" value="${count + 1}"></c:set>
			<c:set var="total" value="${total + row.price}"></c:set>
			<table style="table-layout: fixed; width: 100%;">

				<tr>
					<td style="width: 100px;"><c:out value="${row.name }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.price }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.category}" /></td>
					<td style="width: 100px;"><a
						href="AdminController?page=removeitem&id=<c:out value="${row.id}"></c:out>&user=<c:out value="${username}"></c:out>"><span
							class="btn btn-danger">X</span></a></td>

				</tr>
			</table>
		</c:forEach>
		<h4 style="margin-top: 40px; margin-bottom: 40px;">
			Cart item(s):
			<c:out value="${count}"></c:out>
		</h4>
		<h4 style="margin-top: 40px; margin-bottom: 40px;">
			Order Total: &#36;
			<c:out value="${ total}"></c:out>
		</h4>

		<a href=""><input type="submit" value="Proceed to Checkout"
			class="btn btn-success"
			style="width: 100%; padding: 8px; font-size: 16px;"></a><br>
		<a href="AdminController?page=continue"><input type="button"
			value="Continue Shopping" class="btn btn-warning"
			style="width: 100%; padding: 8px; font-size: 16px;"></a> <br>
		<br>

	</div>




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