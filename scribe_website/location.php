<?php 
	require_once('includes/database-connection.php');

	// Reading POST request
	$loc_ID;
	$role;
	
	if($_SERVER["REQUEST_METHOD"] == "POST"){
		$msg = explode('&', $_POST['msg']);
		$loc_ID = $msg[0];
		$role = $msg[1];

		if(count($msg) == 3){
			// Check if back command
			switch($msg[2]){
				case 'back':
					$sql = "SELECT container
							FROM Contains
							WHERE Contains.containee = :ID;";
					$result = pdo($pdo, $sql, [':ID' => $loc_ID])->fetch();

					if($result){
						$loc_ID = $result['container'];
					} else {
						// Current location is root world
						header('Location: dashboard.php');
					}
				break;
			 	case 'propBack':
					$sql = "SELECT isIn
							FROM Props
							WHERE Props.ID = :ID;";
					$result = pdo($pdo, $sql, [':ID' => $loc_ID])->fetch();
					$loc_ID = $result['isIn'];
				break;
				case 'charBack':
					$sql = "SELECT isAt
							FROM Characters
							WHERE Characters.ID = :ID;";
					$result = pdo($pdo, $sql, [':ID' => $loc_ID])->fetch();
					$loc_ID = $result['isAt'];
				break;
			}

			// Check if msg is sent with extra 'edit' string
			if($msg[2] == 'edit'){
				switch($role){
					case 'gm':
						$sql = "UPDATE Locations
								SET Locations.name = :locName, Locations.description = :descr, Locations.gmNotes = :gmNotes
								WHERE Locations.ID = :ID;";
						pdo($pdo, $sql, [':locName' => $_POST['name'], ':descr' => $_POST['description'], ':gmNotes' => $_POST['gmNotes'], ':ID' => $loc_ID]);
					break;
					case 'player':
						$sql = "UPDATE Locations
								SET Locations.partyNotes = :partyNotes
								WHERE Locations.ID = :ID;";
						pdo($pdo, $sql, [':partyNotes' => $_POST['partyNotes'], ':ID' => $loc_ID]);
					break;
				}
			}
		}
	}

    /* TO-DO: Include header.php
              Hint: header.php is inside the includes folder and already connects to the database
    */

	include("./includes/header.php");

    /*
	 * Retrieve toy information from the database based on the toy ID.
	 * 
	 * @param PDO $pdo       An instance of the PDO class.
	 * @param string $id     The ID of the toy to retrieve.
	 * @return array|null    An associative array containing the toy information, or null if no toy is found.
	 */
	function get_nested_entries(PDO $pdo, $loc_ID) {
		$location = pdo($pdo, "SELECT * FROM Locations WHERE ID = :locID", [":locID" => $loc_ID])->fetch();
		
		$characters = pdo($pdo, "SELECT * FROM Characters WHERE isAt = :locID", [":locID" => $loc_ID])->fetchAll();
		
		$props = pdo($pdo, "SELECT * FROM Props WHERE isIn = :locID", [":locID" => $loc_ID])->fetchAll();

		$sublocations = pdo($pdo, "SELECT Locations.* FROM Locations 
									JOIN Contains ON Contains.containee = Locations.ID
									WHERE Contains.container = :locID", [":locID" => $loc_ID])->fetchAll();

		return [
			"location" => $location, 
			"characters" => $characters, 
			"props" => $props,
			"sublocations" => $sublocations
		];
	}

	$items = get_nested_entries($pdo, $loc_ID);                          // Retrieve info about toy with ID '0001' from the database using provided PDO connection
?>

<div class="location-header">
	<!-- Display location information -->
	 <form method="POST" action="location.php">
		<button type="submit" name="msg" value="<?=$loc_ID?>&<?=$role?>&back">Back</button>
		<?php if($role == "player"){ ?>
			<h1><?= $items["location"]["name"] ?></h1>	
			<p><?= $items["location"]["description"] ?></p>
			<label for="partyNotes">Party's Notes:</label>
			<input type="text" value="<?=$items["location"]["partyNotes"]?>" id="partyNotes" name="partyNotes">
		<?php } else { ?>
				<label for="name">Name:</label>
				<input type="text" value="<?=$items["location"]["name"]?>" id="name" name="name">
				<label for="description">Description:</label>
				<input type="text" value="<?=$items["location"]["description"]?>" id="description" name="description">
				<label for="gmNotes">Private Notes:</label>
				<input type="text" value="<?=$items["location"]["gmNotes"]?>" id="gmNotes" name="gmNotes">
				<label for="partyNotes">Party's Notes:</label>
				<p type="text" id="partyNotes"><?=$items["location"]["partyNotes"]?></p>
		<?php } ?>
		<button type="submit" name="msg" value="<?=$loc_ID?>&<?=$role?>&edit">Save Changes</button>
	</form>
</div>

<section class="toy-catalog">
	<!-- Displays all sublocation cards -->
	<h2 class="section-label">Locations</h2>
	<?php foreach ($items["sublocations"] as $sub) { ?>
		<form class="toy-card" method="POST" action="location.php">
			<button type="submit" name="msg" value="<?=$sub["ID"]?>&<?=$role?>">
				<img src="<?= $sub["img_src"] ?>" alt="<?= $sub["name"] ?>">
			</button>
			<h2><?= $sub["name"] ?></h2>
			<p><?= $sub["description"] ?></p>
		</form>
	<?php } ?>

	<!-- Displays all character cards -->
	<h2 class="section-label">Characters</h2>
	<?php foreach ($items["characters"] as $char) { ?>
		<form class="toy-card" method="POST" action="char.php">
			<button type="submit" name="msg" value="<?=$char["ID"]?>&<?=$role?>">
				<img src="<?= $char["img_src"] ?>" alt="<?= $char["name"] ?>">
			</button>
			<h2><?= $char["name"] ?></h2>
			<p><?= $char["description"] ?></p>
		</form>
	<?php } ?>

	<!-- Displays all prop cards -->
	<h2 class="section-label">Props</h2>
	<?php foreach ($items["props"] as $prop) { ?>
		<form class="toy-card" method="POST" action="prop.php">
			<button type="submit" name="msg" value="<?=$prop["ID"]?>&<?=$role?>">
				<img src="<?= $prop["img_src"] ?>" alt="<?= $prop["name"] ?>">
			</button>
			<h2><?= $prop["name"] ?></h2>
			<p><?= $prop["description"] ?></p>
		</form>
	<?php } ?>

</section>

<?php include 'includes/footer.php'; ?>
