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
		{ %>
		<jsp:include page="/viewavailablecars.html"></jsp:include>
		<%
		
		out.println("<div class='container'>");
		
		List<CarBean> list=CarDao.viewAvailableCars();
		
		out.println("<table class='table table-bordered table-striped'>");
		out.println("<tr><th>Car Id</th><th>Model Name</th><th>Manufacturing Year</th><th>Mileage</th><th>Seating Capacity</th><th>Price(Per Day)</th><th>Quantity</th><th>Issued</tr>");
		for(CarBean bean:list){
			out.println("<tr><td>"+bean.getCarId()+"</td><td>"+bean.getModelName()+"</td><td>"+bean.getManufacturingYear()+"</td><td>"+bean.getMileage()+"</td><td>"+bean.getSeatingcapacity()+"</td><td>"+bean.getPricePerDay()+"</td><td>"+bean.getQuantity()+"</td><td>"+bean.getIssued()+"</td></tr>");
		}
		out.println("</table>");
		
		out.println("</div>");
		}	
	  %>
	  <jsp:include page="/issuecarform.html"></jsp:include>
				
</body>
</html>

