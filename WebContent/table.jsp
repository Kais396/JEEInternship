<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="jdbc.ConnectionManager"%>
<%@page import="jdbc.Login"%>
<%@page import="jdbc.UserBean"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
	<link rel="icon" type="image/png" href="img/favicon.ico">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>Users Mangment</title>
		<meta
			content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
			name='viewport' />
		<!--     Fonts and icons     -->
		<link
			href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
			rel="stylesheet" />
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
		<!-- CSS Files -->
		<link href="css/bootstrap.min.css" rel="stylesheet" />
		<link href="css/light-bootstrap-dashboard.css?v=2.0.0 "
			rel="stylesheet" />
		<!-- CSS Just for demo purpose, don't include it in your project -->
		<link href="css/demo.css" rel="stylesheet" />
</head>

<body>
	<div class="wrapper">
		<div class="sidebar" data-image="img/sidebar-5.jpg">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="userLogged.jsp" class="simple-text"> Users List </a>
				</div>
				<ul class="nav">

					<li><a class="nav-link" href="userLogged.jsp"> <i
							class="nc-icon nc-circle-09"></i>
							<p>User Profile</p>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="table.jsp"> <i class="nc-icon nc-notes"></i>
							<p>Users List</p>
					</a></li>



				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg " color-on-scroll="500">
			<div class="container-fluid">

				<div class="collapse navbar-collapse justify-content-end"
					id="navigation">

					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link"
							href="userLogged.jsp"> <span class="no-icon">Account</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="logout.jsp">
								<span class="no-icon">Log out</span>
						</a></li>
					</ul>
				</div>
			</div>
			</nav>
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card strpied-tabled-with-hover">
								<div class="card-header ">
									<h4 class="card-title">USERS TABLES</h4>

								</div>
								<div class="card-body table-full-width table-responsive">
									<table class="table table-hover table-striped">
										<thead>
											<th>ID</th>
											<th>Name</th>
											<th>Email Address</th>
											<th>Department Name</th>
											<th>City</th>
										</thead>
										<tbody>
											<%
												UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
												String Dept = currentUser.getDept();
												Connection currentCon = null;
												String sql = "select * from users where dept='" + Dept + "' ";
												currentCon = ConnectionManager.getConnection();
												Statement statement = currentCon.createStatement();
												ResultSet rs = statement.executeQuery(sql);
												while (rs.next()) {
											%>
											<tr>
												<td><%=rs.getInt("id")%></td>
												<td><%=rs.getString("username")%></td>
												<td><%=rs.getString("email")%></td>
												<td><%=rs.getString("dept")%></td>
												<td><%=rs.getString("city")%></td>
											</tr>
											<%
												}
											%>










										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
<!--   Core JS Files   -->
<script src="js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="js/core/popper.min.js" type="text/javascript"></script>
<script src="js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="js/light-bootstrap-dashboard.js?v=2.0.0 "
	type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="js/demo.js"></script>

</html>