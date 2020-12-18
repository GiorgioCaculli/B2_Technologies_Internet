<?php
header('Content-Type: text/html; charset=utf-8');

// Load XML file
$xml = new DOMDocument;
$xml->load('Clients.xml');
// Load XSL file
$xsl = new DOMDocument;
$xsl->load('Clients_pre_post.xsl');
// Configure the transformer
$proc = new XSLTProcessor;
// Attach the xsl rules

$proc->importStyleSheet($xsl);

echo $proc->transformToXML($xml);


if (isset($_POST["pays"])) //si =true alors, c'est que l'on a posté le formulaire (submit) et on peut faire la transformation
{
    $pays = $_POST["pays"];
    $ville = $_POST["ville"];

    // Load XML file
    $xml = new DOMDocument;
    $xml->load('Clients.xml');

    // Load XSL file
    $xsl = new DOMDocument;
    $xsl->load('Clients.xsl');

    //Init $classe
    //$classe="1BI2";

    // Configure the transformer

    $proc = new XSLTProcessor;

    // Attach the xsl rules

    $proc->importStyleSheet($xsl);

    // Passer un paramètre

    $proc->setParameter('', 'pays', $pays);
    $proc->setParameter('', 'ville', $ville);

    echo $proc->transformToXML($xml);  // permet d'afficher la transformation XML-XSL -  donc c'est du HTML qui est envoyé au navigateur, vous pouvez le constater en visualisant le code source visible dans le navigateur (on ne voit plus le xml comme dans les exercices précédents
}
?>
