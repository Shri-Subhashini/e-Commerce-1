<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopp | Admin</title>
<link rel="icon" type="image/png" href="img/logo.png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<style>
body {
	padding: 0;
	margin: 0;
	font-family: Tahoma, Century Gothic;
	overflow: scroll;
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
	margin-right: 10px;
}

.headerlogin li {
	display: inline-block;
}

#searchbar {
	border: 2px solid white;
	border-radius: 5px;
	outline: none;
	height: 36px;
	width: 500px;
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

.logindropdown {
	position: relative;
	display: inline-block;
}

.dropbutton {
	color: #6C44C4;
	padding: 12px 20px 9px 20px;
	background-color: white;
	font-size: 16px;
	text-transform: uppercase;
	text-decoration: none;
	border: none;
	border-radius: 5px;
}

.dropdowncontent {
	display: none;
	position: absolute;
	width: 200px;
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

/
second bar styles /
#secondbar {
	background-color: #b49ce3;
	height: 40px;
	padding: 0px;
	z-index: -1;
	margin-top: -16px;
}

/* style for popup sign up window*/
#popup-parent {
	position: absolute;
	width: 40%;
	height: 75%;
	background: rgba(204, 204, 204, .7);
	z-index: 1;
	margin-left: 30%;
	margin-top: 5%;
	border-radius: 5px;
}

#x:hover {
	color: #6C44C4;
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

#close {
	text-align: right;
	padding-right: 10px;
}

#log img {
	margin-top: 2%;
	height: 40px;
	width: 120px;
}

#msg1, #msg2, #msg3 {
	color: #6C44C4;
}

::placeholder {
	color: black;
	opacity: 1; /* Firefox */
}

:-ms-input-placeholder { /* Internet Explorer 10-11 */
	color: black;
}

::-ms-input-placeholder { /* Microsoft Edge */
	color: black;
}

table th {
	text-align: left;
	background-color: #6C44C4;
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
	<div id="header">
		<a id="logo" href="home.jsp"><img src="shopp.png"></a>
		<ul class="headerlogin">
			<li><a href="adminindex.jsp">Product Details</a></li>
			<li><a href="customerdetails.jsp">Customer Details</a></li>
			<li><a href="transaction.jsp">Transaction Details</a></li>
			<li><a href="addproduct.jsp">Add Product</a></li>
			<li><a href="AdminController?page=admin-login-out"><i
					class="fa fa-sign-out " style="font-size: 18px"></i>LOG OUT</a></li>
		</ul>
	</div>

	<sql:setDataSource user="root" password="Subha@2127"
		driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3307/test"
		var="ds" />

	<sql:query var="result" dataSource="${ds }">
 
		 select * from product
		 
	   </sql:query>


	<div class="container">
		<h2>Products List:</h2>
		<table>
			<tr>
				<th style="width: 100px;">Item id</th>
				<th style="width: 100px;">Name</th>
				<th style="width: 100px;">Price</th>
				<th style="width: 100px;">Category</th>
				<th style="width: 100px;">SubCategory</th>
				<th style="width: 100px;">Image</th>
				<th style="width: 100px;">Option</th>
			</tr>
		</table>
		<c:forEach items="${result.rows }" var="row">
			<table style="table-layout: fixed; width: 100%;">
				<tr>
					<td style="width: 100px;"><c:out value="${row.id }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.name }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.price }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.category}" /></td>
					<td style="width: 100px;"><c:out value="${row.subcategory}" /></td>
					<td style="width: 100px;"><img src="${row.image}" height="100"
						width="150"></td>
					<td style="width: 100px;"><a
						href="<%= request.getContextPath() %>/AdminController?page=edit&id=${row.id}"
						style="color: #6C44C4;">edit</a> | <a
						href="<%= request.getContextPath() %>/AdminController?page=delete&id=${row.id}"
						style="color: #6C44C4;">delete</a></td>
				</tr>
			</table>
		</c:forEach>
	</div>
</body>
</html>