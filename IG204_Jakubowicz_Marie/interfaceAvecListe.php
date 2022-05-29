

<?php
header('Content-Type: text/html; charset=utf-8');


// Load XML file
$xml = new DOMDocument;
$xml->load('carburants.XML');
// Load XSL file
$xsl = new DOMDocument;
$xsl->load('listeDep.xsl');
// Configure the transformer
$proc = new XSLTProcessor;
// Attach the xsl rules

$proc->importStyleSheet($xsl);
echo $proc->transformToXML($xml);
    
// Load XSL file
$xsl1 = new DOMDocument;
$xsl1->load('listeVi.xsl');
// Configure the transformer
$proc = new XSLTProcessor;
// Attach the xsl rules

$proc->importStyleSheet($xsl1);
echo $proc->transformToXML($xml);
    
    
    

if (isset($_POST["departement"])) { //si =true alors, c'est que l'on a posté le formulaire (submit) et on peut faire la transformation
    $depa=$_POST["departement"];
    // Load XML file
    $xml = new DOMDocument;
    $xml->load('carburants.XML');	
    
    // Load XSL file
    $xsl = new DOMDocument;
    $xsl->load('carburant.xsl');



    // Configure the transformer

    $proc = new XSLTProcessor;

    // Attach the xsl rules

    $proc->importStyleSheet($xsl);

    // Passer un paramètre 

    $proc->setParameter('', 'dep', $depa);

    echo $proc->transformToXML($xml);  // permet d'afficher la transformation XML-XSL -  donc c'est du HTML qui est envoyé au navigateur, vous pouvez le constater en visualisant le code source visible dans le navigateur (on ne voit plus le xml comme dans les exercices précédents
    
    
}
if (isset($_POST["ville"])) { //si =true alors, c'est que l'on a posté le formulaire (submit) et on peut faire la transformation
    $vil=$_POST["ville"];
    // Load XML file
    $xml = new DOMDocument;
    $xml->load('carburants.XML');	
    
    // Load XSL file
    $xsl = new DOMDocument;
    $xsl->load('carburant.xsl');



    // Configure the transformer

    $proc = new XSLTProcessor;

    // Attach the xsl rules

    $proc->importStyleSheet($xsl);

    // Passer un paramètre 

    $proc->setParameter('', 'vi', $vil);

    echo $proc->transformToXML($xml);  // permet d'afficher la transformation XML-XSL -  donc c'est du HTML qui est envoyé au navigateur, vous pouvez le constater en visualisant le code source visible dans le navigateur (on ne voit plus le xml comme dans les exercices précédents
    
    
}
?>



 





 

