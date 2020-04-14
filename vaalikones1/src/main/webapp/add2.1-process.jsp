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
String radio1=request.getParameter("radio1");
String radio2=request.getParameter("radio2");
String radio3=request.getParameter("radio3");
String radio4=request.getParameter("radio4");
String radio5=request.getParameter("radio5");
String radio6=request.getParameter("radio6");
String radio7=request.getParameter("radio7");
String radio8=request.getParameter("radio8");
String radio9=request.getParameter("radio9");
String radio10=request.getParameter("radio10");
String radio11=request.getParameter("radio11");
String radio12=request.getParameter("radio12");
String radio13=request.getParameter("radio13");
String radio14=request.getParameter("radio14");
String radio15=request.getParameter("radio15");
String radio16=request.getParameter("radio16");
String radio17=request.getParameter("radio17");
String radio18=request.getParameter("radio18");
String radio19=request.getParameter("radio19");
String comment1 = request.getParameter("comment1");
String comment2 = request.getParameter("comment2");
String comment3 = request.getParameter("comment3");
String comment4 = request.getParameter("comment4");
String comment5 = request.getParameter("comment5");
String comment6 = request.getParameter("comment6");
String comment7 = request.getParameter("comment7");
String comment8 = request.getParameter("comment8");
String comment9 = request.getParameter("comment9");
String comment10 = request.getParameter("comment10");
String comment11 = request.getParameter("comment11");
String comment12 = request.getParameter("comment12");
String comment13 = request.getParameter("comment13");
String comment14 = request.getParameter("comment14");
String comment15 = request.getParameter("comment15");
String comment16 = request.getParameter("comment16");
String comment17 = request.getParameter("comment17");
String comment18 = request.getParameter("comment18");
String comment19 = request.getParameter("comment19");

%>
</div>

