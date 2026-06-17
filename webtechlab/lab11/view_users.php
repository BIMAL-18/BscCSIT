    <?php

$conn = new mysqli("localhost", "root", "", "signup_db");

if ($conn->connect_error) {
    die("Connection failed");
}

// Query: youngest first, limit 5
$sql = "SELECT * FROM users ORDER BY dob DESC LIMIT 5";
$result = $conn->query($sql);

echo "<h2>Top 5 Users (Youngest to Oldest)</h2>";

echo "<table border='1' cellpadding='10'>";
echo "<tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Phone</th>
        <th>Email</th>
        <th>DOB</th>
      </tr>";

if ($result->num_rows > 0) {

    while ($row = $result->fetch_assoc()) {

        echo "<tr>
                <td>{$row['id']}</td>
                <td>{$row['name']}</td>
                <td>{$row['address']}</td>
                <td>{$row['phone']}</td>
                <td>{$row['email']}</td>
                <td>{$row['dob']}</td>
              </tr>";
    }

} else {
    echo "<tr><td colspan='6'>No data found</td></tr>";
}

echo "</table>";

$conn->close();

?>