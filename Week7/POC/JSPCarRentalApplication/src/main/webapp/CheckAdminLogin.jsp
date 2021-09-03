<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Admin Login</title>
</head>
<body>

<%	
        String email = request.getParameter("email");
		String password = request.getParameter("password");

		if(email.equals("admin@admin.com")&&password.equals("admin123"))
		{
			request.getSession();
			session.setAttribute("role", "admin");
			//pageContext.setAttribute("role","admin",PageContext.SESSION_SCOPE);
			out.println("<script type='text/javascript'>");
			out.println("alert('You Have Successfully Logged In..');");
			out.println("</script>");
			
		%>
		<jsp:include page="/adminservices.html"></jsp:include>
	<%
		}
		else{
			out.println("<script type='text/javascript'>");
			out.println("alert('Username/Password Error')");
			out.print("</script>");
			%>
			<jsp:include page="/adminloginform.html"></jsp:include>
		<%
		}	
%>

</body>
</html>