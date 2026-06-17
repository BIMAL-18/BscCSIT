<?php

$conn = new mysqli("localhost", "root", "", "login_db");

if ($conn->connect_error) {
    die("Connection failed");
}

$username = $_POST['username'];
$password = $_POST['password'];
$remember = isset($_POST['remember']);

$sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {

    // If remember me checked → store cookie
    if ($remember) {
        setcookie("username", $username, time() + (86400 * 7), "/"); // 7 days
    } else {
        setcookie("username", "", time() - 3600, "/"); // delete cookie
    }

    echo "Login Successful Welcome " . $username;

} else {
    echo "Invalid Username or Password ";
}

$conn->close();
?>