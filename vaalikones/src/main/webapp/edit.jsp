<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
		String uname = request.getParameter("username");
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "vaalikone";
		String userId = "root";
		String password = "0408153804";

		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
	%>

	<div id="container">
		<div class="row">
			<div class="col-lg-10">
				<h1>All the questions</h1>
			</div>
			<div class="col-lg-2">
				<a href="welcome.jsp" class="btn btn-warning btn-lg"><b>Back</b></a>
			</div>
		</div>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th><b>Kysymys_id</b></th>
					<th><b>Kysymys</b></th>
					<th><b>Action</b></th>
					<th><b>Action</b>
					<th>
				</tr>
			</thead>
			<tbody>
				<%
					try {
						connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
						statement = connection.createStatement();
						String sql = "SELECT kysymys_id,kysymys FROM kysymykset";

						resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
				%>
				<tr>
					<td><%=resultSet.getString("kysymys_id")%></td>
					<td><%=resultSet.getString("kysymys")%></td>
					<td><a
						href="edit-process.jsp?kysymys_id=<%=resultSet.getString("kysymys_id")%>"
						class="btn btn-warning">Edit</a></td>
					<td><a
						href="delete-process.jsp?kysymys_id=<%=resultSet.getString("kysymys_id")%>" class="btn btn-warning">Delete</a></td>
				</tr>

				<%
					}

					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</tbody>
		</table>
		
		 <a href="addQuestion.html" class="btn btn-warning btn-lg">Add more question</a>

	</div>
</body>
</html>