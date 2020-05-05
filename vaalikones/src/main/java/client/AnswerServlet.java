package client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation.Builder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import persist.Vastaukset;

/**
 * Servlet implementation class AnswerServlet
 */
@WebServlet("/answerservlet")
public class AnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AnswerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		int newAnswer = Integer.parseInt(request.getParameter("newAns"));
		int candidateId = Integer.parseInt(request.getParameter("candidateId"));
		int questionId = Integer.parseInt(request.getParameter("questionId"));

		Vastaukset answerObject = new Vastaukset(candidateId, questionId);
		answerObject.setVastaus(newAnswer);
		updateAnswer(answerObject);

		out.print("<script>alert('Answer is updated successfully!')</script>");
		out.print("<script>location.replace('candidateTable.jsp')</script>");
	}

	//method for updating answer
	private void updateAnswer(Vastaukset newAnswer) {
		String url = "http://localhost:8080/rest/answerservice/updateanswer/";

		Client c = ClientBuilder.newClient();
		WebTarget wt = c.target(url);
		Builder b = wt.request();

		Entity<Vastaukset> e = Entity.entity(newAnswer, MediaType.APPLICATION_JSON);
		b.post(e);
	}

}
