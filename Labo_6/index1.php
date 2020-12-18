<form method="POST">
    <input type="text" name="classe"/>
    <input type="submit" value="filtrer"/>
</form>
<?php
header('Content-Type: text/html; charset=utf-8');
// $classe="1BS2"; remplaçons l'affectation de la variable par un formulaire(voir en bas du fichier) (indiquer la method get/post) avec une zone de texte (name indispensable)


if (isset($_POST["classe"])) //si =true alors, c'est que l'on a posté le formulaire (submit) et on peut faire la transformation
{$classe=$_POST["classe"];
    // Load XML file
    $xml = new DOMDocument;
    $xml->load('eco.xml');

    // Load XSL file
    $xsl = new DOMDocument;
    $xsl->load('eco1.xsl');

    //Init $classe
    //$classe="1BI2";

    // Configure the transformer

    $proc = new XSLTProcessor;

    // Attach the xsl rules

    $proc->importStyleSheet($xsl);

    // Passer un paramètre

    $proc->setParameter('', 'cl', $classe);

    echo $proc->transformToXML($xml);  // permet d'afficher la transformation XML-XSL -  donc c'est du HTML qui est envoyé au navigateur, vous pouvez le constater en visualisant le code source visible dans le navigateur (on ne voit plus le xml comme dans les exercices précédents


}
?>



 

