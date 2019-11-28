<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Third Exercise</title>
</head>

<body>
    <table border=\"0\" cellspacing=\"5\>
        <tr>
            <th>User Emails</th>
        </tr>

        <?php
        include "./database.php";

        try {
            $db = make_db();
            $query = "SELECT user_email FROM user_table";
            $result = $db->prepare($query);
            $result->execute();

            foreach ($result as $row) {
                echo ("<tr>\n");
                echo ("<td>" . $row["user_email"] . "</td>\n");
                echo ("</td>\n");
            }

            $db = null;
        } catch (PDOException $exp) {
            echo ("<p>ERROR: {$exp->getMessage()}</p>");
        }

        ?>
    </table>
</body>

</html>
