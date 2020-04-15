<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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

<form class="form-inline" method="GET" action="#">
			<div class="form-group">
				<label for="inputUser">Username</label> 
				<input type="text" class="form-control mx-sm-3" name="uname" required><br> 
				<label for="inputUser">Password</label> 
				<input type="password"	class="form-control mx-sm-3" name="pass" required><br>
			</div><br>
			 <button type="submit" class="btn btn-primary">Login</button>
			<a href="index.html" class="btn btn-warning">Back</a>
		</form>
		
</div>
</form>
</body>
</html>