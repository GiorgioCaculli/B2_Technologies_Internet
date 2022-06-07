<?php
    $connection = new mysqli('localhost', 'la196672', 'mdpLA196672', 'CaculliGiorgioJuin2021');
    if($connection->connect_error) die("La connexion à la base de données à échoué: " . $connection->connect_error);

    $connection->set_charset("utf8mb4");

    if(isset($_GET['fill_panneau']) && $_GET['fill_panneau'] == 1)
    {
        $open = fopen('code.txt', 'r');
        while(!feof($open))
        {
            $panneau = fgets($open);
            str_replace(array("\n", "\r"), "", $panneau);
            $query = "INSERT INTO panneau (texte_panneau, photo_panneau) VALUES ('$panneau', 'Panneaux/$panneau')";
            $result = $connection->query($query);
            if(!$result) die('La query: ' . $query . ' a échoué');
        }
        fclose($open);
    }

    if(isset($_GET['panneau']) &&
        isset($_GET['reponse_1']) &&
        isset($_GET['reponse_2']) &&
        isset($_GET['reponse_3']))
    {
        $panneau = $_GET['panneau'];
        $rep1 = $_GET['reponse_1'];
        $rep2 = $_GET['reponse_2'];
        $rep3 = $_GET['reponse_3'];
        if($panneau != $rep1 && $panneau != $rep2 && $panneau != $rep3)
        {
            die('Pas de réponse possible à la question');
        }
        if(($panneau == $rep1 && $panneau == $rep2) ||
            ($panneau == $rep2 && $panneau == $rep3) ||
            ($panneau == $rep3 && $panneau == $rep1))
        {
            die('multiple réponses correctes');
        }
        $rep = "";
        if($panneau == $rep1)
        {
            $rep = $rep1;
        }
        if($panneau == $rep2)
        {
            $rep = $rep1;
        }
        if($panneau == $rep3)
        {
            $rep = $rep1;
        }
        str_replace(array("\n", "\r"), "", $panneau);
        $query = "INSERT INTO question (texte_question, id_panneau, texte_reponse_1, texte_reponse_2, texte_reponse_3) VALUES ".
            "('À quoi corréspond le panneau <img src=\"Panneaux/$panneau.gif\"></img>',".
            "(SELECT id_panneau FROM panneau WHERE texte_panneau = '$panneau')," .
            "'$rep1',".
            "'$rep2',".
            "'$rep3'".
            ")";
        $result = $connection->query($query);
        if(!$result) die('La query: ' . $query . ' a échoué');
    }

    $connection->close();
    header('Location: index.html');
    die();
?>