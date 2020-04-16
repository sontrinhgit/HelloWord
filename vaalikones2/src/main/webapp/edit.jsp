<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link href="style.css" rel="stylesheet" type="text/css">
<div id="container">
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

<h2 align="center"><font><strong>All the candidates</strong></font></h2>
<a href="welcome.jsp">Back</a>
<table  border="1" class="tb">
<tr>

</tr>
<tr>
<td ><b>Kysymys_id</b></td>
<td ><b>Kysymys</b></td>
<td ><b>Action</b></td>


</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT kysymys_id,kysymys FROM kysymykset";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("kysymys_id") %></td>
<td><%=resultSet.getString("kysymys") %></td>
<td><a href="edit-process.jsp?kysymys_id=<%=resultSet.getString("kysymys_id")%>">Edit</a></td>


</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</div>