<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Users Mangment</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>


	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">

					<header class="card-header"> <!-- 	<a href="login.jsp" class="float-right btn btn-outline-primary mt-1">Log in</a> -->
					<h4 class="card-title mt-2">Add New User</h4>
					</header>

					<article class="card-body">
					<form name="form" action="Registration" method="post">
						<div class="form-row">

							<div class="col form-group">
								<label>User First name</label> <input type="text"
									class="form-control" name="firstname" placeholder="First Name">
							</div>
							<!-- form-group end.// -->

							<div class="col form-group">
								<label>User Last name</label> <input type="text"
									class="form-control" name="lastname" placeholder="Last Name">
							</div>
							<!-- form-group end.// -->
						</div>
						<!-- form-row end.// -->
						<div class="form-group">
							<label>Username</label> <input type="text" class="form-control"
								name="name" placeholder="User Name">
						</div>
						<!-- form-group end.// -->
						<!-- form-row end.// -->

						<div class="form-group">
							<label>User Email address</label> <input type="email"
								class="form-control" name="email" aria-describedby="emailHelp"
								placeholder="Enter email"> <small
								class="form-text text-muted">We'll never share your
									email with anyone else.</small>
						</div>
						<!-- form-group end.// -->

						<div class="form-group">
							<label>User password</label> <input class="form-control"
								name="password" type="password" placeholder="password">
						</div>
						<!-- form-group end.// -->

						<div class="form-group">
							<div class="form-group">
								<label>User Confirm password</label> <input class="form-control"
									name="conf-password" type="password"
									placeholder="Confirm password">
							</div>
							<!-- form-group end.// -->

							<div class="form-group">
								<button type="submit" name="register" value="register"
									class="btn btn-primary btn-block">Submit</button>
							</div>
							<!-- form-group// -->

							<small class="text-muted">By clicking the 'Sign Up'
								button, you confirm that you accept our <br> Terms of use
									and Privacy Policy.
							</small>
					</form>
					</article>
					<!-- card-body end .// -->

					<div class="border-top card-body text-center">
						Have an account? <a href="login.jsp">Log In</a>
					</div>
				</div>
				<!-- card.// -->
			</div>
		</div>
	</div>


</body>
</html>