<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Simple Web Application - Lab 4 - SS-LBS</title>
</head>
<body>
	<h1>SS-LBS - Lab 4</h1>
	<h2>Simple Web Application</h2> 
   	<h2>Simple index page by <font color="blue">Phu Phung</font>, customized by Dena Schaeffer</h2>
<?php 
	session_start();
	$welcome = "Welcome back "; //default message for return users
	$username = $_POST["username"]; //username input from the user via HTTP Request POST
	$password = $_POST["password"]; //password input from the user via HTTP Request POST
  	/*for debug only*/echo "DEBUG>Received: username=\"" . $username .  "\" and password=\"" . $password . "\"<br>\n";
	if (isset($username) and isset($password) ){
	//the case username and password is provided
    	if (/*TODO for TASK 3.b*/mockchecklogin($username,$password)){ 
      		/*TODO for TASK 1.a*/;
			$_SESSION["username"] = $username;
			$welcome = "Welcome "; //not previously logged-in 
    	}else{//failed
			redirect_login('Invalid username/password');
		}
	}else{//no username/password is provided
		//check if the session has NOT been logged in, redirect to the login page
		if (/*TODO for TASK 1.b*/) {
    		redirect_login('You have not logged in. Please login first!');
  		}
	}
	//the main business logic implementation of the page
	echo "Current time: " . date("Y-m-d h:i:sa") . "\n";
	echo "<h2>" .  $welcome . "<font color='blue'>" . $_SESSION["username"] . "</font>!</h2>\n";
?>
	<a href="logout.php">Logout</a>
<?php	
	//supporting functions	
	function redirect_login($message){
		echo "<script>alert('" . $message . "');</script>\n";
		session_destroy();//clear all session variables 
		header("Refresh:0; url=login.php");
    	die();
	}
	function mockchecklogin($username, $password) {
		//we do mock-up check first
		if (($username== "admin") and ($password == "admin")) 
		  return TRUE;
		else return FALSE;
  	}
	function checklogin($username, $password) {
		//access the real database to check the username/password
   		$dbconnection = mysqli_connect("localhost", "root", "seedubuntu","ss_lbs");
		if (mysqli_connect_errno()) {
    		printf("Connect failed: %s\n", mysqli_connect_error());
    		exit();
		}
		/*TODO for TASK 3.a*/
  		









		return FALSE;
  	}
?>
</body>
</html>
