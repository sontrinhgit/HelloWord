<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link href="style.css" rel="stylesheet" type="text/css">
<div id="container">
<%
String suku=request.getParameter("suku");
String etu=request.getParameter("etu");
String puo=request.getParameter("puo");
String koti =request.getParameter("koti");
String ika = request.getParameter("ika");
String miksi=request.getParameter("miksi");
String mita=request.getParameter("mita");
String ama = request.getParameter("ammatti");


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaalikone", "root", "0408153804");
Statement st=conn.createStatement();
ResultSet rs= st.executeQuery("select ehdokas_id from ehdokkaat");

Statement st1=conn.createStatement();
ResultSet rs1=st1.executeQuery("select kysymys_id from vastaukset");


int id=0;
if(rs.last()){
	id=rs.getInt("ehdokas_id")+1;
}
for(int a=1;a<20;a++){
	int p = st1.executeUpdate("insert into vastaukset(ehdokas_id,kysymys_id) values ('"+id+"','"+a+"')");
}

int i=st.executeUpdate("insert into ehdokkaat(ehdokas_id,sukunimi,etunimi,puolue,kotipaikkakunta,ika,miksi_eduskuntaan,mita_asioita_haluat_edistaa,ammatti)values('"+id+"','"+suku+"','"+etu+"','"+puo+"','"+koti+"','"+ika+"','"+miksi+"','"+mita+"','"+ama+"')");
	out.println("Data is successfully inserted!");
	out.println("<html><br></html>");
	out.println("Remember your candidate ID to go to the next step");
	out.println("<html><br><html>");
	out.println("<html><strong>Your candidate ID is</strong><html> "+id);
	out.println("<html><br><html>");
	%>
	<a href="#"> Next</a>
<% 
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</div>