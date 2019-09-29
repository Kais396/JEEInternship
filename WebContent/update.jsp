<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="jdbc.ConnectionManager"%>
<%@page import="java.sql.*"%>

<%
	String id = request.getParameter("id");
	int no = Integer.parseInt(id);
	Connection currentCon = ConnectionManager.getConnection();
	Statement stmt = currentCon.createStatement();
	String f = request.getParameter("firstName");
	String l = request.getParameter("lastName");
	String us = request.getParameter("Username");
	String em = request.getParameter("Email");
	String dept = request.getParameter("Dept");
	String city = request.getParameter("City");
	String coun = request.getParameter("Country");
	stmt.executeUpdate("UPDATE `users` SET `firstname` ='" + f + "', `lastname` ='" + l + "', `username` ='"
			+ us + "', `email` ='" + em + "', `dept` ='" + dept + "', `city` ='" + city + "', `country` ='"
			+ coun + "' WHERE `users`.`id` ='" + no + "'");
	response.sendRedirect("admintable.jsp");
%>