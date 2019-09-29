package jdbc;


import java.sql.* ;
import java.util.*; 
public class RegisterDAO {
	Connection con = null;
	PreparedStatement ps = null;
	
	 public String registerUser(UserBean userbean)
	 {
	 String fullName = userbean.getFirstName();
	 String lastname = userbean.getLastName();
	 String userName = userbean.getUsername();
	 String email = userbean.getEmail();
	 String password = userbean.getPassword();
	 
	
	 
	 try
	 {
	 con = ConnectionManager.getConnection();
	 String query = "INSERT INTO users (`id`, `firstname`, `lastname`, `username`, `email`, `company`, `dept`, `address`, `city`, `country`, `postal_code`, `password`) VALUES (NULL,?,?,?,?,'','','','','',0,?)";
	 System.out.println(fullName);
	 System.out.println(email);
	 ps = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
	 ps.setString(1, fullName);
	 ps.setString(2, lastname);
	 ps.setString(3, userName);
	 ps.setString(4, email);
	 ps.setString(5, password);
	
	 
	 int i= ps.executeUpdate();
	 
	 if (i!=0)  //Just to ensure data has been inserted into the database
	 return "SUCCESS"; 
	 }
	 catch(SQLException e)
	 {
	 e.printStackTrace();
	 }
	 
	 return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
	 }
	}

