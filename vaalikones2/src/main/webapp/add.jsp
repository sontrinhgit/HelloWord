<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link href="style.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add more candidates</title>
</head>
<body>
<div id="container">
<form action ="add-process.jsp">
<h2>Add more candidates</h2>
	Sukunimi: <br>
	<input type="text" name="suku" required id="suku">
	<br> Etunimi: <br>
	<input type="text" name="etu"required id="suku">
	<br> Puolue: <br>
	<input type="text" name="puo" required id="suku">
	<br> Kotipaikkakunta: <br>
	<input type="text" name="koti"required id="suku">
	<br> Ika: <br>
	<input type="number" name="ika" required id="suku">
	<br> Miksi Eduskuntaan: <br>
	<input type="text" name="miksi" required id="kysymys">
	<br> Mita asioita haluat edistaa: <br>
	<input type="text" name="mita" required id="kysymys">
	<br> Ammatti: <br>
	<input type="text" name="ama" required id="kysymys">
	<br>
	<input type="submit" value="submit" id="submitnappi" >
</form>
</div>
</body>
</html>