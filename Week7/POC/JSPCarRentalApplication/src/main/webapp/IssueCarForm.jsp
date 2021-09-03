<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Issue Car Form</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <style>
  .navhome,.navlogo{
    margin:10px;
  }
  .ulhome
  {
  	margin-left:150px;
  	padding:10px;
  }
  .adminnavright
  {
   margin-left:1000px;
  }
  .section2{
  margin-left:300px;
 }
 .l1{
  margin-top:100px;
  margin-left:350px;
  padding:30px;
 }
  </style>
  
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark navhome">
  
  <a class="navbar-brand navlogo" href="#">
    <img src="images/car.png" alt="logo" style="width:40px;">
  </a>
  
  <ul class="navbar-nav ulhome">
    <li class="nav-item">
      <a class="nav-link" href="carproviderservices.html"> CarProviderHome </a>
    </li>
  </ul>
  <ul class="nav navbar-nav navbar-right adminnavright">
      <li class="nav-item"><a class="nav-link" href="CarProviderLogout.jsp"><span class="glyphicon glyphicon-log-in"></span> LogOut </a></li>   
  </ul>
</nav>
<div class="container section2">
 <a href="ViewAvailableCars.jsp" class="btn btn-outline-danger l1" role="button"> Search Available Cars </a>
</div>
</body>
</html>