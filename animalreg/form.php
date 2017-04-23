<?php
include('config.php');
include('header.php');

$action = get('action');

if ($action == 'edit'){
$animalid = get('animalid');
}

if(!empty($animalid)) {
	$sql = file_get_contents('sql/getAnimalFromID.sql');
	$params = array(
		'animalid' => $animalid
		);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	$animals = $statement->fetchAll(PDO::FETCH_ASSOC);
	$animal = $animals[0];
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$animalname = post('animalname');
	$animalpicture = post('animalpicture');
	$dangerid = post('dangerid');
	$comment = post('comment');
	
	if($action == 'edit'){
	$animalid = post('animalid');
	
	$sql = file_get_contents('sql/editAnimal.sql');
	$params = array(
		'animalname' => $animalname,
		'animalpicture' => $animalpicture,
		'animalid' => $animalid,
		'comment' => $comment
	);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	
	$sql = file_get_contents('sql/editAnimalDanger.sql');
	$params = array(
		'dangerid' => $dangerid,
		'animalid' => $animalid,
		'comment' => $comment
	);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	
	header('location: animal.php?animalid='.$animal['animalid']);
	}
	
	elseif ($action == 'add'){
	$sql = file_get_contents('sql/addAnimal.sql');
	$params = array(
		'animalname' => $animalname,
		'animalpicture' => $animalpicture,
	);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	
	$sql = file_get_contents('sql/getAnimalFromName.sql');
	$params = array(
		'animalname' => $animalname,
	);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	$animals = $statement->fetchAll(PDO::FETCH_ASSOC);
	$animal = $animals[0];
	$animalid = $animal['animalid'];
	
	$sql = file_get_contents('sql/addAnimalDanger.sql');
	$params = array(
		'animalid' => $animalid,
		'dangerid' => $dangerid
	);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	
	$sql = file_get_contents('sql/addUserAnimal.sql');
	$params = array(
		'animalid' => $animalid,
		'userid' => $user->get('userID')
	);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	
	header('location: database.php');
	}
}
?>

<div class="page">
<form action="" method="POST">
	<?php if ($action == 'add') : ?>
	<h1> Add New Animal </h1>
	<?php else : ?>
	<h1> Edit Animal Information: <?php echo $animal['animalname'] ?> </h1>
	<?php endif; ?>
	<?php if ($action == 'edit') : ?>
	<input type="hidden" name="animalid" value="<?php echo $animal['animalid'] ?>" />
	<?php else : ?>
	<?php endif; ?>
	<label>Animal Name:</label><br />
	<?php if($action == 'add') : ?>
		<input type="text" name="animalname" class="textbox" />
	<?php else : ?>
		<input type="text" name="animalname" class="textbox" value="<?php echo $animal['animalname']; ?>" />
	<?php endif; ?><br /><br />
	<label>Animal Picture Link (Optional):</label><br />
	<?php if($action == 'add') : ?>
		<textarea name="animalpicture" rows="2" cols="50">URL...</textarea>
	<?php else : ?>
		<textarea name="animalpicture" rows="2" cols="50"><?php echo $animal['animalpicture']; ?></textarea>
	<?php endif; ?><br /><br />
	<label>Danger Level (1-5): <br />
	1: Critically Endangered | 2: Endangered | 3: Vulnerable | 4: Near Threatened | 5: Least Concern</label><br />
	<?php if($action == 'add') : ?>
		<input type="number" name="dangerid" class="textbox" />
	<?php else : ?>
		<input type="number" name="dangerid" class="textbox" value="<?php echo $animal['dangerid']; ?>" />
	<?php endif; ?><br /><br />
	<label>Extra Information or Comment(s)</label><br />
	<?php if ($action == 'add') : ?>
		<textarea name ="comment" rows = "4" cols = "50">Put any extra information or comment(s) on this animal here.</textarea>
	<?php else : ?>
		<textarea name ="comment" rows = "4" cols = "50"><?php echo $animal['comment'] ?></textarea>
	<?php endif; ?>
	<div class="form-element">
		<input type="submit" class="button" value="Submit" />&nbsp;
		<input type="reset" class="button" />
	</div>
</div>