<?php 
include('config.php');

$userid = $user->get('userID');

$sql = file_get_contents('sql/removeUser.sql');
$params = array(
	'userid' => $userid
	);
$statement = $database->prepare($sql);
$statement->execute($params);

unset($user);
unset($_SESSION['userID']);

header('location: goodbye.php');
?>