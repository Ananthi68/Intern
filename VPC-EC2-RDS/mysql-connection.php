<?php
$servername = "your-rds-endpoint.amazonaws.com";
$username = "admin";
$password = "password123";
$conn = new mysqli($servername, $username, $password);
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>
