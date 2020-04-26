<%@page import="vaalikone.Vaalikone"%>
<%@page import="persist.Kysymykset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
		Vaalikone vaa = new Vaalikone();
		int numOfQuestion = vaa.getNumOfQuestion();
		int numOfCandidate = vaa.getNumOfCandidate();

		String q = request.getParameter("question");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaalikone", "root",
					"quan12952151");
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select KYSYMYS_ID from kysymykset");

			Statement st1 = conn.createStatement();
			ResultSet rs1 = st1.executeQuery("select EHDOKAS_ID from ehdokkaat");

			int id = 0;
			if (rs.last()) {
				id = rs.getInt("kysymys_id") + 1;
			}

			for (int j = 1; j <= numOfCandidate; j++) {
				int p = st1.executeUpdate(
						"insert into vastaukset(ehdokas_id,kysymys_id) values ('" + j + "','" + id + "')");
			}

			int i = st
					.executeUpdate("insert into kysymykset(KYSYMYS_ID,KYSYMYS) values ('" + id + "','" + q + "')");

		} catch (Exception e) {
			System.out.print(e);
			e.printStackTrace();
		}
	%>

	<h1>Adding question successfully!</h1>
	<a href="edit.jsp" class="btn btn-warning">Come back</a>

</body>
</html>