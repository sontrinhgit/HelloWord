<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link href="style.css" rel="stylesheet" type="text/css">

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

<h1 align="center"><font><strong>All the candidates</strong></font></h1>
<a href="welcome.jsp">Back</a>
<table  border="1" class="tb">
<tr>

</tr>
<tr>
<td ><b>Ehdokas_ID</b></td>
<td ><b>Sukunimi</b></td>
<td ><b>Etunimi</b></td>
<td><b> Puolue </b></td>
<td><b> Kotipaikkakunta </b></td>
<td><b> Ika </b></td>
<td><b> Miksi eduskuntaan? </b></td>
<td><b> Mita asioita haluat edistaa? </b></td>
<td><b> Ammatti </b></td>
<td><b>Action</b></td>
<td><b>Action</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT ehdokas_id,sukunimi,etunimi,puolue,kotipaikkakunta,ika, miksi_eduskuntaan,mita_asioita_haluat_edistaa,ammatti FROM ehdokkaat";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("ehdokas_id") %></td>
<td><%=resultSet.getString("sukunimi") %></td>
<td><%=resultSet.getString("etunimi") %></td>
<td><%=resultSet.getString("puolue") %></td>
<td><%=resultSet.getString("kotipaikkakunta") %></td>
<td><%=resultSet.getString("ika") %></td>
<td><%=resultSet.getString("miksi_eduskuntaan") %></td>
<td><%=resultSet.getString("mita_asioita_haluat_edistaa") %></td>
<td><%=resultSet.getString("ammatti") %></td>
<td><a href="updateCan.jsp?ehdokas_id=<%=resultSet.getString("ehdokas_id")%>">Update</a></td>
<td><a href="delete.jsp?ehdokas_id=<%=resultSet.getString("ehdokas_id")%>">Delete</a></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

