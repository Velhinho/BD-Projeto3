<?php
function make_db()
{
    $host = "db.tecnico.ulisboa.pt";
    $user = "ist190718";
    $password = "akai";
    $dbname = $user;
    $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $db;
}
?>
