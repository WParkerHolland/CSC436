<?php

    /* TO-DO: Include header.php
              Hint: header.php is inside the includes folder and already connects to the database
    */

    include("./includes/header.php");

    // Retrieve the value of the 'itemnum' parameter from the URL query string
	//          Example URL: .../item.php?itemnum=0001
	$char_id = $_GET['charnum'];



    /* TO-DO: Create a function that retrieves ALL toy and manufacturer information 
              from the database based on the itemnum parameter from the URL.

              Your function should:
                1. Query the appropriate database table to retrieve toy and manufacturer info based on toynum
                2. Execute the SQL query using the pdo() helper function and fetch the result
                3. Return toy information
	*/
    function get_char_info(PDO $pdo, $char_id) {
        $sql = "SELECT Characters.*, 
                Players.level, Players.playedBy, Players.combat_style,
                Creatures.population, Creatures.ability,
                NPCs.opinions, NPCs.occupation, NPCs.gold
                FROM Characters
                LEFT JOIN Players ON Players.ID = Characters.ID
                LEFT JOIN Creatures ON Creatures.ID = Characters.ID
                LEFT JOIN NPCs ON NPCs.ID = Characters.ID
                WHERE Characters.ID = :id;";

        $char_info = pdo($pdo, $sql, ['id' => $char_id])->fetch();

        return $char_info;
    }


    /* TO-DO: Call function to retrieve character information */
    $item = get_char_info($pdo, $char_id);

?>

<section class="toy-details-page container">
    <div class="toy-details-container">
        <div class="toy-image">

            <!-- TO-DO: Display the toy image and update the alt text to the toy name -->
            <img src="<?= $item["img_src"] ?>" alt="<?= $item["name"] ?>">

        </div>

        <div class="toy-details">

            <!-- TO-DO: Display the toy name -->
            <h1><?= $item["name"] ?></h1>

            <h3>Character Information</h3>
            <p><strong>Race:</strong> <?= $item["race"] ?></p>
            <p><strong>Description:</strong> <?= $item["description"] ?></p>

            <!-- Player specific info -->
            <?php if ($item["playedBy"]) { ?>
                <br />
                <h3>Player Information</h3>
                <p><strong>Played By:</strong> <?= $item["playedBy"] ?></p>
                <p><strong>Level:</strong> <?= $item["level"] ?></p>
                <p><strong>Combat Style:</strong> <?= $item["combat_style"] ?></p>
            <?php } ?>

            <!-- Creature specific info -->
            <?php if ($item["population"]) { ?>
                <br />
                <h3>Species Information</h3>
                <p><strong>Population:</strong> <?= $item["population"] ?></p>
                <p><strong>Ability:</strong> <?= $item["ability"] ?></p>
            <?php } ?>

            <!-- NPC specific info -->
            <?php if ($item["occupation"]) { ?>
                <br />
                <h3>NPC Information</h3>
                <p><strong>Occupation:</strong> <?= $item["occupation"] ?></p>
                <p><strong>Opinions:</strong> <?= $item["opinions"] ?></p>
                <p><strong>Gold:</strong> <?= $item["gold"] ?></p>
            <?php } ?>
        </div>
    </div>
</section>

<?php include 'includes/footer.php'; ?>