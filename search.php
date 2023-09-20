<?php
// Establish a database connection (replace with your database credentials)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "job portal"; // Replace with your database name

$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the search keyword from the URL
$keyword = $_GET['keyword'];

// Create a SQL query to fetch job listings based on the keyword
$sql = "SELECT * FROM job_listings WHERE title LIKE '%$keyword%' OR description LIKE '%$keyword%'";

$result = $conn->query($sql);

// Check if there are any results
if ($result->num_rows > 0) {
    // Display the job listings
    echo "<h2>Search Results:</h2>";
    while ($row = $result->fetch_assoc()) {
        echo "<p>Title: " . $row['title'] . "</p>";
        echo "<p>Description: " . $row['description'] . "</p>";
        echo "<p>Location: " . $row['location'] . "</p>";
        echo "<hr>";
    }
} else {
    echo "No job listings found for '$keyword'.";
}

$conn->close();
?>
