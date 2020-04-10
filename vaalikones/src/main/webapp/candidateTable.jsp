<%-- 
    Document   : vastaus
    Created on : 09-Apr-2015, 12:50:47
    Author     : Jonne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,vaalikone.Vaalikone,persist.*"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diginide Vaalikone 2.0</title>

<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>

<div id="container">
<img id="headerimg" src="Logo.png" width="500" height="144" alt=""/>



 <%
            @SuppressWarnings("unchecked") 
            List<Kysymykset> kysymykset = (List<Kysymykset>)request.getAttribute("kysymykset");
            for (Kysymykset kysymys : kysymykset) { %>
        
                <%= kysymys.getKysymysId() %> <br>
                <%= kysymys.getKysymys() %>
                <%
            } 
        %>




</div>

</body>
</html>
