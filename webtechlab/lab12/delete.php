<?php

$conn = new mysqli("localhost", "root", "", "signup_db");

$id = $_GET['id'];

$sql = "DELETE FROM users WHERE id=$id";

if ($conn->query($sql) === TRUE) {
    echo "Record Deleted Successfully ✔";
} else {
    echo "Error deleting record ❌";
}

$conn->close();

?>