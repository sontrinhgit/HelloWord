<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*,java.util.*"%>
<link href="style.css" rel="stylesheet" type="text/css">
<div id="container">
<%

String id=request.getParameter("ehdokas_id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaalikone", "root", "0408153804");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM ehdokkaat WHERE ehdokas_id="+id);
out.println("Data Deleted Successfully!");
response.sendRedirect("rtest.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</div>
