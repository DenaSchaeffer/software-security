<?php 
  $username = $_POST["username"]; //username input via HTTP Request POST
  $password = $_POST["password"]; //password input via HTTP Request POST
  echo "got username=" . $username . ";password= $password <br>"; //for debug ONLY  
  $sql1 = "SELECT * FROM users where username='" . $username . "' AND password = password('" . $password . "');";
  $sql2 = "SELECT * FROM users where username='$username' AND password = password('$password');";
  echo "Debug:sql1=" . $sql1 . "<br>";
  echo "Debug:sql2=$sql2 <br>";
?>

