<%@page import="java.util.List"%>
<%@page import="persist.Vastaukset"%>
<%@page import="java.util.ArrayList"%>
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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<%
		Integer candidateId = (Integer) session.getAttribute("candidateId");

		String firstname = (String) request.getAttribute("fname");
		String lastname = (String) request.getAttribute("lname");
		String party = (String) request.getAttribute("party");
		Integer age = (Integer) request.getAttribute("age");
		String municipality = (String) request.getAttribute("municipality");

		ArrayList<Integer> questionID = (ArrayList<Integer>) request.getAttribute("questionID");
		ArrayList<String> question = (ArrayList<String>) request.getAttribute("question");
		List<Vastaukset> answer = (List<Vastaukset>) request.getAttribute("candidateAnswer");
	%>

	<div class="container">
		<div class="row">
			<div class="col-lg-7">
				<h1>Hello candidate!</h1>
			</div>
			<div class="col-lg-4">
				<a href="candidate.html" class="btn btn-warning">Log out</a>
			</div>
		</div>
		<h3>Your Information:</h3>
		<ul>
			<li><b>Name:</b> <%=firstname + " " + lastname%></li>
			<li><b>Party:</b> <%=party%></li>
			<li><b>Registered official municipality:</b> <%=municipality%></li>
			<li><b>Age:</b> <%=age%></li>
		</ul>
		<h3>Your Answers:</h3>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Questions_ID</th>
					<th scope="col">Question</th>
					<th scope="col">Your Answer</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < 19; i++) {
				%>
				<tr>
					<td><%=questionID.get(i)%></td>
					<td><%=question.get(i)%></td>
					<td><%=answer.get(i).getVastaus()%></td>
					<td><a href="update.jsp?questionId=<%=questionID.get(i)%>"
						class="btn btn-warning">Edit</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>