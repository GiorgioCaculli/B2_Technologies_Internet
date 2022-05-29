<h2>Choisissez un departement et une ville</h2>

<?php
header('Content-Type: text/html; charset=utf-8');

$xml = new DOMDocument;
$xml->load('carburants.XML');
$xsl = new DOMDocument;
$xsl->load('menu_departement.xsl');
$proc = new XSLTProcessor;

$proc->importStyleSheet($xsl);

echo $proc->transformToXML($xml);

if( (isset($_POST["departement"]) || isset($_POST["ville"])))
{
    $departement = $_POST[ "departement" ];
    echo "<script type='text/javascript'>document.getElementById('departement').value = $departement</script>";

    $xml = new DOMDocument;
    $xml->load('carburants.XML');
    $xsl = new DOMDocument;
    $xsl->load('menu_ville.xsl');
    $proc = new XSLTProcessor;

    $proc->importStyleSheet($xsl);

    $proc->setParameter('', 'departement', $departement );

    echo $proc->transformToXML($xml);
    $ville = $_POST[ "ville" ];

    $xml = new DOMDocument;
    $xml->load( 'carburants.XML' );

    $xsl = new DOMDocument;
    $xsl->load( 'carburants.xsl' );

    $proc = new XSLTProcessor;

    $proc->importStyleSheet( $xsl );

    $proc->setParameter( '', 'departement', $departement );
    $proc->setParameter( '', 'ville', $ville );

    echo $proc->transformToXML( $xml );
}
?>
