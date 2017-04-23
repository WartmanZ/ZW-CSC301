<?php

include('functions.php');

$user = 'wartmanz1';
$password = 'nY7JyQsg';

$database = new PDO('mysql:host=csweb.hh.nku.edu;dbname=db_spring17_wartmanz1', $user, $password);

function my_autoloader($class){
	include '/classes/class.' . $class . '.php';
}
spl_autoload_register('my_autoloader');

session_start();

$current_url = basename($_SERVER['REQUEST_URI']);

if (!isset($_SESSION["userID"]) && (($current_url != 'login.php') && ($current_url != 'user.php?action=add'))){
	header("Location: login.php");
}

elseif(isset($_SESSION["userID"])){
	$user = new User($_SESSION["userID"], $database);
}
?>
