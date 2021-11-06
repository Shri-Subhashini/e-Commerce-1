<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"crossorigin="anonymous"></script>

 <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="//raw.github.com/botmonster/jquery-bootpag/master/lib/jquery.bootpag.min.js"></script>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">


    <title>Online Shopping site</title>
    <link rel="icon" type="image/png" href="img/logo.png">
    <style>
html {
  scroll-behavior: smooth;
}
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
            margin-center:2px;
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
background:none;
        }

        #searchbar:focus {
            border-color: black;
        }

select{
    overflow:auto;
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
            z-index=1;

        }
       
        .headerlogin1 li a {
            color: #6C44C4;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: white;
            font-size: 13px;
            text-transform: uppercase;
            text-decoration: none;
			 z-index=1;
           
        }

        .headerlogin1 li a:hover {
            background: black;
            color: white;
            z-index=1;

        }

        .logindropdown {
            position: relative;
            display: inline;
           

        }

        .dropbutton1 {
            color: #6C44C4;
            padding: 8px 20px 8px 20px;
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

        .dropdowncontent {
            display: none;
            position: absolute;
            width: 200px;
			z-index:2;


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

        /second bar styles/
        #secondbar {
            background-color: #b49ce3;
            height: 55px;
            padding: 0px;
            z-index: -1;
            margin-top: -16px;
        }

        /* style for popup sign up window*/
       
#contactus {
           top:0px;
		   position:relative;
            width: 100%;
            height: 43%;
background-color:#6C44C4;
left:0;
        }

        h2 {
            color:white;
margin-left:10px;

        }

        .address{
text-align: center;
}
        .social {
            text-align: center;
            margin-top: 2%;
bottom:2%;

        }

        .address li {
            display: block;
            list-style: none;
            font-size: 20px;
            padding: 10px 20px;
        }
.social li,.btt li {
            display: inline-block;
            list-style: none;
            font-size: 20px;
            padding: 10px 20px;
        }

        .address li a,
        .social li a {
            text-decoration: none;
            color: white;
        }

        .address li a:hover,
        .social li a:hover,.btt li a:hover {
            text-decoration: none;
            color:black;
        }
.btt{
text-align: center;
bottom:2%;
}
.btt li a{
color:#6C44C4;
}

.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border-radius: 5px;
}

