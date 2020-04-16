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
String kysy=request.getParameter("kysymys");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update kysymykset set kysymys_id=?,kysymys=? where kysymys_id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, kysy);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("You edited successfully");
%> <br>
<a href="edit.jsp">Back</a>
<% 
}
else
{
out.print("There is a problem in updating record.");
getServletContext().getRequestDispatcher("rtest.jsp").forward(request, response);
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