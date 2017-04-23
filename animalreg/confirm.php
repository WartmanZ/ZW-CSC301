<?php
include('config.php');
include('header.php');
?>
</div>
<div id="page">
<h2>Are you sure you want to delete your account, <?php echo $user->get('name'); ?>?</h2>
<h3><a href="delete.php">Yes</a>&emsp;<a href="profile.php">No</a>