<?php
header('Content-Type: text/html; charset=utf-8');
//Init $classe
$classe="1BI2";

// Load XML file
$xml = new DOMDocument;
$xml->load('eco.xml');

// Load XSL file
$xsl = new DOMDocument;
$xsl->load('eco1.xsl');

// Configure the transformer
$proc = new XSLTProcessor;

// Attach the xsl rules
$proc->importStyleSheet($xsl);

// Passer un paramètre 
$proc->setParameter('', 'cl', $classe);  //cl est le nom du paramètre dans le fichier xsl , la valeur de $classe sera affectée au paramètre cl;

echo $proc->transformToXML($xml); // echo permet de transférer du serveur Web vers le client Web et donc permet d'afficher le résultat dans le navigateur Web

?>
