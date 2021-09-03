<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <% request.getSession(false);
 session.invalidate(); %>
 
 <jsp:forward page="index.html"/>
 
 %>
 