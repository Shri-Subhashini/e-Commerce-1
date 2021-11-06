<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Shopp | Add product</title>
<link rel="icon" type="image/png" href="img/logo.png">
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

#msg1, #msg2, #msg3 {
	color: #6C44C4;
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

option, select {
	background: none;
	padding-right: 20px;
	border: 2px solid #6C44C4;
	border-radius: 5px;
	color: black;
}
</style>
<script type="text/javascript">
	var products = {		Mobiles : [ "IPhone", "Samsung", "BlackBerry", "Vivo", "Realme",
				"Redmi", "Oppo", "Oneplus" ],
		Laptops : [ "Asus", "Dell", "Hp", "Lenovo", "MacBook" ],
		SmartHome : [ "Lamp", "SmartLock", "SecurityCamera", "Alexa", "Wifi" ],
		MensFashion : [ "Clothing", "FootWear", "Accessories",
				"BeautyProducts", "Watches" ],
		WomensFashion : [ "WomenClothing", "WomenFootwear", "WomenAccessories",
				"WomenBeautyProducts", "WomenWatches" ],
		KidsFashion : [ "Boys", "Girls", "KidsAccessories", "KidsToys",
				"KidsFootWear" ],
		Books : [ "Horror", "Comics", "Thriller", "Biography", "Romantic" ],
		Babies : [ "BabyToys", "BabyClothing", "BabyDiaper", "BathEssentials",
				"FeedingEssentials" ],
		Sports : [ "SportAccessories", "SportClothing", "SportFootWear" ],
		Luggages : [ "TravelTotes", "DuffelBags", "TravelPacks",
				"RollingLuggage", "WheeledBackpacks" ]
	}
	function makeSubmenu(value) {
		if (value.length == 0)
			document.getElementById("subcategory").innerHTML = "<option></option>";
		else {
			var productOptions = "";
			for (subcategoryid in products[value]) {
				productOptions += "<option>" + products[value][subcategoryid]
						+ "</option>";
			}
			document.getElementById("subcategory").innerHTML = productOptions;
		}
	}
	function resetSelection() {
		document.getElementById("category").selectedIndex = 0;
		document.getElementById("subcategory").selectedIndex = 0;
	}
</script>
</head>
<body onload="resetSelection()">

	<div id="popup-parent">
		<center>
			<a id="log" href="home.jsp"><img src="shopp.png"></a>
		</center>
		<center>
			<h1>ADD PRODUCT</h1>
		</center>
		<br>
		<br>
		<form id="theform" action="AdminController" method="post"
			onsubmit="return validation()">

			<label for="category">Category:</label> <select id="category"
				name="category" onchange="makeSubmenu(this.value)" size="1">
				<option value="" disabled selected>Choose category</option>
				<option value="Mobiles">Mobiles</option>
				<option value="Laptops">Laptops</option>
				<option value="SmartHome">SmartHome</option>
				<option value="MensFashion">Mensfashion</option>
				<option value="WomensFashion">Womensfashion</option>
				<option value="KidsFashion">Kidsfashion</option>
				<option value="Books">Books</option>
				<option value="Babies">Babies</option>
				<option value="Sports">Sports</option>
				<option value="Luggages">Luggages</option>
			</select> <br>
			<br> <label for="subcategory">Sub Category:</label> <select
				id="subcategory" name="subcategory" size="1">
				<option value="" disabled selected>Choose Sub Category</option>
				<option></option>
			</select> <br>
			<br> <input type="hidden" name="page" value="add_product">
			<label for="productName">PRODUCT NAME:</label> <input type="text"
				id="productName" name="productName"
				placeholder="product name goes here" required> <span
				id="msg1"></span> <br>
			<br> <label for="price">Price: </label> <input type="text"
				id="price" name="price" placeholder="product price" required>
			<span id="msg2"></span> <br>
			<br> <label>Available count:</label> <input type="text"
				name="available" placeholder="count" required> <br>
			<br> <label for="image">Select an image to upload:</label> <input
				type="file" id="image" name="image" required><br> <span
				id="msg3"></span> <br>
			<br>
			<center>
				<input id="submit" type="submit" value="ADD PRODUCT">
			</center>
		</form>
	</div>
	<div id="header">
		<a id="logo" href="home.jsp"><img src="img/logo.png"></a>
		<ul class="headerlogin">
			<li><a href="adminindex.jsp">Product Details</a></li>
			<li><a href="addproduct.jsp">ADD PRODUCT</a></li>
			<li><a href="AdminController?page=admin-login-out"><i
					class="fa fa-sign-out " style="font-size: 18px"></i>LOG OUT</a></li>
		</ul>
	</div>
</body>
</html>
