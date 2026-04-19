<?php
    require_once('includes/database-connection.php');

    // Reading POST request
    $prop_ID;
	$role;
	
	if($_SERVER["REQUEST_METHOD"] == "POST"){
		$msg = explode('&', $_POST['msg']);
		$prop_ID = $msg[0];
		$role = $msg[1];

        // Check if msg is sent with extra 'edit' string
		if(count($msg) == 3 && $role == 'gm'){
			$sql =  "UPDATE Props
					SET Props.name = :propName, Props.description = :descr, Props.gmNotes = :gmNotes, Props.itemType = :itemType, Props.rarity = :rarity, Props.quantity = :quantity
					WHERE Props.ID = :ID;";
			pdo($pdo, $sql, [':propName' => $_POST['name'], ':descr' => $_POST['description'], ':gmNotes' => $_POST['gmNotes'], ':itemType' => $_POST['itemType'], ':rarity' => $_POST['rarity'], ':quantity' => $_POST['quantity'],':ID' => $prop_ID]);
		} elseif(count($msg) == 3 && $role == 'player'){
			$sql = "UPDATE Props
					SET Props.partyNotes = :partyNotes
					WHERE Props.ID = :ID;";
			pdo($pdo, $sql, [':partyNotes' => $_POST['partyNotes'], ':ID' => $prop_ID]);
		}
	}

    /* TO-DO: Include header.php
              Hint: header.php is inside the includes folder and already connects to the database
    */

    include("./includes/header.php");

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
    $item = get_prop_info($pdo, $prop_ID);

?>

<section class="toy-details-page container">
    <div class="toy-details-container">
        <div class="toy-image">

            <!-- TO-DO: Display the toy image and update the alt text to the toy name -->
            <img src="<?= $item["img_src"] ?>" alt="<?= $item["name"] ?>">

        </div>

        <!-- Back button -->
        <form method="POST" action="location.php">
            <button type="submit" name="msg" value="<?=$prop_ID?>&<?=$role?>&propBack">Back</button>
        </form>

        <form class="toy-details" method="POST" action="prop.php">
            <?php if($role == 'gm'){ ?>
                <label for="name">Name:</label>
				<input type="text" value="<?=$item["name"]?>" id="name" name="name">
                <label for="description">Description:</label>
				<input type="text" value="<?=$item["description"]?>" id="description" name="description">
                <label for="itemType">Type:</label>
				<input type="text" value="<?=$item["itemType"]?>" id="itemType" name="itemType">
                <label for="rarity">Rarity:</label>
				<input type="text" value="<?=$item["rarity"]?>" id="rarity" name="rarity">
                <label for="gmNotes">Private Notes:</label>
				<input type="text" value="<?=$item["gmNotes"]?>" id="gmNotes" name="gmNotes">
                <label for="partyNotes">Party's Notes:</label>
				<p type="text" id="partyNotes"><?=$item["partyNotes"]?></p>
                <label for="quantity">Quantity:</label>
				<input type="number" value="<?=$item["quantity"]?>" id="quantity" name="quantity">
            <?php } else { ?>
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

                <label for="partyNotes">Party's Notes:</label>
				<input type="text" value="<?=$item["partyNotes"]?>" id="partyNotes" name="partyNotes">
            <?php } ?>
            <button type="submit" name="msg" value="<?=$prop_ID?>&<?=$role?>&edit">Save Changes</button>
        </form>
    </div>
</section>

<?php include 'includes/footer.php'; ?>