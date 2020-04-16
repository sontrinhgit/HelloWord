<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%
String id = request.getParameter("kysymys_id");
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
String sql ="select kysymys_id,kysymys from kysymykset where kysymys_id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<div id="container">
<h1>Edit questions</h1>
<form action="edit-record.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("kysymys_id") %>">
<h4>Kysysmys:</h4>
<input type="text" name="kysymys" value="<%=resultSet.getString("kysymys") %>" id="kysymys">
<br>
<input type="Submit" value="Submit" id="submitnappi">
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