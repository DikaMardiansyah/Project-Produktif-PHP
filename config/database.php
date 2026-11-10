<?php
$host = '127.0.0.1';
$user = 'root';
$pass = 'root';
$db   = 'penjualan';
$port = '3306';

$conn = mysqli_connect($host, $user, $pass, $db, $port);

if (!$conn) {
  die("Error: " . mysqli_connect_error());
}

echo "ok";
