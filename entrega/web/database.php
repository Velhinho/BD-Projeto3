<?php
function make_db() {
    $host = "db.tecnico.ulisboa.pt";
    $user = "ist190718";
    $password = "akai";
    $dbname = $user;
    $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $db;
}

function print_query(PDO $db, array $columns, $table_name) {
    $query = "SELECT ";
    $query .= $columns[0];

    for ($i = 1; $i < count($columns); $i++) {
        $query .= ", " . $columns[$i];
    }
    $query .= " FROM " . $table_name;

    $result = $db->prepare($query);
    $result->execute();

    foreach ($result as $row) {
        echo ("<tr>\n");
        foreach ($columns as $column) {
            echo ("<td>" . $row[$column] . "</td>");
        }
        echo ("</tr>\n");
    }
}
?>
