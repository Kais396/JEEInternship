<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Login Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/signin.css" rel="stylesheet">
</head>





<body class="text-center">
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">Sign In</h5>
						<form class="form-signin" action="Login">

							<label class="sr-only">Username</label> <input type="text"
								name="name" class="form-control" placeholder="Username" required
								autofocus> <label class="sr-only">Password</label> <input
								type="password" name="password" class="form-control"
								placeholder="Password" required>
									<div class="checkbox mb-3">
										<label> <input type="checkbox" value="remember-me">
												Remember me </label>
									</div>
									<button class="btn btn-lg btn-primary btn-block" name="login"
										type="submit">Sign in</button> <label> </label>
									<p class="small text-center text-gray-soft">
										Don't have an account yet? <a href="registration.jsp">Sign
											up</a>
									</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>






<!-- <body>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Sign In</h5>
            <form class="form-signin" action ="Login" method ="post ">
              <div class="form-label-group">
                <input type="text" id="inputtext" name="name" class="form-control" placeholder="Email address" required autofocus>
                
              </div>

              <div class="form-label-group">
                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
                <label for="inputPassword">Password</label>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember password</label>
              </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body> -->