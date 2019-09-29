package jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserBean userbean =new UserBean();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name") ; 
		String email =request.getParameter("email");
		String password =request.getParameter("password");
		String firstname = request.getParameter("firstname");
		String lastname= request.getParameter("lastname");
		PrintWriter out = response.getWriter();
		
		
		userbean.setFirstName(firstname);
		userbean.setLastName(lastname);
		userbean.setUserName(name);
		userbean.setEmail(email);
		userbean.setPassword(password);
		
		RegisterDAO registerDao = new RegisterDAO(); 
		String userRegistered = registerDao.registerUser(userbean);
		 
		 if(userRegistered.equals("SUCCESS")&&(validate()))   //On success, you can display a message to user on Home page
		 {
			
			/* out.println("Succesufly registred ") ; */
			    HttpSession session = request.getSession(true);	    
		          session.setAttribute("currentSessionUser",userbean); 
			  response.sendRedirect("admintable.jsp"); 
		 }
		 else   //On Failure, display a meaningful message to the User.
		 {
			 out.println("failed registration ") ;
		 }
		 }
		
		
		
		public boolean validate() {
			
			String stname=userbean.getFirstName();
			String lname=userbean.getLastName();
			String uname=userbean.getUsername();
			String pwd = userbean.getPassword() ; 
			System.out.println(stname);
			if (stname==null || stname=="")
			  { 
			  System.out.println("firstname can't be blank ");
			  return false; 
			  }
			  else if (lname==null || lname=="")
			  { 
			 System.out.println("lastname can't be blank"); 
			  return false; 
			  }
			  else if (uname==null || uname=="")
			  { 
			  System.out.println("Username can't be blank"); 
			  return false; 
			  }
			  else if(pwd.length()<4)
			  { 
			  System.out.println("Password must be at least 4 characters long."); 
			  return false; 
			  } 
			 return true ; 
		}
		
}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*String name = request.getParameter("name") ; 
		String password = request.getParameter("password");
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		
		String sql = "insert into users (id,firstname,lastname,username,password) values (NULL,?,?,?,?)"; 
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/portal" , "root","");
			PreparedStatement ps = con.prepareStatement(sql); 
			ps.setString(1, firstname);
			ps.setString(2, lastname);
			ps.setString(3,name);
			ps.setString(4, password);
			ps.executeUpdate(); 
			PrintWriter out = response.getWriter();
			out.println("Succesufly registred ") ; 
			
		} catch (ClassNotFoundException | SQLException e ) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception ex) {
			// TODO Auto-generated catch block
			System.out.println("Registration failed: An Exception has occurred! " + ex);
		}
		
	}*/


