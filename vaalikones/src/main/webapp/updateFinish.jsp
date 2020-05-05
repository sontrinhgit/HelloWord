<%@page import="persist.Ehdokkaat"%>
<%@page import="persist.VastauksetPK"%>
<%@page import="persist.Vastaukset"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persist.Kysymykset"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Diginide vaalikone</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		//get the necessary variable
		String newAns = request.getParameter("newAns");
		Integer questionId = (Integer) session.getAttribute("questionId");
		Integer candidateId = (Integer) session.getAttribute("candidateId");

		EntityManagerFactory emf = null;
		EntityManager em = null;
		try {
			emf = Persistence.createEntityManagerFactory("vaalikones");
			em = emf.createEntityManager();

		} catch (Exception e) {
			response.getWriter().println("EMF+EM EI Onnistu");
			e.printStackTrace(response.getWriter());
			return;		}

		//update the answer
		try {
			em.getTransaction().begin();
			Vastaukset vastaus = em.find(Vastaukset.class, new VastauksetPK(candidateId, questionId));
			vastaus.setVastaus(Integer.parseInt(newAns));
			em.getTransaction().commit();
	%>
	<h3>Update Successfully!</h3>
	<p>
		Your new answer for question
		<%=questionId%>
		is
		<%=vastaus.getVastaus()%></p>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>	
	
	<%
	//back to the candidate information
		try {
			Query qE = em.createQuery("SELECT e.ehdokasId FROM Ehdokkaat e");
			List<Integer> ehdokasList = qE.getResultList();
			Ehdokkaat candidate = em.find(Ehdokkaat.class, candidateId);

			String ln = candidate.getSukunimi();
			String fn = candidate.getEtunimi();
	%>
	<a href="CandidateSv?firstname=<%=fn%>&lastname=<%=ln%>"
		class="btb btn-link"><b>Back to your information</b></a>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
			emf.close();
		}
	%>





</body>
</html>