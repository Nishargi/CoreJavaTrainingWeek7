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
<title>View Car</title>
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
		{	%>	
	<jsp:include page="/viewissuedcar.html"></jsp:include>
	  
	  <%
	  out.println("<div class='container'>");
		
		List<IssueCarBean> list=CarDao.viewIssuedCars();
		
		out.println("<table class='table table-bordered table-striped'>");
		out.println("<tr><th>Car Id</th><th>Customer Id</th><th>Customer Name</th><th>License Number</th><th>CustomerMobile</th><th>Issued Date</th><th>Return Status</th></tr>");
		for(IssueCarBean bean:list){
			out.println("<tr><td>"+bean.getCarId()+"</td><td>"+bean.getCustomerId()+"</td><td>"+bean.getCustomerName()+"</td><td>"+bean.getLicenseNumber()+"</td><td>"+bean.getCustomerMobile()+"</td><td>"+bean.getIssuedDate()+"</td><td>"+bean.getReturnStatus()+"</td></tr>");
		}
		out.println("</table>");
		
		out.println("</div>");
		}
	  %>
				
</body>
</html>

