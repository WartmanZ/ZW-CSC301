<?php
include('config.php');
include('header.php');

$action = get('action');

if ($action == 'edit'){
	$userid = $user->get('userID');
}

if (!empty($userid)) {
	$sql = file_get_contents('sql/getUserFromID.sql');
	$params = array(
		'userid' => $userid
		);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	$users = $statement->fetchALL(PDO::FETCH_ASSOC);
	$user = $users[0];
}
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$name = post('name');
	$username = post('username');
	$password = post('password');
	
	if ($action == 'add'){
	$sql = file_get_contents('sql/addUser.sql');
	$params = array(
		'name' => $name,
		'username' => $username,
		'password' => $password
	);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	
	header('location: login.php');
	}
	
	elseif ($action == 'edit'){
	$sql = file_get_contents('sql/editUser.sql');
	$params = array(
		'name' => $name,
		'username' => $username,
		'password' => $password,
		'userid' => $userid
		);
	$statement = $database->prepare($sql);
	$statement->execute($params);
	
	header('location: profile.php');
	}
}
?>

<div id="page">
  <?php if ($action == 'add') : ?>
  <h1>Sign Up</h1>
  <?php else : ?>
  <h1>Edit User</h1>
  <?php endif; ?>
  <form method = "POST">
    <?php if ($action == 'add') : ?>
	<input type="text" name="name" placeholder="Full Name" /><br />
	<?php else : ?>
	<input type="hidden" name="userid" value="<?php echo $user['userid']; ?>" />
	<input type="text" name="name" value="<?php echo $user['name']; ?>" /><br />
	<?php endif; ?>
	<?php if ($action == 'add') : ?>
	<input type="text" name="username" placeholder="Username" /><br />
	<?php else : ?>
		<input type="text" name="username" value="<?php echo $user['username']; ?>"/><br />
	<?php endif; ?>
	<?php if ($action == 'add') : ?>
	<input type="password" name="password" placeholder="Password" /><br />
	<?php else : ?>
	<input type="password" name="password" value="<?php echo $user['password'] ?>" /><br />
	<?php endif; ?>
	<?php if ($action == 'add') : ?>
	<input type="submit" value="Sign Up" />
	<?php elseif ($action == 'edit') : ?>
	<input type="submit" value="Confirm" />
	<?php endif; ?>
<!--	<input type="button" onclick="adduser.php" value="Sign Up"> -->
  </form>
</div>
</body>
</html>