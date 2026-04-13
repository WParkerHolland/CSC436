<?php
require_once 'includes/database-connection.php';
require_once 'includes/session.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];

    // 🔐 HASH PASSWORD HERE
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $sql = "INSERT INTO customer (username, password)
            VALUES (:uName, :uPass)";

    pdo($pdo, $sql, [
        "uName" => $username,
        "uPass" => $password
    ]);

    echo "User created! <a href='login.php'>Login here</a>";
}

include("./includes/header.php");
?>

<div class="login-container">
    <h1>Register</h1>

    <form method="POST" action="register.php">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Register">
    </form>
</div>

<?php include 'includes/footer.php'; ?>
