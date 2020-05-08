package client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CandidateDao;
import persist.Ehdokkaat;

/**
 * Servlet implementation class CandidateServlet
 */
@WebServlet("/candidateservlet")
public class CandidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CandidateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");

		List<Ehdokkaat> candidateList = CandidateDao.getAllCandidates();
		for (int i = 1; i <= candidateList.size(); i++) {
			Ehdokkaat candidate = CandidateDao.getOneCandidate(i);
			
			if(candidate.getEtunimi().equals(fname) && candidate.getSukunimi().equals(lname)) {
				session.setAttribute("candidateId", candidate.getEhdokasId());
				
				RequestDispatcher rqd = request.getRequestDispatcher("candidateTable.jsp");
				rqd.include(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
