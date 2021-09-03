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
<title>Check CarProvider Login</title>
</head>
<body>
<%	
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			if(CarProviderDao.authenticate(email, password))
			{
				request.getSession();
				session.setAttribute("role", "carprovider");
				//pageContext.setAttribute("role","carprovider",PageContext.SESSION_SCOPE);
				out.println("<script type='text/javascript'>");
				out.println("alert('You Have Successfully Logged In..');");
				out.println("</script>");
			
		%>
		<jsp:include page="/carproviderservices.html"></jsp:include>
	<%
		}
		else{
			out.println("<script type='text/javascript'>");
			out.println("alert('Username/Password Error')");
			out.print("</script>");
			%>
			<jsp:include page="/carProviderloginform.html"></jsp:include>
		<%
		}	
%>

</body>
</html>