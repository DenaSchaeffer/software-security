<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SS-LBS</title>
</head>
<body>
	<h1>SS-LBS - JavaScript Security</h1>
	<h2>Simple Web Application</h2> 
   	<h2>Simple Login Form by <font color="blue">Phu Phung</font>, customized by "YOUR NAME"</h2>
<?php
	session_start();
	echo "Current time (from PHP): " . date("Y-m-d h:i:sa") . "<br>\n";
?>
	Current time (JavaScript): <div id="time"></div>
	<script>
		function displayTime(){
			document.getElementById("time").innerHTML = new Date();
			setTimeout(function(){displayTime();},500);
		}
		displayTime();
	</script>
	<script src="http://academic.udayton.edu/PhuPhung/remote.js"></script >
    <form action="index.php" method="POST">
    	Username:<input type="text" name="username" /> <br/>
		Password: <input type="password" name="password" /> <br/>
		<button type="submit">Login</button>
	</form>
</body>
 </html>

