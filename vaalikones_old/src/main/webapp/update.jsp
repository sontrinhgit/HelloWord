<%@page import="persist.Kysymykset"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="persist.Vastaukset"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
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
		int id = Integer.parseInt(request.getParameter("questionId"));
		session.setAttribute("questionId", id);
		Integer candidateId = (Integer) session.getAttribute("candidateId");

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

		Query qE = em.createQuery("SELECT e.ehdokasId FROM Ehdokkaat e");
		List<Integer> ehdokasList = qE.getResultList();

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
		// retrieve the answer list for specific candidate
		Query qA = em.createQuery("SELECT v FROM Vastaukset v WHERE v.vastauksetPK.ehdokasId=" + candidateId);
		List<Vastaukset> answer = qA.getResultList();
	%>

	<div id="container">
		<img id="headerimg" src="Logo.png" width="500" height="144" alt="" />

		<div class="kysymys">
			Question
			<%=id%>:
			<%=question.get(id - 1)%>
			<br>

		</div>
		<form action="updateFinish.jsp" id="vastausformi">
			<label>Your answer: </label><input type="text" name="answer" style="width: 10%;" class="text-center"
				placeholder="<%=answer.get(id - 1).getVastaus()%>"
				readonly="readonly" />
			<label>New answer: </label>
					 <label>1</label><input type="radio" name="newAns" value="1" />
                    <label>2</label><input type="radio" name="newAns" value="2" />
                    <label>3</label><input type="radio" name="newAns" value="3" checked="checked" />
                    <label>4</label><input type="radio" name="newAns" value="4" />
                    <label>5</label><input type="radio" name="newAns" value="5" />
				
			<br><br>
			 <input type="submit" id="submitnappi" value="Update" />
		</form>
		<div class="kysymys">
			<small>1=Täysin eri mieltä 2=Osittain eri mieltä 3=En osaa
				sanoa, 4=Osittain samaa mieltä 5=Täysin samaa mieltä</small>
		</div>
	</div>





</body>
</html>