.pagination a:hover:not(.active) {
  background-color: #ddd;
  border-radius: 5px;
}

    </style>
     <script> 
    $(document).ready(function() {
var data = [
{label: 'Mobiles', value: 'AdminController?page=Mobiles'},
{label: 'Oppo', value: 'AdminController?page=Oppo'},
{label: 'Oneplus', value: 'AdminController?page=Oneplus'},
{label: 'Vivo', value: 'AdminController?page=Vivo'},
{label: 'Realme', value: 'AdminController?page=Realme'},
{label: 'All mobiles', value: 'AdminController?page=Mobiles'},
{label: 'IPhone', value: 'AdminController?page=IPhone'},
{label: 'Samsung', value: 'AdminController?page=Samsung'},
{label: 'Blackberry', value: 'AdminController?page=BlackBerry'},
{label: 'Redmi', value: 'AdminController?page=Redmi'},
{label: 'Laptops', value: 'AdminController?page=Laptops'},
{label: 'Smart Home', value: 'AdminController?page=SmartHome'},
{label: 'Lamp', value: 'AdminController?page=Lamp'},
{label: 'Smart Lock', value: 'AdminController?page=SmartLock'},
{label: 'Security Camera', value: 'AdminController?page=SecurityCamera'},
{label: 'Alexa', value: 'AdminController?page=Alexa'},
{label: 'Wifi', value: 'AdminController?page=Wifi'},
{label: 'Mens Fashion', value: 'AdminController?page=MensFashion'},
{label: 'Mens Clothing', value: 'AdminController?page=Clothing'},
{label: 'Mens Foot wear', value: 'AdminController?page=Footwear'},
{label: 'Mens Accessories', value: 'AdminController?page=Accessories'},
{label: 'Mens Beauty Products', value: 'AdminController?page=BeautyProducts'},
{label: 'Mens Watches', value: 'AdminController?page=Watches'},
{label: 'Womens Fashion', value: 'AdminController?page=WomensFashion'},
{label: 'Kids Fashion', value: 'AdminController?page=KidsFashion'},
{label: 'Boys', value: 'AdminController?page=Boys'},
{label: 'Girls', value: 'AdminController?page=Girls'},
{label: 'Books', value: 'AdminController?page=Books'},
{label: 'All Books', value: 'AdminController?page=Books'},
{label: 'Horror', value: 'AdminController?page=Horror'},
{label: 'Comics', value: 'AdminController?page=Comics'},
{label: 'Thriller', value: 'AdminController?page=Thriller'},
{label: 'Biography', value: 'AdminController?page=Biography'},
{label: 'Romantic', value: 'AdminController?page=Romantic'},
{label: 'Babies', value: 'AdminController?page=Babies'},
{label: 'All Baby Products', value: 'AdminController?page=Babies'},
{label: 'Baby Toys', value: 'AdminController?page=BabyToys'},
{label: 'Baby Clothing', value: 'AdminController?page=BabyClothing'},
{label: 'Diaper', value: 'AdminController?page=BabyDiaper'},
{label: 'Bath Essentials', value: 'AdminController?page=BathEssentials'},
{label: 'Sports', value: 'AdminController?page=Sports'},
{label: 'All Sports Items', value: 'AdminController?page=Sports'},
{label: 'Sports Accessories', value: 'AdminController?page=SportsAccessories'},
{label: 'Sports Clothing', value: 'AdminController?page=SportsClothing'},
{label: 'Sports Footwear', value: 'AdminController?page=SportsFootwear'},
{label: 'Bags & Luggages', value: 'AdminController?page=Luggages'},
{label: 'All Bags', value: 'AdminController?page=Luggages'},
{label: 'Travel Totes', value: 'AdminController?page=TravelTotes'},
{label: 'Duffel Bags', value: 'AdminController?page=DuffelBags'},
{label: 'Travel Packs', value: 'AdminController?page=TravelPacks'},
{label: 'Rolling Luggage', value: 'AdminController?page=RollingLuggage'},
{label: 'Wheeled Backpacks', value: 'AdminController?page=WheeledBackpacks'},
{label: 'All Kids Products', value: 'AdminController?page=KidsProducts'},
{label: 'Kids Accessories', value: 'AdminController?page=KidsAccessories'},
{label: 'Kids Footwear', value: 'AdminController?page=KidsFootwear'},
{label: 'Womens Foot wear', value: 'AdminController?page=WomenFootwear'},
{label: 'Womens Accessories', value: 'AdminController?page=WomenAccessories'},
{label: 'Womens Beauty Products', value: 'AdminController?page=WomenBeautyProducts'},
{label: 'Womens Watches', value: 'AdminController?page=WomensWatches'}


];

    $("input#searchbar").autocomplete({
source: data,
focus: function (event, ui) {
$(event.target).val(ui.item.label);
return false;
},
select: function (event, ui) {
$(event.target).val(ui.item.label);
window.location = ui.item.value;
return false;
}
},
{

delay:0,
minLength:2
});
  });
    
    </script>

</head>

<body>
    <div id="header">
        <a id="logo" href="home.jsp"><img src="shopp.png"></a>
        <ul class="headerlogin">
            <li>
                <input type="text" placeholder="Search for products,brands and more" id="searchbar">
            </li>
            <li>
                <button type="submit" id="searchsubmit"><i class="fa fa-search"></i></button>
            </li>
            
            <li>
                <a href="#">ORDERS</a>
            </li>
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
			<li><a href="AdminController?page=customer_sign_out"><i
					class="fa fa-sign-out " style="font-size: 18px"></i>SIGN OUT</a></li>
        </ul>
    </div>
