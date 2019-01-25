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


<!DOCTYPE html>
<html>
<head>
  <title>Login Form</title>
  <link rel="stylesheet" href="login_style.css">
</head>
  <body>
<form method="post" action="page1.html">
	<div class="login-screen">
			<div class="app-title">
				<h1>Login</h1>
			</div>
			<div class="login-form">
				<div class="control-group1">
				<input type="text" placeholder="Username" name="username">
				</div>

				<div class="control-group2">
				<input type="password" placeholder="Password" name="password">
				</div>

				<button class="button">login</button>
			</div>
	</div>
</form>
</body>
</html>

