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
		String id = request.getParameter("kysymys_id");
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String database = "vaalikone";
		String userid = "root";
		String password = "quan12952151";
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
	%>
	<%
		try {
			connection = DriverManager.getConnection(connectionUrl + database, userid, password);
			statement = connection.createStatement();
			String sql = "select kysymys_id,kysymys from kysymykset where kysymys_id=" + id;
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
	%>

	<div class="container" id="container">
		<img id="headerimg" src="Logo.png" width="720" />
		<div class="kysymys">
			<h1>Update question</h1>
		</div>
		<br>
		
		<form action="edit-record.jsp">
			<input type="hidden" name="id"
				value="<%=resultSet.getString("kysymys_id")%>">
			<label for="inputUser">Question:</label>
			<input type="text" name="kysymys"
				value="<%=resultSet.getString("kysymys")%>" class="form-control"> <br>
			<input type="Submit" value="Update" class="btn btn-warning">
		</form>
	</div>
	<%
		}
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>