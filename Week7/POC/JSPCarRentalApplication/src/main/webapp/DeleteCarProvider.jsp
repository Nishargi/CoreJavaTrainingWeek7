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
			int status = CarProviderDao.delete(id);
			if(status>0)
			{
				out.println("<script type='text/javascript'>");
				out.print("alert('Successfully Deleted!')");
				out.print("</script>");
			}			
%>	
	<jsp:include page="ViewCarProvider.jsp"></jsp:include>
	  
	  <%
		}	
	  %>
				
</body>
</html>

