package jdbc;

import java.text.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

public class UserDAO 	
{
   static Connection currentCon = null;
   static ResultSet rs = null;   
	static int id = 0 ; 
	
   public static UserBean login(UserBean bean) {
	
      //preparing some objects for connection 
      Statement stmt = null;    
	
      String username = bean.getUsername();    
      String password = bean.getPassword();   
	  long da = System.currentTimeMillis();   
      String searchQuery =
            "select * from users where username='"
                     + username
                     + "' AND password='"
                     + password
                     + "'";
	    
   // "System.out.println" prints in the console; Normally used to trace the process
   System.out.println("Your user name is " + username);          
   System.out.println("Your password is " + password);
   
   System.out.println("Query: "+searchQuery);
	    
   try 
   {
      //connect to DB 
      currentCon = ConnectionManager.getConnection();
      stmt=currentCon.createStatement();
      rs = stmt.executeQuery(searchQuery);	        
      boolean more = rs.next();
	       
      // if user does not exist set the isValid variable to false
      if (!more) 
      {
         System.out.println("Sorry, you are not a registered user! Please sign up first");
         bean.setValid(false);
      } 
	        
      //if user exists set the isValid variable to true
      else if (more) 
      {
    	  String firstName = rs.getString("firstname");
    	  id = rs.getInt("id");
          String lastName = rs.getString("lastname");
          String name =rs.getString("username") ;
          String email =rs.getString("email");
          String company=rs.getString("company") ; 
          String address =rs.getString("address"); 
          String city =rs.getString("city");
          String country = rs.getString("country")  ;
          String dept =rs.getString("dept") ;
          int postal_code = rs.getInt("postal_code") ;
 	     	
          System.out.println("Welcome " + firstName);
          System.out.println("Your id " + id );
          bean.setFirstName(firstName);
          bean.setLastName(lastName);
          bean.setUserName(name);
          bean.setEmail(email);
          bean.setCompany(company);
          bean.setAddress(address);
          bean.setCity(city);
          bean.setCountry(country);
          bean.setPostal_code(postal_code);
          bean.setDept(dept);
          bean.setId(id);
         bean.setValid(true);
      }
   } 

   catch (Exception ex) 
   {
      System.out.println("Log In failed: An Exception has occurred! " + ex);
   } 
	    
   //some exception handling
   finally 
   {
      if (rs != null)	{
         try {
            rs.close();
         } catch (Exception e) {}
            rs = null;
         }
	
      if (stmt != null) {
         try {
            stmt.close();
         } catch (Exception e) {}
            stmt = null;
         }
	
      if (currentCon != null) {
         try {
            currentCon.close();
         } catch (Exception e) {
         }

         currentCon = null;
      }
   }

return bean;
	
   }
  
   public boolean edit(UserBean userbean) {
	 String sql=  "UPDATE `users` SET `firstname` = ?, `lastname` = ?, `username` = ?, `email` =?, `dept` = ?, `city` = ?, `country` = ? WHERE `users`.`id` = ?";
	 PreparedStatement ps = null ;
	 String f = userbean.getFirstName();
		String l = userbean.getLastName();
		String us=userbean.getUsername();
		String em=userbean.getEmail();
		String dept = userbean.getDept();
		String city = userbean.getCity();
		String coun = userbean.getCountry();	
		currentCon = ConnectionManager.getConnection();
     try {
		ps=currentCon.prepareStatement(sql);
		   ps.setString(1, f);
		   ps.setString(2,l);
		   ps.setString(3, us);
		   ps.setString(4, em);
		   ps.setString(5, dept);
		   ps.setString(6, city);
		   ps.setString(7, coun);
		   
		   ps.setInt(8, id);
		  int i=  ps.executeUpdate() ;

		  if (i!=0) {
			  return true ; 
		  }
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
		 
 return false ;
   }
 public void logout(HttpServletRequest request, HttpServletResponse response) {
	 HttpSession session = request.getSession(false);
	 if(session != null)
	     session.invalidate();
	 try {
		request.getRequestDispatcher("login.jsp").forward(request,response);
	} catch (ServletException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
 }
 
   
   
}
