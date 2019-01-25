<?php

start_session();

if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true)
{
	header("location: testlogin.php");
	exit;
}

require_once "config.php";

$usererr=$passerr="";

if($_SERVER["REQUEST_METHOD"]=="POST")
{
	if(empty($_POST["username"]))
	{
		$usererr="Username is required";
	}
	if(empty($_POST["password"]))
	{
			$passerr="Password Required";
	}
}



?>


<!DOCTYPE html>
<html>
<head>
  <title>Login Form</title>
  <link rel="stylesheet" href="login_style.css">
</head>
  <body>
<form method="post" action="loginconfirmed.php">
	<div class="login-screen">
			<div class="app-title">
				<h1>Login</h1>
			</div>
			<div class="login-form">
				<div class="control-group1">
				<input type="text" placeholder="Username" name="username">
				</div>
				<div class="error">*<?php echo $usererr; ?></div>

				<div class="control-group2">
				<input type="password" placeholder="Password" name="password">
				</div>
				<div class="error">*<?php echo $passerr; ?></div>

				<button class="button">login</button>
			</div>
	</div>
</form>
</body>
</html>
