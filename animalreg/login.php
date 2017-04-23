<?php
include('config.php');
include('header.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$username = post('username');
	$password = post('password');

	$sql = file_get_contents('sql/login.sql');
	$params = array(
		'username' => $username,
		'password' => $password
	);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	$users = $statement->fetchAll(PDO::FETCH_ASSOC);
	
	if (!empty($users)) {
		$user = $users[0];
		$_SESSION['userID'] = $user['userid'];
	}
	header('location: index.php');
}
?>

</div>
<!--<div id="page-wrapper">-->
<div id="page">
  <h1>Login</h1>
  <form method = "POST">
	<input type="text" name="username" placeholder="Username" /><br />
	<input type="password" name="password" placeholder="Password" /><br />
	<input type="submit" value="Log In" /><br /><br />
	Not a user? <a href="user.php?action=add">Sign up!</a>
<!--	<input type="button" onclick="adduser.php" value="Sign Up"> -->
  </form>
</div>
<!--</div>-->
</body>
</html>