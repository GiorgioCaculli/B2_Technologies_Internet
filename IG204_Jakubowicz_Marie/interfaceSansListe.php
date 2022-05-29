<!Doctype html>
<html>
    <head>
        <title>
            Formulaire Pompes
        </title>

    </head>

    <body>
        <form method="POST">
		
			<h2>Recherche par departements et villes :</h2>
            <p>
                Departement : <input type="text" name="departement" value="<?php echo $_POST['departement'] ?>"/>
            </p>
			<p>
                Ville : <input type="text" name="ville" value="<?php echo $_POST['ville'] ?>"/>
            </p>
            

            <p><input type="submit" value="rechercher"></p>
        </form>

        <?php

        $xml = new DOMDocument();
        $xml->load('carburants.XML');

        // Load XSL file
        $xsl = new DOMDocument();
        $xsl->load('carburant.xsl');

        $proc = new XSLTProcessor();

        // Attach the xsl rules
        $proc->importStyleSheet($xsl);

        if(isset($_POST["departement"])) {
            $proc->setParameter('', 'dep', $_POST["departement"]);
        }

        if(isset($_POST["ville"])) {
            $proc->setParameter('', 'vi', $_POST["ville"]);
        }


        echo $proc->transformToXML($xml);

        ?>

    </body>
</html>
