<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link href="style.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add more candidate</title>
</head>
<body>
<%
String driverName="com.mysql.jdbc.Driver";
String connectionUrl ="jdbc:mysql://localhost:3306/";
String database="vaalikone";
String userID="root";
String password="0408153804";

try{
	Class.forName(driverName);
}catch(ClassNotFoundException e){
	e.printStackTrace();
}
Connection connetion = null;
Statement statement=null;
ResultSet resultSet=null;
%>
<div id="container">
<form action ="add-process.jsp">
<h1>Add more candidate</h1>
<br>
<h2> Personal information</h2>
<h4>Sukunimi:</h4><br>
<input type="text" name="sukunimi" id="addInput">
</br> <h4>Etunimi:</h4><br>
<input type="text" name="etunimi" id="addInput">
<br><h4> Puolue:</h4> <br>
<input type="text" name="puolue" id="addInput">
<br><h4>Kotipaikkakunta:</h4><br>
<input type="text" name="koti" id="addInput">
<br><h4>Ika:</h4>  <br>
<input type="text" name="ika" id="addInput">
<br><h4>Miksi edukustaan?</h4><br>
<input type="text" name="miksi" id="addInput">
<br><h4>Mita asioita haluat edistaa?</h4> <br>
<input type="text" name="mita" id="addInput"><br>
<br><h4>Ammatti?</h4>
<input type="text" name="amma" id="addInput">
<br>





<h4></h4><input type="submit" value="submit" class="submit" id="submitnappi">

</form>

</tr>
</div>

</body>
</html>