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
<title>Issue Car</title>
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
			String carId=request.getParameter("carid");
			String customerId=request.getParameter("customerid");
			String customerName=request.getParameter("customername");
			String licenseNumber =request.getParameter("licensenumber");
			Long customermobile=Long.parseLong(request.getParameter("customermobile"));
			
			IssueCarBean bean= new IssueCarBean(carId,customerId,customerName,licenseNumber,customermobile);
			int i=CarDao.issueCar(bean);
			if(i>0){
				out.println("<script type='text/javascript'>");
				out.print("alert('Car Issued Successfully')");
				out.print("</script>");
%>	
	<jsp:include page="/carproviderservices.html"></jsp:include>
	  
	  <%
		}
			else
			{
				out.println("<script type='text/javascript'>");
				out.print("alert('Sorry, Unable to issue Car.We may have sortage of cars')");
				out.print("</script>");
	  %>
	  <jsp:include page="/issuecarform.html"></jsp:include>
	  <%
			}
		}
	  %>
				
</body>
</html>

