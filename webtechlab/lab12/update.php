<?php

$conn = new mysqli("localhost", "root", "", "signup_db");

$id = $_POST['id'];
$name = $_POST['name'];
$address = $_POST['address'];
$phone = $_POST['phone'];
$email = $_POST['email'];
$dob = $_POST['dob'];

$sql = "UPDATE users SET 
        name='$name',
        address='$address',
        phone='$phone',
        email='$email',
        dob='$dob'
        WHERE id=$id";

if ($conn->query($sql) === TRUE) {
    echo "Record Updated Successfully ✔";
} else {
    echo "Error updating record ";
}

$conn->close();

?>