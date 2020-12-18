<?php
header('Content-Type: text/html; charset=utf-8');

// Load XML file
$xml = new DOMDocument;
$xml->load('prenom_naissance.xml');
// Load XSL file
$xsl = new DOMDocument;
$xsl->load('menu_prenom.xsl');
// Configure the transformer
$proc = new XSLTProcessor;
// Attach the xsl rules

$proc->importStyleSheet($xsl);

echo $proc->transformToXML($xml);


if (isset($_POST["prenom"])) //si =true alors, c'est que l'on a posté le formulaire (submit) et on peut faire la transformation
{
    $annee = $_POST["annee"];
    $genre = $_POST["genre"];
    $prenom = $_POST["prenom"];
    $region = $_POST["region"];
    $occurence_tri = $_POST["occurence_tri"];
    $region_tri = $_POST["region_tri"];

    // Load XML file
    $xml = new DOMDocument;
    $xml->load('prenom_naissance.xml');

    // Load XSL file
    $xsl = new DOMDocument;
    $xsl->load('prenom_naissance.xsl');

    //Init $classe
    //$classe="1BI2";

    // Configure the transformer

    $proc = new XSLTProcessor;

    // Attach the xsl rules

    $proc->importStyleSheet($xsl);

    // Passer un paramètre

    $proc->setParameter('', 'genre', $genre);
    $proc->setParameter('', 'annee', $annee);
    $proc->setParameter('', 'region', $region);
    $proc->setParameter('', 'prenom', $prenom);
    $proc->setParameter('', 'occurence_tri', $occurence_tri);
    $proc->setParameter('', 'region_tri', $region_tri);

    echo $proc->transformToXML($xml);  // permet d'afficher la transformation XML-XSL -  donc c'est du HTML qui est envoyé au navigateur, vous pouvez le constater en visualisant le code source visible dans le navigateur (on ne voit plus le xml comme dans les exercices précédents
}
?>
