<?php
session_start();
include 'bridge.php';


if($query=mysqli_query($koneksi,"SELECT * from t_apms_user WHERE userid='".$_SESSION['userid']."' and status='1'"))
{
	$dt = mysqli_fetch_array($query);
	$inactive=0;

if($dt['status']=='1'){
		$sql=mysqli_query($koneksi,"UPDATE t_apms_user SET status = '$inactive' WHERE userid='".$_SESSION['userid']."'");
	}else{}

	session_destroy();
	header("location:login.php");
}else{
	header("location:login.php");
	session_destroy();
}
?>