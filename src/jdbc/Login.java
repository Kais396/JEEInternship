package jdbc;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.ZonedDateTime;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.UserBean;
import jdbc.UserDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
	           throws ServletException, java.io.IOException {

try
{	    

UserBean user = new UserBean();
user.setUserName(request.getParameter("name"));
user.setPassword(request.getParameter("password"));

user = UserDAO.login(user);

	    
if (user.isValid())
{
 if (user.getUsername().equals("admin" )&& user.getPassword().equals("admin")) {
HttpSession session = request.getSession(true);	
Date date = new Date (session.getCreationTime()) ; 
long da = System.currentTimeMillis() ;
if(Logout.test) {
user.setCurrentDate(da);
}
session.setAttribute("currentSessionUser",user); 
session.setAttribute("date", date);
response.sendRedirect("adminprofile.jsp"); //logged-in page      		
}
 else {
	 HttpSession session = request.getSession(true);
	 Date date = new Date (session.getCreationTime()) ; 
	 session.setAttribute("date", date); 
	 long tempsDebut = System.currentTimeMillis();
	 user.setCurrentDate(tempsDebut);
	 session.setAttribute("currentSessionUser",user); 
	 response.sendRedirect("userLogged.jsp");
	 
 }
}
else 
response.sendRedirect("invalidLogin.jsp"); //error page 
} 


catch (Throwable theException) 	    
{
System.out.println(theException); 
}
}
}

/*
 * protected void doPost(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { String dbname = new
 * String("") ; String dbpassword = new String("") ; PrintWriter out =
 * response.getWriter(); try {
 * 
 * String name = request.getParameter("name") ; String password =
 * request.getParameter("password");
 * 
 * 
 * String sql ="select * from users " ; Class.forName("com.mysql.jdbc.Driver");
 * Connection con=
 * DriverManager.getConnection("jdbc:mysql://localhost:3306/portal" ,
 * "root",""); Statement s = con.createStatement();
 * 
 * ps.setString(1, name); ps.setString(2, password);
 * 
 * ResultSet rs = s.executeQuery(sql);
 * 
 * while(rs.next()) { dbname=rs.getString(2); dbpassword=rs.getString(3); }
 * rs.close(); s.close();
 * 
 * } catch (ClassNotFoundException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } catch (SQLException e) { // TODO Auto-generated catch
 * block e.printStackTrace(); } if (dbname.equals(request.getParameter("name"))
 * && dbpassword.equals(request.getParameter("password"))) {
 * request.setAttribute("name", dbname); out.println("Succesfuly loged in ");
 * 
 * } else { out.println("Retry !!!!! "); } }
 * 
 * protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws
 * ServletException, IOException { RequestDispatcher rd =
 * req.getRequestDispatcher("/login.jsp"); rd.forward(req, resp); }
 * 
 * 
 * }
 */