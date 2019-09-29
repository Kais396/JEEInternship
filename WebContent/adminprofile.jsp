<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="jdbc.UserBean"

   %>
 
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">

   <html>

 <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Users Mangment</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="css/demo.css" rel="stylesheet" />
</head>

<body>
<% UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser")) ; %>
    <div class="wrapper">
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
                    <li class="nav-item active">
                        <a class="nav-link" href="#">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>Admin Profile</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="admintable.jsp">
                            <i class="nc-icon nc-notes"></i>
                            <p>Users List</p>
                        </a>
                    </li>
                   
                   
                 
                   
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
           <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                   
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">

                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span class="no-icon">Account</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Logout">
                                    <span class="no-icon">Log out</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Edit Profile</h4>
                                </div>
                                <div class="card-body">
                                    <form action ="Update" method ="post" >
                                        <div class="row">
                                            <div class="col-md-5 pr-1">
                                                <div class="form-group" >
                                                    <label>Company (disabled)</label>
                                                    <input type="text" class="form-control" disabled="" placeholder="Company" value="<%= currentUser.getCompany() %>">
                                                </div>
                                            </div>
                                            <div class="col-md-3 px-1">
                                                <div class="form-group">
                                                    <label>Username</label>
                                                    <input type="text" class="form-control" placeholder="Username" name="Username" value="<%= currentUser.getUsername() %>">
                                                </div>
                                            </div>
                                            <div class="col-md-4 pl-1">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Email address</label>
                                                    <input type="email" class="form-control" name="Email" placeholder="Email" value="<%= currentUser.getEmail() %>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label>First Name</label>
                                                    <input type="text" class="form-control" name="firstName" placeholder="First Name" value="<%= currentUser.getFirstName() %>">
                                                </div>
                                            </div>
                                            <div class="col-md-6 pl-1">
                                                <div class="form-group">
                                                    <label>Last Name</label>
                                                    <input type="text" class="form-control" placeholder="Last Name" name="lastName" value="<%= currentUser.getLastName() %>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Departement Name</label>
                                                    <input type="text" class="form-control" name="Dept" placeholder="Home Address" value="<%= currentUser.getDept() %>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 pr-1">
                                                <div class="form-group">
                                                    <label>City</label>
                                                    <input type="text" class="form-control" name="City"placeholder="City" value="<%= currentUser.getCity() %>">
                                                </div>
                                            </div>
                                            <div class="col-md-4 px-1">
                                                <div class="form-group">
                                                    <label>Country</label>
                                                    <input type="text" class="form-control" name="Country" placeholder="Country" value="<%= currentUser.getCountry() %>">
                                                </div>
                                            </div>
                                            <div class="col-md-4 pl-1">
                                                <div class="form-group">
                                                    <label>Postal Code</label>
                                                    <input type="number" class="form-control" placeholder="ZIP Code" value="<%= currentUser.getPostal_code() %>" >
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>
                                        <div class="clearfix"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-user">
                                <div class="card-image">
                                    <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400" alt="...">
                                </div>
                                <div class="card-body">
                                    <div class="author">
                                        <a href="#">
                                            <img class="avatar border-gray" src="img/faces/face-0.jpg" alt="...">
                                            <h5 class="title"><%= currentUser.getFirstName() + " " + currentUser.getLastName() %></h5>
                                        </a>
                                        <p class="description">
<%--                                             <%= currentUser.getUsername() %> --%>
Administrateur
                                        </p>
                                    </div>                                 
                                </div>
                                <hr>
                                <div class="button-container mr-auto ml-auto">
                                    <button href="#" class="btn btn-simple btn-link btn-icon">
                                        <i class="fa fa-facebook-square"></i>
                                    </button>
                                    <button href="#" class="btn btn-simple btn-link btn-icon">
                                        <i class="fa fa-twitter"></i>
                                    </button>
                                    <button href="#" class="btn btn-simple btn-link btn-icon">
                                        <i class="fa fa-google-plus-square"></i>
                                    </button>
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
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="js/demo.js"></script>

</html>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
      <%-- <body>

         <center>
            <% UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser")) ; %>
			
            Welcome <%= currentUser.getFirstName() + " " + currentUser.getLastName() %> 
         </center>

      </body> --%>
	
   </html>