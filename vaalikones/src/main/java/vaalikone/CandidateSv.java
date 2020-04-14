package vaalikone;

import java.io.IOException;
import java.util.ArrayList;
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
import persist.Ehdokkaat;
import persist.Kysymykset;
import persist.Vastaukset;

/**
 * Servlet implementation class adminsv
 */
@WebServlet("/CandidateSv")
public class CandidateSv extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// get the java logger instance
	private final static Logger logger = Logger.getLogger(Loki.class.getName());

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
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

		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		// Get a list of candidate
		Query qE = em.createQuery("SELECT e.ehdokasId FROM Ehdokkaat e");
		List<Integer> ehdokasList = qE.getResultList();

		for (int i = 1; i <= ehdokasList.size(); i++) {
			Ehdokkaat candidate = em.find(Ehdokkaat.class, i);

			if (candidate.getEtunimi().equals(fname) && candidate.getSukunimi().equals(lname)) {

				// set candidate information
				request.setAttribute("fname", candidate.getEtunimi());
				request.setAttribute("lname", candidate.getSukunimi());
				request.setAttribute("party", candidate.getPuolue());
				request.setAttribute("age", candidate.getIka());
				request.setAttribute("municipality", candidate.getKotipaikkakunta());
				
				session.setAttribute("candidateId", candidate.getEhdokasId());

				// retrieve questions list
				Query q = em.createQuery("SELECT k FROM Kysymykset k");
				List<Kysymykset> questionList = q.getResultList();
				ArrayList<Integer> questionID = new ArrayList<Integer>();
				ArrayList<String> question = new ArrayList<String>();

				for (int j = 1; j <= questionList.size(); j++) {
					Kysymykset kysymys = em.find(Kysymykset.class, j);
					questionID.add(kysymys.getKysymysId());
					question.add(kysymys.getKysymys());
				}

				request.setAttribute("questionID", questionID);
				request.setAttribute("question", question);

				// retrieve the answer list for specific candidate

				Query qA = em.createQuery(
						"SELECT v FROM Vastaukset v WHERE v.vastauksetPK.ehdokasId=" + candidate.getEhdokasId());
				List<Vastaukset> answer = qA.getResultList();

				request.setAttribute("candidateAnswer", answer);

				RequestDispatcher rqd = request.getRequestDispatcher("candidateTable.jsp");
				rqd.forward(request, response);

			}

		}

	}
}
