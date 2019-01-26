<?php
define('DB_SERVER','localhost');
define('DB_USERNAME','root');
define('DB_PASSWORD', 'root123');
define('DB_NAME', 'eventmanagement');



$mysqllink=mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_NAME) or die("Unable to connect");

//testing --echo "Goof";


?>
