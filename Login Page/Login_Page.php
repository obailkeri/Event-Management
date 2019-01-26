<?php

session_start();

if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true)
{
	header("location: localhost/loginconfirmed.php");
	//echo "loggedin";
	exit;
}

require_once "config.php";
$username = $password = "";
//variables for error testing
$usererr=$passerr="";
if($_SERVER["REQUEST_METHOD"] == "POST")
{
	if($_SERVER["REQUEST_METHOD"]=="POST")
	{
		if(empty($_POST["username"]))
		{
			$usererr="Username Incorrect";
		}
		if(empty($_POST["password"]))
		{
				$passerr="Password Incorrect";
		}
	}
	$username = trim($_POST["username"]);
	$password = trim($_POST["password"]);
	//echo $username;
	//echo $password;

	$sql ="SELECT id,user_name ,password FROM login WHERE user_name = ?";
	if($stmt = mysqli_prepare($mysqllink,$sql)){

		mysqli_stmt_bind_param($stmt, "s",$param_username);
		$param_username=$username;

		if(mysqli_stmt_execute($stmt)){

			mysqli_stmt_store_result($stmt);

			if(mysqli_stmt_num_rows($stmt) == 1){

				mysqli_stmt_bind_result($stmt,$id,$username,$hashed_pass);

				if(mysqli_stmt_fetch($stmt)){

					if(password_verify($password,$hashed_pass)){
						session_start();

						$_SESSION["loggedin"] = true;

						$_SESSION["id"] = $id;

						$_SESSION["username"] = $username;
						echo "loggedin";
						header("location: localhost/loginconfirmed.php"); 
					}
				}
			}
		}
		mysqli_stmt_close($stmt);
	}
	mysqli_close($mysqllink);
}
?>


<!DOCTYPE html>
<html>
<head>
  <title>Login Form</title>
  <link rel="stylesheet" href="login_style.css">
</head>
  <body>
<form method="post" action="<?php echo 
htmlspecialchars($_SERVER["PHP_SELF"]); ?>">

	<div class="login-screen">
			<div class="app-title">
				<h1>Login</h1>
			</div>
			<div class="login-form">
				<div class="control-group1">
				<input type="text" placeholder="Username" name="username" value="">
				</div>
				<div class="error">*<?php echo $usererr; ?></div>

				<div class="control-group2">
				<input type="password" placeholder="Password" name="password" value="">
				</div>
				<div class="error">*<?php echo $passerr; ?></div>

				<button class="button">login</button>
			</div>
	</div>
</form>
</body>
</html>
