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
			String id = request.getParameter("ehdokas_id");
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
				String sql = "select ehdokas_id,sukunimi,etunimi,puolue,kotipaikkakunta,ika,MIKSI_EDUSKUNTAAN,MITA_ASIOITA_HALUAT_EDISTAA,AMMATTI from ehdokkaat where ehdokas_id="
						+ id;
				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
	
		<div class="container" id="container">
			<img id="headerimg" src="Logo.png" width="720" />
			<div class="kysymys">
				<h1>Update data</h1>
			</div>
			<br>		
			
			<form method="post" action="updateCan-process.jsp">				
					<input type="hidden" name="id"
						value="<%=resultSet.getString("ehdokas_id")%>"><br>
				<div class="row">
					<div class="col">		
					<label for="inputUser">Sukunimi:</label><input type="text" name="sukunimi"
						value="<%=resultSet.getString("sukunimi")%>" class="form-control">
					</div>
					<div class="col">
					<label for="inputUser">Etunimi:</label> <input type="text" name="etunimi"
						value="<%=resultSet.getString("etunimi")%>" class="form-control"><br>
					</div>
				</div>
					<label for="inputUser">Puolue:</label><input type="text" name="puolue"
						value="<%=resultSet.getString("puolue")%>" class="form-control"> <br>
						
					<label for="inputUser">Kotipaikkakunta:</label> <input type="text" name="koti"
						value="<%=resultSet.getString("kotipaikkakunta")%>" class="form-control"> <br>
						
					<label for="inputUser">Ika:</label><input type="text" name="ika"
						value="<%=resultSet.getString("ika")%>" class="form-control"> <br>
						
					<label for="inputUser">Miksi eduskuntaan:</label> <input type="text" name="miksi"
						value="<%=resultSet.getString("miksi_eduskuntaan")%>" class="form-control"> <br>
						
					<label for="inputUser">Mita asioita haluat edistaa:</label><input type="text" name="mita"
						value="<%=resultSet.getString("mita_asioita_haluat_edistaa")%>" class="form-control"> <br>
			
					<label for="inputUser">Ammatti:</label><input type="text" name="ammatti"
						value="<%=resultSet.getString("AMMATTI")%>" class="form-control"> <br>
			
					<input type="Submit" value="Submit" class="btn btn-warning">				
			</form>
			
		
		<%
			}
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
		</div>
	</body>
	</html>