<?php

    /* TO-DO: Include database-connection.php to connect to the database
              Hint: Both header.php and database-connection.php are inside the includes folder
    */
    require_once("./includes/database-connection.php");


    /* TO-DO: Include session.php to handle login sessions
              Hint: Both header.php and session.php are inside the includes folder
    */
    require_once("./includes/session.php");
    

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scribe</title>

    <link rel="stylesheet" href="css/styles.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lilita+One&display=swap" rel="stylesheet">
</head>

<body>

<header class="site-header">

    <div class="container header-container">

        <div class="logo">
            <img src="imgs/logo.png" alt="No Existing Scribe Logo">
        </div>

        <nav class="main-nav">
            <ul>
                <?php if($logged_in) { ?>
                    <li><a href="dashboard.php">User Dashboard</a></li>
                    <li><a href="logout.php">Log Out</a></li> 
                <?php } ?>
                 
            </ul>
        </nav>

    </div>

</header>

<main class="container">