package jdbc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       public static boolean test=false ; 
    /**
     * @see HttpServlet#HttpServlet()
     */
       UserBean us=new UserBean();
    public Logout() {
        super();
        // TODO Auto-generated constructor stub
    }
		  protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                  throws ServletException, IOException {  
response.setContentType("text/html");  
PrintWriter out=response.getWriter();  

request.getRequestDispatcher("login.jsp").include(request, response);  

HttpSession session=request.getSession();  
session.invalidate();  
test=true ; 
long lout=System.currentTimeMillis();
us.setLogoutDate(lout);

out.close();  
}
}