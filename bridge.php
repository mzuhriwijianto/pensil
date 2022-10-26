<?php
// konfigurasi database

$host       =   "localhost";
$user       =   "zuhri";
$password   =   "pens";
$database   =   "db_pensil";

// perintah php untuk akses ke database
$koneksi = mysqli_connect($host, $user, $password, $database) or die("GAGAL KONEK");
?>
