<h2>Écrivez une quantité et choisissez une méthode de tri</h2>

<form method="POST">
    <input type="text" name="qte">
    <select name="algo">
        <option value="Réf_produit">Référence du produit</option>
        <option value="Nom_du_produit">Nom du produit</option>
        <option value="N_fournisseur">Numéro du fournisseur</option>
        <option value="Code_catégorie">Code catégorie</option>
        <option value="Quantité_par_unité">Quantité par unité</option>
        <option value="Prix_unitaire">Prix unitaire</option>
        <option value="Unités_en_stock">Unités en stock</option>
        <option value="Unités_commandées">Unités commandées</option>
        <option value="Niveau_de_réapprovisionnement">Niveau de réapprovisionnement</option>
        <option value="Indisponible">Indisponible</option>
    </select>
    <input type="submit" value="Filtrer">
</form>
<?php
header( 'Content-Type: text/html; charset=utf-8' );

if ( isset( $_POST[ "qte" ] ) ) //si =true alors, c'est que l'on a posté le formulaire (submit) et on peut faire la transformation
{
    $qte = $_POST[ "qte" ];
    $algo = $_POST[ "algo" ];

    // Load XML file
    $xml = new DOMDocument;
    $xml->load( 'Produits.xml' );

    // Load XSL file
    $xsl = new DOMDocument;
    $xsl->load( 'Produits.xsl' );

    //Init $classe
    //$classe="1BI2";

    // Configure the transformer

    $proc = new XSLTProcessor;

    // Attach the xsl rules

    $proc->importStyleSheet( $xsl );

    // Passer un paramètre

    $proc->setParameter( '', 'qte', $qte );
    $proc->setParameter( '', 'algo', $algo );

    echo $proc->transformToXML( $xml );  // permet d'afficher la transformation XML-XSL -  donc c'est du HTML qui est envoyé au navigateur, vous pouvez le constater en visualisant le code source visible dans le navigateur (on ne voit plus le xml comme dans les exercices précédents
}

