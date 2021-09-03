<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.ecar.dao.CarDao"%>

<%@ page import="com.ecar.beans.IssueCarBean"%>
<%@ page import = "java.io.*,java.util.*" %>
<jsp:useBean id="Issuecar" class="com.ecar.beans.IssueCarBean" />
<jsp:setProperty property="*" name="Issuecar" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Return Car</title>
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
			String carid=request.getParameter("carid");
			int customerid=Integer.parseInt(request.getParameter("customerid"));
			
			int i=CarDao.returnCar(carid, customerid);
			if(i>0){
				out.println("<script type='text/javascript'>");
				out.print("alert('Car Returned Successfully')");
				out.print("</script>");
%>	
	<jsp:include page="/carproviderservices.html"></jsp:include>
	  
	  <%
		}
			else
			{
				out.println("<script type='text/javascript'>");
				out.print("alert('Sorry, unable to return Car.Kindly visit later')");
				out.print("</script>");
	  %>
	  <jsp:include page="/returncarform.html"></jsp:include>
	  <%
			}
		}
	  %>
				
</body>
</html>

