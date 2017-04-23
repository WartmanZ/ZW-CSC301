<?php 
Class User {
	protected $userID;
	protected $name;
	protected $database;
	
function __construct($userID, $database){
	$this->userID = $userID;
	$this->database = $database;

	$sql = file_get_contents('sql/getUser.sql');
	$params = array(
		'userid' => $this->userID
		);
		$statement = $this->database->prepare($sql);
		$statement->execute($params);
		$users = $statement->fetchALL(PDO::FETCH_ASSOC);
		$user = $users[0]; 
	$this->userID = $user['userid'];
	$this->name = $user['name'];
}

function get($key){
	return $this->$key;
}
}
?>