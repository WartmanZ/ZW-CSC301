<?php
include('config.php');
include('header.php');

$sql = file_get_contents('sql/getUserAnimals.sql');
$params = array(
	'userid' => $user->get('userID')
	);
$statement = $database->prepare($sql);
$statement->execute($params);
$animals = $statement->fetchAll(PDO::FETCH_ASSOC);
?>

<div id="page">
<h1><?php echo $user->get('name'); ?></h1>
<a href="user.php?action=edit">Edit Your Information</a><br /><br />
<h2>Animals You've Added</h2>
<?php foreach($animals as $array => $animal) : ?>
<p><a href="animal.php?animalid=<?php echo $animal['animalid'] ?>"><?php echo $animal['animalname']; ?></a></p>
<?php endforeach; ?><br /><br />
<a href="confirm.php">Delete my Account</a>
</div>
</body>
</html>
