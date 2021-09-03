<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.ecar.dao.CarProviderDao"%>
<%@ page import="com.ecar.beans.CarProviderBean"%>
<%@ page import = "java.io.*,java.util.*" %>
<jsp:useBean id="carProvider" class="com.ecar.beans.CarProviderBean" />
<jsp:setProperty property="*" name="carProvider" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit CarProvider Form</title>
</head>
<body>
<jsp:include page="/editcarprovider.html"></jsp:include>
<%
	out.println("<div class='container'>");
	String sid=request.getParameter("id");
	int id=Integer.parseInt(sid);
	
	CarProviderBean bean=CarProviderDao.viewById(id);
	
	out.print("<form action='EditCarProvider.jsp' method='post' style='width:300px'>");
	out.print("<div class='form-group'>");
	out.print("<input type='hidden' name='id' value='"+bean.getId()+"'/>");
	out.print("<label for='name1'>Name</label>");
	out.print("<input type='text' class='form-control' value='"+bean.getFullName()+"' name='name' id='name1' placeholder='Full Name'/>");
	out.print("</div>");
	out.print("<div class='form-group'>");
	out.print("<label for='email1'>Email address</label>");
	out.print("<input type='email' class='form-control' value='"+bean.getEmail()+"'  name='email' id='email1' placeholder='Email'/>");
	out.print("</div>");
	out.print("<div class='form-group'>");
	out.print("<label for='password1'>Password</label>");
	out.print("<input type='password' class='form-control' value='"+bean.getPassword()+"'  name='password' id='password1' placeholder='Password'/>");
	out.print("</div>  ");
	out.print("<div class='form-group'>");
	out.print("<label for='mobile1'>Mobile Number</label>");
	out.print("<input type='number' class='form-control' value='"+bean.getMobile()+"'  name='mobile' id='mobile1' placeholder='Mobile'/>");
	out.print("</div>");
	out.print("<button type='submit' class='btn btn-danger'>Update</button>");
	out.print("</form>");
	
	out.println("</div>");
%>
</body>
</html>