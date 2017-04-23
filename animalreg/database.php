<?php
include('config.php');
include('header.php');

$find = get('search');
$animals = search($find, $database);
?>

</div>
<div id="page">
<h1>Animal Database</h1>
<h3><a href="form.php?action=add">Add a new animal</a></h3>
<form method ="GET">
	<input type="text" name="search" placeholder="Search Animals" />
<input type="submit" value="Search"/>
</form><br />
<?php foreach($animals as $array => $animal) : ?>
Name: <?php echo $animal['animalname'] ?><br />
Threat Level: <?php echo $animal['level'] ?><br />
<a href="animal.php?animalid=<?php echo $animal['animalid'] ?>">View Animal</a>&emsp;<a href="form.php?action=edit&animalid=<?php echo $animal['animalid'] ?>">Edit Information</a><br /><br />
<br />
<?php endforeach; ?>
</div>
</body>
</html>