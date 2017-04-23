<?php
include('config.php');
include('header.php');

$animalid = get('animalid');

$sql = file_get_contents('sql/getAnimalFromID.sql');
$params = array(
	'animalid' => $animalid
	);
$statement = $database->prepare($sql);
$statement->execute($params);
$animals = $statement->fetchAll(PDO::FETCH_ASSOC);
$animal = $animals[0];
?>

<div id="page">
<h1><?php echo $animal['animalname'] ?></h1>
<h2><?php echo $animal['level'] ?></h2>
<h3><a href="form.php?action=edit&animalid=<?php echo $animal['animalid'] ?>">Edit Information</a></h3>
<IMG src="<?php echo $animal['animalpicture'] ?>" width="1200"><br />
<?php echo $animal['comment'] ?><br /><br />
<a href="database.php">Return to animal database</a>
</div>
</body>
</html>