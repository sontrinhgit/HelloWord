<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%@page import="java.sql.*,java.util.*"%>
<div id="container">
<%
String etunimi=request.getParameter("etunimi");
String sukunimi=request.getParameter("sukunimi");
String ika=request.getParameter("ika");
String puolue=request.getParameter("puolue");
String koti =request.getParameter("koti");
String mita =request.getParameter("mita");
String miksi = request.getParameter("miksi");
String amma = request.getParameter("amma");


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaalikone", "root", "0408153804");
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("Select ehdokas_id from ehdokkaat");




int id=20;
if(rs.last()){
	id=rs.getInt("ehdokas_id")+1;
}

int i=st.executeUpdate("insert into ehdokkaat(ehdokas_id,sukunimi,etunimi,puolue,kotipaikkakunta,ika,miksi_eduskuntaan,mita_asioita_haluat_edistaa,ammatti)values('"+id+"','"+sukunimi+"','"+etunimi+"','"+puolue+"','"+koti+"','"+ika+"','"+miksi+"','"+mita+"','"+amma+"')");
out.println("Personal information are inserted!");
%>
<br>
<a href="add2.1-process.jsp?sukunimi=<%=rs.getString("sukunimi")%>">Next</a> 
<% 
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</div>