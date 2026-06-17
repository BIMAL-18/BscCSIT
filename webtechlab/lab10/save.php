<?php

$conn = new mysqli("localhost", "root", "", "signup_db");

if ($conn->connect_error) {
    die("Connection failed");
}

// Get form data
$name = $_POST['name'];
$address = $_POST['address'];
$phone = $_POST['phone'];
$email = $_POST['email'];
$dob = $_POST['dob'];

// Handle image upload
$photo = $_FILES['photo']['name'];
$tmp = $_FILES['photo']['tmp_name'];

$uploadPath = "uploads/" . $photo;
move_uploaded_file($tmp, $uploadPath);

// Insert into database
$sql = "INSERT INTO users (name, address, phone, email, dob, photo)
VALUES ('$name', '$address', '$phone', '$email', '$dob', '$photo')";

if ($conn->query($sql) === TRUE) {
    echo "Data Saved Successfully ✔";
} else {
    echo "Error: " . $conn->error;
}

$conn->close();
?>