<input type="hidden" name="customerId" id="customerId" value="<%=request.getParameter("customerId1")%>">

    <div id="secondbar">
        <ul class="headerlogin1">

  <li>
                <div class="logindropdown">
                    <button class="dropbutton">Mobiles</button>
                    <div class="dropdowncontent">
                  <a href="AdminController?page=Mobiles">All mobiles</a>
                        <a href="AdminController?page=IPhone">IPhone</a>
                       <a href="AdminController?page=Samsung" >Samsung</a>
                        <a href="AdminController?page=BlackBerry">BlackBerry</a>
                        <a href="AdminController?page=Vivo">Vivo</a>
                        <a href="AdminController?page=Realme">Realme</a>
                        <a href="AdminController?page=Redmi">Redmi</a>
                        <a href="AdminController?page=Oppo">Oppo</a>
                        <a href="AdminController?page=Oneplus">Oneplus</a>
                    
                    </div>
                </div>
            </li>
            <li>
                <div class="logindropdown">
                    <button class="dropbutton">Laptops</button>
                    <div class="dropdowncontent">
     <a href="AdminController?page=Laptops">All Laptops</a>                 
   <a  href="AdminController?page=Asus">Asus</a>
  <a href="AdminController?page=Dell">Dell</a>
  <a  href="AdminController?page=Hp">Hp</a>
<a  href="AdminController?page=Lenovo">Lenovo</a>
<a  href="AdminController?page=MacBook">MacBook</a>                 
                    </div>
                </div>
            </li>
   
 
            <li>
                <div class="logindropdown">
                    <button class="dropbutton">Smart Home</button>
                    <div class="dropdowncontent">
                        <a href="AdminController?page=SmartHome">All</a>
                        <a href="AdminController?page=Lamp">Lamp</a>
                        <a href="AdminController?page=SmartLock">Smart Lock</a>
                        <a href="AdminController?page=SecurityCamera">Security Camera</a>
                        <a href="AdminController?page=Alexa">Alexa</a>
                        <a href="AdminController?page=Wifi">Wifi</a>
                 
                    </div>
                </div>
            </li>
            <li>
                <div class="logindropdown">
                    <button class="dropbutton">Men's Fashion</button>
                    <div class="dropdowncontent">
                        <a href="AdminController?page=MensFashion">All</a>
                        <a href="AdminController?page=Clothing">Clothing</a>
                        <a href="AdminController?page=Footwear">Foot Wear</a>
                        <a href="AdminController?page=Accessories">Accessories</a>
                        <a href="AdminController?page=BeautyProducts">Beauty Products</a>
                        <a href="AdminController?page=Watches">Watches</a>
                    </div>
                </div>
            </li>
            <li>
                <div class="logindropdown">
                    <button class="dropbutton">Women's Fashion</button>
                    <div class="dropdowncontent">
                       <a href="AdminController?page=WomensFashion">All</a>
                        <a href="AdminController?page=WomenClothing">Clothing</a>
                        <a href="AdminController?page=WomenFootwear">Foot Wear</a>
                        <a href="AdminController?page=WomenAccessories">Accessories</a>
                        <a href="AdminController?page=WomenBeautyProducts">Beauty Products</a>
                        <a href="AdminController?page=WomenWatches">Watches</a>
                    </div>
                </div>
            </li>
            <li>
                <div class="logindropdown">
                    <button class="dropbutton">Kid's Fashion</button>
                    <div class="dropdowncontent">
                        <a href="AdminController?page=KidsFashion">All</a>
                        <a href="AdminController?page=Boys">Boys</a>
                        <a href="AdminController?page=Girls">Girls</a>
                        <a href="AdminController?page=KidsAccessories">Accessories</a>
                        <a href="AdminController?page=KidsToys">Toys</a>
                        <a href="AdminController?page=KidsFootwear">Foot Wear</a>
                    </div>
                </div>
            </li>
            <li>
                <div class="logindropdown">
                    <button class="dropbutton">Books</button>
                    <div class="dropdowncontent">
                        <a href="AdminController?page=Books">All Books</a>
                        <a href="AdminController?page=Horror">Horror</a>
                        <a href="AdminController?page=Comics">Comics</a>
                        <a href="AdminController?page=Thriller">Thriller</a>
                        <a href="AdminController?page=Biography">Biography</a>
                        <a href="AdminController?page=Romantic">Romantic</a>
                    </div>
                </div>
            </li>
        
            <li>
                <div class="logindropdown">
                    <button class="dropbutton">Babies</button>
                    <div class="dropdowncontent">
                        <a href="AdminController?page=Babies">All</a>
                        <a href="AdminController?page=BabyToys">Toys</a>
                        <a href="AdminController?page=BabyClothing">Clothing</a>
                        <a href="AdminController?page=BabyDiaper">Diaper</a>
                        <a href="AdminController?page=BathEssentials">Bath Essentials</a>
                        <a href="AdminController?page=FeedingEssentials">Feeding Essentials</a>
                    </div>
                </div>
            </li>
            <li>
                <div class="logindropdown">
                    <button class="dropbutton">Sports</button>
                    <div class="dropdowncontent">
                          <a href="AdminController?page=Sports">All</a>
                        <a href="AdminController?page=SportAccessories">Accessories</a>
                        <a href="AdminController?page=SportClothing">Clothing</a>
                        <a href="AdminController?page=SportFootwear">Foot Wear</a>
                    </div>
                </div>
            </li>
            <li>
                <div class="logindropdown">
                    <button class="dropbutton">Bags & Luggages</button>
                    <div class="dropdowncontent">
                        <a href="AdminController?page=Bags">All Bags</a>
                        <a href="AdminController?page=TravelTotes">Travel Totes</a>
                        <a href="AdminController?page=DuffelBags">Duffel Bags</a>
                        <a href="AdminController?page=TravelPacks">Travel Packs</a>
                        <a href="AdminController?page=RollingLuggage">Rolling Luggage</a>
                        <a href="AdminController?page=WheeledBackpacks">Wheeled Backpacks</a>
                    </div>
                </div>
            </li>
           
        </ul>
    </div>
	<div class="container">
