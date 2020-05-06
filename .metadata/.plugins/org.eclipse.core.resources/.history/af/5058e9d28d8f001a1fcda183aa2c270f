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
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.client.Invocation.Builder;

import persist.Ehdokkaat;
/**
 * Servlet implementation class CandidateClient
 */
@WebServlet("/CandidateClient")
public class CandidateClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CandidateClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		   String uri = "http://127.0.0.1:8080/rest/electionservice/addcandidate";
		   
		   response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			//get the form from add.jsp
		   String newSuku = request.getParameter("suku");
		   String newEtu = request.getParameter("etu");
		   Integer newIka = Integer.parseInt(request.getParameter("ika"));
		   String newKoti = request.getParameter("koti");
		   String newMiksi = request.getParameter("miksi");
		   String newMita = request.getParameter("mita");
		   String newAma = request.getParameter("ama");
		   String newPuo = request.getParameter("puo");
		   
		   //Add more candidate part 
		   Ehdokkaat newCandidateObject = new Ehdokkaat (newSuku,newEtu,newPuo,newKoti,newIka,newMiksi,newMita,newAma);
		   Client c = ClientBuilder.newClient();
		   WebTarget wt = c.target(uri);
		   Builder b = wt.request();
		   
		   Entity<Ehdokkaat> e = Entity.entity(newCandidateObject, MediaType.APPLICATION_JSON);
		   try {
			   b.post(e);
			   out.print("<script>alert('Candidate is added successfully')</script>");
			   out.print("<script>location.replace('rtest.jsp')</script>");
			   
			   
		   }catch(Exception ex) {
			   ex.printStackTrace();
		   }
		   
		   
	}

}
