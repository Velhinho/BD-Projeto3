<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>First Exercise</title>
</head>

<body>
    <table border=\"0\" cellspacing=\"5\>
        <tr>
            <th>ID</th>
            <th>Description</th>
            <th>Latitude</th>
            <th>Longitude</th>
            <th>Location Name</th>
        </tr>

        <?php
        include "../database.php";

        $db = make_db();
        $columns = array("id", "description",
            "location_name", "latitude", "longitude");
        $table_name = "item";

        $insert = "INSERT INTO $table_name VALUES ";
        $insert .= "(:id, :description, :location_name, :latitude, :longitude)";

        try {
            $db->beginTransaction();
            $stmt = $db->prepare($insert);

            $stmt->bindParam(":id", $_POST["id"], PDO::PARAM_INT);
            $stmt->bindParam(":description", $_POST["description"],
                PDO::PARAM_STR, strlen($_POST["description"]));

            $stmt->bindParam(":location_name", $_POST["location_name"], 
                PDO::PARAM_STR, strlen($_POST["location_name"]));
            
            $stmt->bindParam(":latitude", $_POST["latitude"], PDO::PARAM_INT);
            $stmt->bindParam(":longitude", $_POST["longitude"], PDO::PARAM_INT);
            $stmt->execute();
            $db->commit();

            print_query($db, $columns, $table_name);
        } 
        catch (PDOException $exp) {
            $db->rollBack();
            echo ("<p>ERROR: {$exp->getMessage()}</p>");
        }
        ?>
    </table>
</body>

</html>
