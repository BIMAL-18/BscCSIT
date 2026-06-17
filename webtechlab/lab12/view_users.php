<?php

$conn = new mysqli("localhost", "root", "", "signup_db");

$sql = "SELECT * FROM users ORDER BY dob DESC LIMIT 5";
$result = $conn->query($sql);

echo "<h2>User List</h2>";

echo "<table border='1' cellpadding='10'>";
echo "<tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Phone</th>
        <th>Email</th>
        <th>DOB</th>
        <th>Actions</th>
      </tr>";

while ($row = $result->fetch_assoc()) {

    echo "<tr>
        <td>{$row['id']}</td>
        <td>{$row['name']}</td>
        <td>{$row['address']}</td>
        <td>{$row['phone']}</td>
        <td>{$row['email']}</td>
        <td>{$row['dob']}</td>
        <td>

        <!-- Edit Button -->
        <a href='edit.php?id={$row['id']}' onclick='return confirm(\"Do you want to edit this record?\")'>
        Edit</a> |

        <!-- Delete Button -->
        <a href='delete.php?id={$row['id']}' onclick='return confirm(\"Are you sure you want to delete?\")'>
        Delete</a>

        </td>
    </tr>";
}

echo "</table>";

$conn->close();

?>