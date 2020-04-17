<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link href="style.css" rel="stylesheet" type="text/css">


<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/vaalikone";%>
<%!String user = "root";%>
<%!String psw = "0408153804";%>
<div id="container">
<%
String id = request.getParameter("id");
String Etunimi=request.getParameter("etunimi");
String Sukunimi=request.getParameter("sukunimi");
String puolue=request.getParameter("puolue");
String koti=request.getParameter("koti");
String ika=request.getParameter("ika");
String miksi = request.getParameter("miksi");
String mita=request.getParameter("mita");
String ama=request.getParameter("ammatti");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update ehdokkaat set ehdokas_id=?,etunimi=?,sukunimi=?,puolue=?,kotipaikkakunta=?,ika=?,miksi_eduskuntaan=?,mita_asioita_haluat_edistaa=?,ammatti=? where ehdokas_id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, Etunimi);
ps.setString(3, Sukunimi);
ps.setString(4, puolue);
ps.setString(5,koti);
ps.setString(6,ika);
ps.setString(7,miksi);
ps.setString(8,mita);
ps.setString(9,ama);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("You updated successfully");
%> <br>
<a href="rtest.jsp">Back</a>
<% 
}
else
{
out.print("There is a problem in updating Record.");
getServletContext().getRequestDispatcher("/rtest.jsp").forward(request, response);
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}

%>
</div>