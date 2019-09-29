<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="jdbc.ConnectionManager" %>
<%@page import="jdbc.Login" %>
<%@page import="jdbc.UserBean" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<!-- Style -->

<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/fresh-bootstrap-table.css" rel="stylesheet" />
 <link href="css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="css/demo.css" rel="stylesheet" />

<!-- Fonts and icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
 <title>Users Mangment</title>
 <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
</head> 
<body>
<div class="sidebar" data-color="blue">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="#" class="simple-text">
                       Users Managment
                    </a>
                </div>
                 <ul class="nav">
                    <li>
                        <a class="nav-link" href="admin.jsp">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li >
                        <a class="nav-link" href="adminprofile.jsp">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>Admin Profile</p>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="admintable.jsp">
                            <i class="nc-icon nc-notes"></i>
                            <p>Users List</p>
                        </a>
                    </li>
                   
                   
                 
                   
                </ul>
            </div>
        </div>
<% int id = 0 ;  %>
<div class ="col-md-8 col-md-offset-3">
<div class="fresh-table">
    <!--    Available colors for the full background: full-color-blue, full-color-azure, full-color-green, full-color-red, full-color-orange
            Available colors only for the toolbar: toolbar-color-blue, toolbar-color-azure, toolbar-color-green, toolbar-color-red, toolbar-color-orange
    -->

        <table id="fresh-table" class="table">
          <div class="table-title">
                <div class="row">
                    <div class="col-sm-8"><h6>Users Details</h6></div>
                    <form>
                    <div class="col-sm-4">
                        <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i><a href="registration.jsp">Add New</a></button>
                    </div>
                    </form>
                </div>
            </div>
            <thead>
                <th data-field="id">ID</th>
            	<th data-field="name">FullName</th>
            	<th data-field="salary">email</th>
            	<th data-field="country">Department name</th>
            	<th data-field="city">Connexion Time</th>
            	<th data-field="actions">Actions</th>
            </thead>
            <tbody>
                <%
                                        UserBean currentUser =new UserBean() ; 
                                        Connection currentCon = null;
                                        String sql =  "select * from users "; 
                         
                                    	currentCon = ConnectionManager.getConnection();
                                        Statement statement = currentCon.createStatement();
                                  		ResultSet rs = statement.executeQuery(sql);
                                        while (rs.next()){
                                        %>
                                        <tr>
                                         <td><%=rs.getString("id") %></td>
                                         <td><%=rs.getString("username")%></td>
                                         <td><%=rs.getString("email") %></td>
                                         <td><%=rs.getString("dept") %></td>
                                         <td><%=((currentUser.getLogoutDate())-(currentUser.getCurrentDate()))/1000F %> secondes </td>
                                         <td><a rel="tooltip" title="Edit" class="table-action edit" href="edit.jsp?u=<%=rs.getString("id")%>" title="Edit"><i class="fa fa-edit"></i></a></td>
                    <td><a rel="tooltip" title="Remove" class="table-action remove" href="delete.jsp?id=<%=rs.getString("id")%>" title="Remove"><i class="fa fa-remove"></i></a></td>
                                         </tr>
                                        <%
                                        }
                                        %>
            </tbody>
        </table>
    </div>
    </div>
</body>
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap-table.js"></script>

<script type="text/javascript">
        var $table = $('#fresh-table'),
            $alertBtn = $('#alertBtn'),
            full_screen = false;

        $().ready(function(){
            $table.bootstrapTable({
                toolbar: ".toolbar",

                showRefresh: true,
                search: true,
                showToggle: true,
                showColumns: true,
                pagination: true,
                striped: true,
                sortable: true,
                pageSize: 8,
                pageList: [8,10,25,50,100],

                formatShowingRows: function(pageFrom, pageTo, totalRows){
                    //do nothing here, we don't want to show the text "showing x of y from..."
                },
                formatRecordsPerPage: function(pageNumber){
                    return pageNumber + " rows visible";
                },
                icons: {
                    refresh: 'fa fa-refresh',
                    toggle: 'fa fa-th-list',
                    columns: 'fa fa-columns',
                    detailOpen: 'fa fa-plus-circle',
                    detailClose: 'fa fa-minus-circle'
                }
            });
        });

        $(function () {
            $alertBtn.click(function () {
                alert("You pressed on Alert");
            });
        });


        /* function operateFormatter(value, row, index) {
           var id=row.id ;
         
        	return [
                '<a rel="tooltip" title="Edit" class="table-action edit" href="edit.jsp?id='id'" title="Edit">',
                    '<i class="fa fa-edit"></i>',
                '</a>',
                '<a rel="tooltip" title="Remove" class="table-action remove" href="javascript:void(0)" title="Remove">',
                    '<i class="fa fa-remove"></i>',
                '</a>'
            ].join('');
        }

        window.operateEvents = {
 
  
            'click .edit': function (e, value, row, index) {
                console.log(value, row, index);
                console.log(row.id);
                console.log(value);
            },
            'click .remove': function (e, value, row, index) {
                alert('You click remove icon, row: ' + JSON.stringify(row));
                console.log(value, row, index);
            }
        }; */

    </script>
</html>