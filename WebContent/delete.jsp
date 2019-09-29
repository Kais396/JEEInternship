<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="jdbc.ConnectionManager" %>
<%@page import="java.sql.*"  %> 
<%
String id= request.getParameter("id") ; 
int no = Integer.parseInt(id);
Connection currentCon = ConnectionManager.getConnection(); 
Statement stmt=currentCon.createStatement();
stmt.executeUpdate("delete from users where id ='"+no+"'") ; 
response.sendRedirect("admintable.jsp") ; 




%>