<?php

function search($find, $database) {
	$find = '%' . $find . '%';
	$sql = file_get_contents('sql/searchAnimals.sql');
	$params = array(
		'find' => $find
		);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	$animals = $statement->fetchAll(PDO::FETCH_ASSOC);
	return $animals;
	}
	
function get($key) {
	if(isset($_GET[$key])) {
		return $_GET[$key];
		}
	else {return '';}}
	
function post($key) {
	if(isset($_POST[$key])) {
		return $_POST[$key];
		}
	else {return '';}}	
?>