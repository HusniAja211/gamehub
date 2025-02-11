<?php
$servername = "localhost";
$username = "root";
$pw = "";
$dbname= "gamehub1";

$conn = new mysqli($servername, $username, $pw, $dbname);

if(!$conn){
    die("Connection failed: " . mysqli_connect_error());
} 
// else{
//     echo "Koneksi Berhasil";
// }