<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Security</title>
<link rel = "icon" type = "image/png" href = "img/logo.png">
</head>
<style>
body{
	height:100%;
	width:100%;
	font-family: Tahoma, Century Gothic;
	background-color:rgba(204, 204,204, .3);
  }
.container{
	background: rgba(204, 204,204, .7) ;
	width:38%;
	height:100%;
	margin-left:30%;
	border-radius:15px;
  }  
form{
	max-width: 400px;
	margin: auto;
}

label{
    width:200px;
    display:inline-block;
    }
input{
    border: 2px solid #6C44C4;
    height: 20px;
    width: 160px;
	outline: none;
	border-radius:5px;
	background:none;    
}
input:focus{
	border-color:black;
}
#submit{
width:120px;
height:30px;
font-size:16px;
color:white;
background-color:#6C44C4;
border:none;
margin-bottom:2%;
}
#submit:hover{
	background-color:#6C44C4;
color:black;
cursor: -webkit-grab; cursor: grab;	
}
.spanagree{
	color:#6C44C4;
}
 a{
  display: block;
   border:none;
   text-decoration:none;
}
.spanagree:hover{
	color:black;
	text-decoration: underline; 
}
span{
	color:black;
}

#logo img{
	margin-top:2%;
	height:40px;width:120px;
	}
#msg1{
color:#6C44C4;
}
</style>
<script type="text/javascript">
 function validation()
 {
 $('#msg1').html('')
 var id= document.forms["theform"]["customerId"].value;
  var phoneno = /^\d{10}$/;
  var email = /^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w{2,3})+$/;
  if(id.match(phoneno) || id.match(email)){
  return true;
  }
  else{
  document.getElementById("msg1").innerHTML = "Invalid mobile number or mail id..";
	return false;
  }
 }
 </script>
</head>
 <body>
    <div class="container">
	<center><a id="logo" href="home.jsp"><img src="shopp.png"></a> </center> 
<center><h2>CUSTOMER SIGN IN</h2></center>
  <form id="theform" action="AdminController" method="post" onsubmit="return validation()">
  <input type="hidden" name="page" value="security-signin-form">
    <label for="customerMail">USER ID: </label>
    <input type="text" id="customerMail" name="customerMail" placeholder="Enter  email id" required>
	<span id="msg1"></span>
	<br><br>
	<label for="customerPassword">PASSWORD: </label>
    <input type="password" id="customerPassword" name="customerPassword" required>
	<br><br>
    <center><input id="submit" type="submit" value="SIGN IN"></center>
  </form>
  <center><p>By creating an account or logging in,<br> you agree to 
  <span class="spanagree">Conditions of Use</span> and <span class="spanagree">Privacy Policy</span>.</p></center>
 <center><p> New user? <a href="customersignup.jsp"><span class="spanagree">Sign Up</span></a><br>
 <center><a href="home.jsp"><span class="spanagree">Back to Home</span></a></p></center><br>
  </div>
  
  </body>
</html>