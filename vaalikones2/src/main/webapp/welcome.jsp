<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link href="style.css" rel="stylesheet" type="text/css">
<title>CRUD page</title>
</head>
<body>
<div id="container">
<h1> Welcome to the admin page</h1>
<form action="logout" method="post">
<input type="submit" value="Log Out" >
</form>
<hr>
<form action="rtest.jsp"">
<input type="submit" value ="All the candidate" id="submitnappi">
</form>
<form action="edit.jsp">
<input type="submit" value="Edit questions" id="submitnappi">
</form>
<form action="add.jsp">
<input type="submit" value="Add more candidate" id="submitnappi">
</form>
</body>
</html>