package vaalikone;

import static java.lang.Integer.parseInt;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import persist.Kysymykset;

/**
 * Servlet implementation class Quesprocess
 */
@WebServlet("/Quesprocess")
public class Quesprocess extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private final static Logger logger = Logger.getLogger(Loki.class.getName());

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Quesprocess() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int kysymys_id;
		
		HttpSession session = request.getSession(true);
		 Kayttaja usr = (Kayttaja) session.getAttribute("username");

	        //jos käyttäjä-oliota ei löydy sessiosta, luodaan sinne sellainen
	        if (usr == null) {
	            usr = new Kayttaja();
	            logger.log(Level.FINE, "Luotu uusi k�ytt�j�olio");//new user object is created 
	            session.setAttribute("usrobj", usr);
	        }
	        EntityManagerFactory emf=null;
	        EntityManager em = null;
	        try {
	  	      emf=Persistence.createEntityManagerFactory("vaalikones");
	  	      em = emf.createEntityManager();
	        }
	        catch(Exception e) {
	          	response.getWriter().println("EMF+EM EI Onnistu");
	          	
	          	e.printStackTrace(response.getWriter());
	          	
	          	return;
	        }
		String strFunc = request.getParameter("func");
		if (strFunc == null) {

            //hae parametrinä tuotu edellisen kysymyksen nro //get the number of previous question imported as a parameter 
            String strKysymys_id = request.getParameter("q");

            //hae parametrina tuotu edellisen kysymyksen vastaus //get the answer to the previous question imported by the parameter
            String strVastaus = request.getParameter("vastaus");

            // Jos kysymyksen numero (kysId) on asetettu, haetaan tuo kysymys
            // muuten haetaan kysnro 1
            if (strKysymys_id == null) {
                kysymys_id = 1;
            } else {
                kysymys_id = parseInt(strKysymys_id);
                //jos vastaus on asetettu, tallenna se session käyttäjä-olioon //if the answer is set, save it to the session user object
                if (strVastaus != null) {
                	
                    usr.addVastaus(kysymys_id, parseInt(strVastaus));
                }

                //määritä seuraavaksi haettava kysymys //specify the next question to research 
                kysymys_id++;
            }if (kysymys_id < 20) { //neu ma id cua cau hoi nho hon 20 =>> di toi vong cau hoi truoc 
                try {
                    //Hae haluttu kysymys tietokannasta //search the database for the desired questions 
                    Query q = em.createQuery(
                            "SELECT k FROM Kysymykset k WHERE k.kysymysId=?1");
                    q.setParameter(1, kysymys_id);
                    //Lue haluttu kysymys listaan //read the desired question in the list 
                    List<Kysymykset> kysymysList = q.getResultList();
                    
                    request.setAttribute("kysymykset", kysymysList);
                    request.getRequestDispatcher("/quess.jsp")
                            .forward(request, response);

                } finally {
                    // Sulje tietokantayhteys //Close the database connection 
                    if (em.getTransaction().isActive()) {
                        em.getTransaction().rollback();
                    }
                    em.close();
                }

                //jos kysymykset loppuvat, lasketaan tulos! // if the question runout, the result will be calculated 
                //chinh la trang show result
            } else {
            }
            }
		
		
		doGet(request, response);
	}

}
