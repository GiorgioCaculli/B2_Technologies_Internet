<?php
    $connection = new mysqli('localhost', 'la196672', 'mdpLA196672', 'CaculliGiorgioJuin2021');
    if($connection->connect_error) die("La connexion à la base de données à échoué: " . $connection->connect_error);

    $connection->set_charset("utf8mb4");

    $query = "SELECT * FROM question";
    $result = $connection->query($query);
    if(!$result)
    {
        echo 'La query: ' . $query . ' a échoué';
    }
    else
    {
        $rows = $result->num_rows;
        if(isset($_GET['export_json']) && $_GET['export_json'] == 1)
        {
            $res = '{"question": [';
        }
        for($i = 0; $i < $rows; $i++)
        {
            $row = $result->fetch_array(MYSQLI_ASSOC);
            if(isset($_GET['export_json']) && $_GET['export_json'] == 1)
            {
                $res .= json_encode($row, JSON_PRETTY_PRINT);
                if($i < $rows - 1)
                {
                    $res .= ',';
                }
                continue;
            }
            echo $row['texte_question'] . "<br>".
                "<form action='' method='GET'>" .
                "<input type='radio' name='rep' value='" . $row['texte_reponse_1'] . "'>" . $row['texte_reponse_1'] . "</input> <br>".
                "<input type='radio' name='rep' value='" . $row['texte_reponse_2'] . "'>" . $row['texte_reponse_2'] . "</input> <br>".
                "<input type='radio' name='rep' value='" . $row['texte_reponse_3'] . "'>" . $row['texte_reponse_3'] . "</input> <br>".
                "<input type='submit' value='Répondre'>" .
                "</form>";
        }
        if(isset($_GET['export_json']) && $_GET['export_json'] == 1)
        {
            $res .= ']}';
            $fp = fopen('questions.json', 'w');
            fwrite($fp, $res);
            fclose($fp);
            header('Location: index.html');
            die();
        }
    }


    $connection->close();
?>