<div class="row">
<c:forEach items="${list}" var="product">
<c:set var="subcategory"  value="${product.getSubcategory()}"/>
<c:set var="category"  value="${product.getCategory()}"/>
<c:set var="name" value="${param.page}"/>
<c:set var="name1" value="${action}"/>

<c:if test="${subcategory==name || category==name ||subcategory==name1||category==name1}">
          <div class="col-md-3 ">
<center><img src="${product.getImage() }" alt="1" style="width:150px; height:200px;" class="img-responsive" ></center><br>
<div class="text-center"><a style="color: black;"><c:out value="${product.getName() }"></c:out></a></div>
<p style="text-align: center;">&#36;  <c:out value="${ product.getPrice() }"></c:out></p>
<div class="text-center">  <a class="btn btn-primary" href="AdminController?action=<c:out value="${product.getCategory()}"/>&page=addtocart&id=<c:out value="${product.getId()}"/>&uname=<c:out value="${username}"></c:out>">Add to Cart</a>
<a class="btn btn-primary" href="Controller?page=buynow&action=mobiles&id=<c:out value="${product.getId()}"/>">Buy now</a> </div><br>

            </div>
            </c:if>
</c:forEach>
</div>
</div>

<ul class="btt" ><li><a href="#header">BACK TO TOP</a><li></ul>



<div id="contactus">
        <h2>CONTACT US</h2>
        <ul class="address">
            <li><a href="https://goo.gl/maps/fAhLmLkRXpg5g3GX7" target=_blank> Shopp | Chennai | India </a></li>
            <li><a href="tel:+919789480351" target=_blank>Telephone: +919789480351</a></li>
            <li><a href="mailto:shoppexpleo@gmail.com" target=_blank>shoppexpleo@gmail.com</a></li>
        </ul>
        <ul class="social">
            <li><a href="tel:+919789480351" target=_blank><i class="fa fa-phone"></i></a></li>
            <li><a href="mailto:shoppexpleo@gmail.com" target=_blank><i class="fa fa-envelope"></i></a></li>
            <li><a href="https://www.youtube.com/channel/UCHu8bRBcPabhnhIF0UUR1Bw" target=_blank><i class="fa fa-youtube"></i></a></li>
            <li><a href="https://www.instagram.com/shoppadmin/" target=_blank><i class="fa fa-instagram"></i></a></li>
            <li><a href="https://www.facebook.com/profile.php?id=100073813025423" target=_blank><i
                        class="fa fa-facebook"></i></a></li>
            <li><a href="https://twitter.com/Shopp88845346" target=_blank><i class="fa fa-twitter"></i></a></li>
        </ul>
    </div>
</body>

</html>