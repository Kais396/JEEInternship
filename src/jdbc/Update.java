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
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String f = request.getParameter("firstName");
		String l = request.getParameter("lastName");
		String us=request.getParameter("Username");
		String em=request.getParameter("Email") ;
		String dept = request.getParameter("Dept");
		String city = request.getParameter("City");
		String coun = request.getParameter("Country");
		
		
		UserBean userbean = new UserBean();
		
		userbean.setFirstName(f);
		userbean.setLastName(l);
		userbean.setUserName(us);
		userbean.setEmail(em) ;
		userbean.setDept(dept);
		userbean.setCity(city);
		userbean.setCountry(coun);
		
		UserDAO user = new UserDAO();
		boolean test = user.edit(userbean);
		if (test) {
			System.out.println("Update Done ! ");
			 HttpSession session = request.getSession(true);	    
	          session.setAttribute("currentSessionUser",userbean); 
		  response.sendRedirect("admintable.jsp");
		}
		else {
			PrintWriter out =response.getWriter();
			out.println("Update failed");
			}
	}

}
