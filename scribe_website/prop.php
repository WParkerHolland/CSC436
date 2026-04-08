<?php

    /* TO-DO: Include header.php
              Hint: header.php is inside the includes folder and already connects to the database
    */

    include("./includes/header.php");

    // Retrieve the value of the 'itemnum' parameter from the URL query string
	//          Example URL: .../item.php?itemnum=0001
	$prop_id = $_GET['propnum'];



    /* TO-DO: Create a function that retrieves ALL toy and manufacturer information 
              from the database based on the itemnum parameter from the URL.

              Your function should:
                1. Query the appropriate database table to retrieve toy and manufacturer info based on toynum
                2. Execute the SQL query using the pdo() helper function and fetch the result
                3. Return toy information
	*/
    function get_prop_info(PDO $pdo, $prop_id) {
        $sql = "SELECT * FROM Props WHERE ID = :id;";

        $prop_info = pdo($pdo, $sql, ['id' => $prop_id])->fetch();

        return $prop_info;
    }


    /* TO-DO: Call function to retrieve toy information */
    $item = get_prop_info($pdo, $prop_id);

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

            <h3>Item Information</h3>

            <!-- TO-DO: Display the item description -->
            <p><strong>Description:</strong> <?= $item["description"] ?></p>

            <!-- TO-DO: Display item type -->
            <p><strong>Type:</strong> <?= $item["itemType"] ?></p>

            <!-- TO-DO: Display the item rarity -->
            <p><strong>Rarity:</strong> <?= $item["rarity"] ?></p>

            <!-- TO-DO: Display item quantity -->
            <p><strong>Quantity:</strong> <?= $item["quantity"] ?></p>
        </div>
    </div>
</section>

<?php include 'includes/footer.php'; ?>