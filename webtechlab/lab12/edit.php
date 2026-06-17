<?php

$conn = new mysqli("localhost", "root", "", "signup_db");

$id = $_GET['id'];

$sql = "SELECT * FROM users WHERE id=$id";
$result = $conn->query($sql);

$row = $result->fetch_assoc();

?>

<h2>Edit User</h2>

<form action="update.php" method="post">

    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">

    Name:<br>
    <input type="text" name="name" value="<?php echo $row['name']; ?>"><br><br>

    Address:<br>
    <input type="text" name="address" value="<?php echo $row['address']; ?>"><br><br>

    Phone:<br>
    <input type="text" name="phone" value="<?php echo $row['phone']; ?>"><br><br>

    Email:<br>
    <input type="text" name="email" value="<?php echo $row['email']; ?>"><br><br>

    DOB:<br>
    <input type="date" name="dob" value="<?php echo $row['dob']; ?>"><br><br>

    <input type="submit" value="Update">

</form>