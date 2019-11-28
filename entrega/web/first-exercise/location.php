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
            <th>Latitude</th>
            <th>Longitude</th>
            <th>Location Name</th>
        </tr>

        <?php
        include "../database.php";

        $db = make_db();
        
        $columns = array("latitude", "longitude", "location_name");
        $table_name = "public_location";
        print_query($db, $columns, $table_name);

        ?>
    </table>
</body>

</html>
