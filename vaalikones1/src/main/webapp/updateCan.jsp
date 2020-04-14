<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%
String id = request.getParameter("ehdokas_id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "vaalikone";
String userid = "root";
String password = "0408153804";
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
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select ehdokas_id,sukunimi,etunimi,puolue,kotipaikkakunta,ika,ammatti from ehdokkaat where ehdokas_id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<div id="container">
<h1>Update data</h1>
<form method="post" action="updateCan-process.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("ehdokas_id") %>"><h4>Ehdokas_ID:</h4>
<br>
<input type="text" name="id" value="<%=resultSet.getString("ehdokas_id") %>">
<br>
<h4>Etunimi:</h4><br>
<input type="text" name="sukunimi" value="<%=resultSet.getString("sukunimi") %>">
<br>
<h4>Sukunimi:</h4><br>
<input type="text" name="etunimi" value="<%=resultSet.getString("etunimi") %>">
<br>
<h4>Puolue:</h4><br>
<input type="text" name="puolue" value="<%=resultSet.getString("puolue") %>">
<br>
<h4>Kotipaikkakunta:</h4><br>
<input type="text" name="koti" value="<%=resultSet.getString("kotipaikkakunta") %>">
<br>
<h4>Ika:</h4><br>
<input type="text" name="ika" value="<%=resultSet.getString("ika") %>">
<br><br>
<h4>Ammatti:</h4><br>
<input type="text" name="ammatti" value="<%=resultSet.getString("ammatti") %>">
<br><br>
<input type="Submit" value="Submit">
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