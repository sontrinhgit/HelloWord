 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vaalikone;

import java.io.IOException;
import static java.lang.Integer.parseInt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.utils.SystemProperty;

import persist.Ehdokkaat;
import persist.Kysymykset;
import persist.Vastaukset;

/**
 * Vaalikone-servlet, vastaa vaalikoneen varsinaisesta toiminnallisuudesta
 *
 * @author Jonne
 */
public class Vaalikone extends HttpServlet {

	
    //hae java logger-instanssi
    private final static Logger logger = Logger.getLogger(Loki.class.getName());

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int kysymys_id;

        // hae http-sessio ja luo uusi jos vanhaa ei ole vielä olemassa
        HttpSession session = request.getSession(true);

        //hae käyttäjä-olio http-sessiosta
        Kayttaja usr = (Kayttaja) session.getAttribute("usrobj");

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
        
        //hae url-parametri func joka määrittää toiminnon mitä halutaan tehdä. //get the url parameter func which specifies the function you want to do 
        //func=haeEhdokas: hae tietyn ehdokkaan tiedot ja vertaile niitä käyttäjän vastauksiin //func=searchCandidate: retrieve information for a specific candidate and compare it to the user's answer 
        //Jos ei määritelty, esitetään kysymyksiä. //if not specified, questions will be asked 
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
            }
            //voters vao se tao mot session moi qua tung page va no se tang len khi voters tra loi cau hoi 
            //jos kysymyksiä on vielä jäljellä, hae seuraava //if there are still questions left, get the next one 
            
            //cho phan di toi vastaus.jsp 
            if (kysymys_id < 20) { //neu ma id cua cau hoi nho hon 20 =>> di toi vong cau hoi truoc 
                try {
                    //Hae haluttu kysymys tietokannasta //search the database for the desired questions 
                    Query q = em.createQuery(
                            "SELECT k FROM Kysymykset k WHERE k.kysymysId=?1");
                    q.setParameter(1, kysymys_id);
                    //Lue haluttu kysymys listaan //read the desired question in the list 
                    List<Kysymykset> kysymysList = q.getResultList();
                    
                    request.setAttribute("kysymykset", kysymysList);
                    request.getRequestDispatcher("/vastaus.jsp")
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

                //Tyhjennetään piste-array jotta pisteet eivät tuplaannu mahdollisen refreshin tapahtuessa //Clear the dot array so that the score is not doubled in the event of a possible refreshing
                for (int i = 0; i < 20; i++) {
                    usr.pisteet.set(i, new Tuple<>(0, 0));
                }

                //Hae lista ehdokkaista //get a list of candidate 
                Query qE = em.createQuery(
                        "SELECT e.ehdokasId FROM Ehdokkaat e"
                );
                List<Integer> ehdokasList = qE.getResultList();

                //iteroi ehdokaslista läpi //iterate through the candidate list 
                for (int i = 1; i < 20; i++) {

                    //Hae lista ehdokkaiden vastauksista //get a list of candidates response 
                    Query qV = em.createQuery(
                            "SELECT v FROM Vastaukset v WHERE v.vastauksetPK.ehdokasId=?1");
                    qV.setParameter(1, i);
                    List<Vastaukset> vastausList = qV.getResultList();

                    //iteroi vastauslista läpi //iterate through the answer list 
                    for (Vastaukset eVastaus : vastausList) {
                        int pisteet;

                        //hae käyttäjän ehdokaskohtaiset pisteet //Search for user candidate scores 
                        pisteet = usr.getPisteet(i);

                        //laske oman ja ehdokkaan vastauksen perusteella pisteet  //calculate the score based on your own and the candidate answer 
                        pisteet += laskePisteet(usr.getVastaus(i), eVastaus.getVastaus());

                        logger.log(Level.INFO, "eID: {0} / k: {1} / kV: {2} / eV: {3} / p: {4}", new Object[]{i, eVastaus.getVastauksetPK().getKysymysId(), usr.getVastaus(i), eVastaus.getVastaus(), pisteet});
                        usr.addPisteet(i, pisteet);
                    }

                }

                //siirrytään hakemaan paras ehdokas //let's move on to finding the best candidate 
                strFunc = "haeEhdokas";
            }

        }

        //jos func-arvo on haeEhdokas, haetaan haluttu henkilö käyttäjälle sopivimmista ehdokkaista //if the func value is searched Candidate, search for the desired person from the most suitable candidates for the users
        
        //cho phan di toi tulokset.jsp 
        if ("haeEhdokas".equals(strFunc)) {
            //luetaan url-parametristä "top-listan järjestysnumero". Jos ei määritelty, haetaan PARAS vaihtoehto.
            String strJarjestysnumero = request.getParameter("numero"); //Jasjestysnumero = order numbers 
            Integer jarjestysnumero = 0;
            if (strJarjestysnumero != null) {
                jarjestysnumero = Integer.parseInt(strJarjestysnumero);
            }

            //Lue käyttäjälle sopivimmat ehdokkaat väliaikaiseen Tuple-listaan. //read the most suitable candidates for the user into the interim Tuple list 
            List<Tuple<Integer, Integer>> tpl = usr.haeParhaatEhdokkaat();
            //session moi thi lien quan den user 

            //hae määritetyn ehdokkaan tiedot //get the information of the specified candidate 
            Query q = em.createQuery(
                    "SELECT e FROM Ehdokkaat e WHERE e.ehdokasId=?1");
            q.setParameter(1, tpl.get(jarjestysnumero).ehdokasId); //show in client side 
            List<Ehdokkaat> parasEhdokas = q.getResultList(); //parasEhdokas = best candidate 

            //hae ko. ehdokkaan vastaukset //The candidate's answer 
            q = em.createQuery(
                    "SELECT v FROM Vastaukset v WHERE v.vastauksetPK.ehdokasId=?1");
            q.setParameter(1, tpl.get(jarjestysnumero).ehdokasId);
            List<Vastaukset> parhaanEhdokkaanVastaukset = q.getResultList();

            //hae kaikki kysymykset //get all the question 
            q = em.createQuery(
                    "SELECT k FROM Kysymykset k");
            List<Kysymykset> kaikkiKysymykset = q.getResultList();
            
            //ohjaa tiedot tulosten esityssivulle //redirect the data to the results presentation page 
            request.setAttribute("kaikkiKysymykset", kaikkiKysymykset); //all the questions 	
            request.setAttribute("kayttajanVastaukset", usr.getVastausLista()); // user replies , get AnswerList 
            request.setAttribute("parhaanEhdokkaanVastaukset", parhaanEhdokkaanVastaukset); //the best candidate answer 
            request.setAttribute("parasEhdokas", parasEhdokas); //the best candidate
            request.setAttribute("pisteet", tpl.get(jarjestysnumero).pisteet); //score 
            request.setAttribute("jarjestysnumero", jarjestysnumero); //order numbers 
            request.getRequestDispatcher("/tulokset.jsp")
            .forward(request,response);//go to tulokset
          

            // Sulje tietokantayhteys //close the database connection 
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            em.close();

        }

    }

    private Integer laskePisteet(Integer kVastaus, Integer eVastaus) { //calculate the score 
        int pisteet = 0;
        if (kVastaus - eVastaus == 0) {
            pisteet = 3;
        }
        if (kVastaus - eVastaus == 1 || kVastaus - eVastaus == -1) {
            pisteet = 2;
        }
        if (kVastaus - eVastaus == 2 || kVastaus - eVastaus == -2 || kVastaus - eVastaus == 3 || kVastaus - eVastaus == -3) {
            pisteet = 1;
        }
        
        //if (kVastaus - eVastaus == 4 || kVastaus - eVastaus == -4) pisteet = 0;
        return pisteet;

    }

    //<editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
