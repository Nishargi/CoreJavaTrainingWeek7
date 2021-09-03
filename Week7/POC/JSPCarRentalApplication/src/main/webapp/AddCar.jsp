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
<title>Add Car</title>
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
			String modelName=request.getParameter("modelname");
			String year=request.getParameter("year");
			float mileage= Float.parseFloat(request.getParameter("mileage"));
			int seatingCapacity = Integer.parseInt(request.getParameter("capacity"));
			int price = Integer.parseInt(request.getParameter("price"));
			int quantity= Integer.parseInt(request.getParameter("quantity"));
			CarBean bean= new CarBean(carId,modelName,year,mileage,seatingCapacity,price,quantity);
			int i=CarDao.save(bean);
			if(i>0){
				out.println("<script type='text/javascript'>");
				out.print("alert('Car saved successfully')");
				out.print("</script>");	
			}
%>	
	<jsp:include page="/addcarform.html"></jsp:include>
	  
	  <%
		}	
	  %>
				
</body>
</html>

