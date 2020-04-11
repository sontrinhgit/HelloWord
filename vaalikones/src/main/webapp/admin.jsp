<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.*,vaalikone.Vaalikone,persist.*"%>
<%@page import = "javax.persistence.EntityManagerFactory, javax.persistence.EntityManager, javax.persistence.Persistence,
javax.persistence.Query" %>


    
<!DOCTYPE html>
<html>
<head>
<title>Diginide vaalikone</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 <div id="container">
            
            <img id="headerimg" src="Logo.png" width="720" />
            <div class="kysymys">
                <h1>Vaalikone</h1>
            </div>
                <br>           
       
                
                   <a class="btn btn-primary" href="candidateTable.jsp" role="button">Retrieve the candidates</a>
                   <a class="btn btn-primary" href="#" role="button">Edit questions</a>
           
           
        </div>
</body>
</html>