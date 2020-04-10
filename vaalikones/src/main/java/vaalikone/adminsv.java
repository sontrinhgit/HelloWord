package vaalikone;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import persist.Admin;
import persist.Kysymykset;

/**
 * Servlet implementation class adminsv
 */
@WebServlet("/adminsv")
public class adminsv extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// get the java logger instance
	private final static Logger logger = Logger.getLogger(Loki.class.getName());

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO Auto-generated method stub
		// retrieve the http session and create a new one if the old one does not yet
		// exist
		HttpSession session = request.getSession(true);

		// retrieve the user object from the http session
		User usr = (User) session.getAttribute("usrobj");

		// if the user object is not found in the session, creating one
		if (usr == null) {
			usr = new User();
			logger.log(Level.FINE, "New user object created");
			session.setAttribute("usrobj", usr);
		}
		EntityManagerFactory emf = null;
		EntityManager em = null;
		try {
			emf = Persistence.createEntityManagerFactory("vaalikones");
			em = emf.createEntityManager();
		} catch (Exception e) {
			response.getWriter().println("EMF+EM EI Onnistu");

			e.printStackTrace(response.getWriter());

			return;
		}

		String un = request.getParameter("username");
		String pw = request.getParameter("password");

		// Get a list of admin
		Query qA = em.createQuery("SELECT a.adminId FROM Admin a");
		List<Integer> adminList = qA.getResultList();
		
		for (int i = 1; i <= adminList.size(); i++) {
			Admin admin = em.find(Admin.class, i);
			
			if (admin.getUsername().contentEquals(un) && admin.getPassword().contentEquals(pw)) {
//				  Query q = em.createQuery(
//                          "SELECT k FROM Kysymykset k WHERE k.kysymysId=?1");
//                  q.setParameter(1, i);
//                  //Read the desired question in the list
//                  List<Kysymykset> kysymysList = q.getResultList();
//                  request.setAttribute("kysymykset", kysymysList);
//                  request.getRequestDispatcher("/candidateTable.jsp")		//for the questions
//                          .forward(request, response);
				
				
				
				RequestDispatcher rqd = request.getRequestDispatcher("admin.jsp");
				rqd.forward(request, response);
			}else {
				response.getWriter().print("wrong!");
			}
		}

	}

}
