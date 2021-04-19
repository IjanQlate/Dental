<?php 
$db = mysqli_connect("localhost","root","","dental");


if (mysqli_connect_errno()){
	echo "error database connection : " . mysqli_connect_error();
}

?>