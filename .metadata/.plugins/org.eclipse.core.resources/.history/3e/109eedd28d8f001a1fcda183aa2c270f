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

import persist.Kysymykset;

/**
 * Servlet implementation class QuestionClient
 */
@WebServlet("/questionservlet")
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuestionServlet() {
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

		//add question
		String newQuestion = request.getParameter("question");
		Kysymykset newQuestionObject = new Kysymykset(newQuestion);

		String addURL = "http://localhost:8080/rest/questionservice/addquestion";
		Client c = ClientBuilder.newClient();
		WebTarget wt = c.target(addURL);
		Builder b = wt.request();

		Entity<Kysymykset> e = Entity.entity(newQuestionObject, MediaType.APPLICATION_JSON);
		try {
			b.post(e);
			out.print("<script>alert('Question is added successfully!')</script>");
			out.print("<script>location.replace('edit.jsp')</script>");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		//update question
//		int questionId = Integer.parseInt(request.getParameter("id"));
//		String updatedQuestion = request.getParameter("kysymys");
//		String updateURL = "http://localhost:8080/rest/questionservice/updatequestion/" + questionId + "/" + updatedQuestion;	
//		wt = c.target(updateURL);
//		b = wt.request();

	}

}
