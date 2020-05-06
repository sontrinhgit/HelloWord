package vaalikone;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String sql ="select * from account where username=? and password=?";
	String url ="jdbc:mysql://localhost:3306/vaalikone";
	String username="root";
	String password="quan12952151";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pass=request.getParameter("pass");
		
		loginDao dao = new loginDao();
		
		if(dao.check(uname, pass))
		{
			HttpSession session = request.getSession();
			session.setAttribute("username", uname);
			response.sendRedirect("welcome.jsp");
		}
		else {
			response.getWriter().print("<script>alert('Wrong Information!')</script>");
			response.getWriter().print("<script>location.replace('login.jsp')</script>");
		}
		
		
	}

}
