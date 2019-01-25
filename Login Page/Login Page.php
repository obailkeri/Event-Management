<?php

start_session();

if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true)
{
	header("location: testlogin.php");
	exit;
}

require_once "config.php";

$username = $password = "";

?>


<html>
	<title>Login Page</title>
	<body>
		<center>
			<form method="POST" action="test login.html">
				Username:<input type ="text" name="name"><br><br>
				Password<input type="password" name="password">
				<br>
				<br>
				<input type="submit" name="submit" value="Login">
			</form>
		</center>
	</body>
</html> 
