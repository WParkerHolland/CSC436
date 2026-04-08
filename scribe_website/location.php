<?php 

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

	$loc_ID = $_GET['locnum'];
	$items = get_nested_entries($pdo, $loc_ID);                          // Retrieve info about toy with ID '0001' from the database using provided PDO connection
?>

<div class="location-header">
	<!-- Display location information -->
	<h1><?= $items["location"]["name"] ?></h1>	
	<p><?= $items["location"]["description"] ?></p>
</div>

<section class="toy-catalog">

	<!-- Displays all sublocation cards -->
	<h2 class="section-label">Locations</h2>
	<?php foreach ($items["sublocations"] as $sub) { ?>
		<div class="toy-card">
			<a href="location.php?locnum=<?= $sub["ID"] ?>">
				<img src="<?= $sub["img_src"] ?>" alt="<?= $sub["name"] ?>">
			</a>
			<h2><?= $sub["name"] ?></h2>
			<p><?= $sub["description"] ?></p>
		</div>
	<?php } ?>

	<!-- Displays all character cards -->
	<h2 class="section-label">Characters</h2>
	<?php foreach ($items["characters"] as $char) { ?>
		<div class="toy-card">
			<a href="char.php?charnum=<?= $char["ID"] ?>">
				<img src="<?= $char["img_src"] ?>" alt="<?= $char["name"] ?>">
			</a>
			<h2><?= $char["name"] ?></h2>
			<p><?= $char["description"] ?></p>
		</div>
	<?php } ?>

	<!-- Displays all prop cards -->
	<h2 class="section-label">Props</h2>
	<?php foreach ($items["props"] as $prop) { ?>
		<div class="toy-card">
			<a href="prop.php?propnum=<?= $prop["ID"] ?>">
				<img src="<?= $prop["img_src"] ?>" alt="<?= $prop["name"] ?>">
			</a>
			<h2><?= $prop["name"] ?></h2>
			<p><?= $prop["description"] ?></p>
		</div>
	<?php } ?>

</section>

<?php include 'includes/footer.php'; ?>
