<?php
include('config.php');
include('header.php');

$sql = file_get_contents('sql/getAnimals.sql');
$statement = $database->prepare($sql);
$statement->execute();
$animals = $statement->fetchAll(PDO::FETCH_ASSOC);

$sql = file_get_contents('sql/getGalImages.sql');
$statement = $database->prepare($sql);
$statement->execute();
$gallery = $statement->fetchAll(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$imgurl = post('imgurl'); 
	
	$sql = file_get_contents('sql/addImage.sql');
	$params = array(
		'imgurl' => $imgurl
		);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	
	header('location: gallery.php');
}
?>
</div>
<div id="page">
<h1>Gallery</h1>
<h2>Pictures from Animal's Main Page</h2>
<?php foreach($animals as $array => $animal) : ?>
<a href="<?php echo $animal['animalpicture'] ?>"><img src="<?php echo $animal['animalpicture'] ?>" alt ="<?php echo $animal['animalname'] ?>" width="400"></a>
<?php endforeach; ?><br /><br />
<h2>Gallery-Exclusive Pictures</h2>
<?php foreach($gallery as $array => $img) : ?>
<a href="<?php echo $img['imageurl'] ?>"><img src="<?php echo $img['imageurl'] ?>" alt ="<?php echo $img['imageurl'] ?>" width="400"></a>
<?php endforeach; ?><br /><br />
<form method = "POST">
<h3>Add a new image to the gallery</h3>
<textarea name="imgurl" rows="2" cols="40" >Insert an image url</textarea><br />
<input type="submit" value="submit">
</form>
</div>
</body>
</html>
