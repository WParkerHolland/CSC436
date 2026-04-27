<?php

    require_once('includes/database-connection.php');
    
    if (!isset($_SESSION['username'])) {
        header("Location: login.php");
        exit;
    }
    
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
        $campaign_name = trim($_POST['campaign_name']);
        $user = $_SESSION['username']; // or user_id if needed
    
        if ($campaign_name !== '') {
    
            try {
                // 1. Create campaign (Location)
                $sql = "INSERT INTO Locations (name, description, gmNotes, partyNotes, img_src, visible)
                        VALUES (:name, '', '', '', 'imgs/world_default.png', 1)";
                
                pdo($pdo, $sql, [
                    ":name" => $campaign_name
                ]);
    
                $new_id = $pdo->lastInsertId();
    
                // 2. Link user as GM
                $sql2 = "INSERT INTO PlayingIn (user, plays, world, role)
                         VALUES (:user, NULL, :world, 'gm')";
                
                pdo($pdo, $sql2, [
                    ":user" => $user,
                    ":world" => $new_id
                ]);
    
                // 3. Redirect to new campaign
                header("Location: location.php?loc_ID=$new_id&role=gm");
                exit;
    
            } catch (PDOException $e) {
                echo "Error: " . $e->getMessage();
                exit;
            }
        }
    }
?>