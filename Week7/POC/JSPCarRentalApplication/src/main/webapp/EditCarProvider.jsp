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
<title>Delete CarProvider</title>
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
			
			String sid=request.getParameter("id");
			int id=Integer.parseInt(sid);
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String mobile=request.getParameter("mobile");
			
			CarProviderBean bean= new CarProviderBean(id,name, email, password, mobile);
			CarProviderDao.update(bean);
			
			out.println("<script type='text/javascript'>");
			out.print("alert('Succesfully Updated!')");
			out.print("</script>");
%>	
	<jsp:include page="adminservices.html"></jsp:include>
	  
	  <%
		}	
	  %>
				
</body>
</html>

