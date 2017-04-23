<?php
include('config.php');
include('header.php');
?>
</div>
<div id="page">
<h1>Welcome, <?php echo $user->get('name'); ?>, to the Endangered Animal Registry.</h1>
You can start here: <a href="database.php">Animal Database</a>
</div>
</body>
</html>
