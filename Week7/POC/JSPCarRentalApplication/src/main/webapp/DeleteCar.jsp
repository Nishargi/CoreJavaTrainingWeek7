<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.ecar.dao.CarDao"%>
<%@ page import="com.ecar.beans.CarBean"%>
<%@ page import = "java.io.*,java.util.*" %>
<jsp:useBean id="car" class="com.ecar.beans.CarBean" />
<jsp:setProperty property="*" name="car" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Car</title>
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
		<jsp:include page="/carProviderloginform.html"></jsp:include>
		<% 
		}
		else
		{
			CarDao.delete(request.getParameter("carid"));
			out.println("<script type='text/javascript'>");
			out.print("alert('Succesfully Deleted!')");
			out.print("</script>");
%>	
	<jsp:include page="/ViewCar.jsp"></jsp:include>
	  
	  <%
		}	
	  %>
				
</body>
</html>

