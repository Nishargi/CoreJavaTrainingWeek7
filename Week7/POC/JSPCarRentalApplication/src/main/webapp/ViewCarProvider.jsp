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
<title>View CarProvider</title>
</head>
<body>
<%
		
		request.getSession(false);

		//String role = (String) pageContext.getAttribute("role",PageContext.SESSION_SCOPE);  
		
		if(session.getAttribute("role") == null)
		{
			out.println("<script type='text/javascript'>");
			out.print("alert('Sorry,Please Login First!')");
			out.print("</script>");	
			
		%>
		<jsp:include page="/adminloginform.html"></jsp:include>
		<% 
		}
		else
		{
		
		%>	
	  <jsp:include page="/viewcarprovider.html"></jsp:include>
	  
	  <%
	  	out.println("<div class='container'>");
		
		List<CarProviderBean> list=CarProviderDao.view();
		
		out.println("<table class='table table-bordered table-striped'>");
		out.println("<tr><th>Id</th><th>Full Name</th><th>Email</th><th>Password</th><th>Mobile</th><th>Edit</th><th>Delete</th></tr>");
		for(CarProviderBean bean:list){
			out.println("<tr><td>"+bean.getId()+"</td><td>"+bean.getFullName()+"</td><td>"+bean.getEmail()+"</td><td>"+bean.getPassword()+"</td><td>"+bean.getMobile()+"</td><td><a href='EditCarProviderForm.jsp?id="+bean.getId()+"'>Edit</a></td><td><a href='DeleteCarProvider.jsp?id="+bean.getId()+"'>Delete</a></td></tr>");
		}
		out.println("</table>");
		
		out.println("</div>");
		}
		
	  %>
				
</body>
</html>

