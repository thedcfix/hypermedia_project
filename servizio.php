<?php 

	if(isset($_GET['id'])) {
		$id = $_GET['id'];
		$conn = mysqli_connect("localhost", "root", "");
    	mysqli_select_db($conn, "hyp_db");
    	$stringa = "select * from servizi where id = '$id'";
    	$ris = $conn->query($stringa);
    	$row = mysqli_fetch_array($ris);
        $id = $row['id'];
        $imma = $row["img"];

    	$doc = new DOMDocument();
    	libxml_use_internal_errors(true);
    	$doc->loadHTMLFile("servizio_template.html");
    	$frammento =$doc->createDocumentFragment();



        //$bread = $doc->getElementById('immagine');
       // $frammento->appendXML('<a href="products.html?type='.$row['tipologia'].'">'.$row['tipologia'].'</a>');
        //$bread->appendChild($frammento);

    	$img = $doc->getElementById('immagine');
    	$frammento->appendXML('<img src="'.$row["img"].'"></img><br/>');
    	$img->appendChild($frammento);

		$offerta = $doc->getElementById("offerta");
    	$frammento->appendXML("<br/>".$row["offerta"]."<br/><br/>");
    	$offerta->appendChild($frammento);

		$costi = $doc->getElementById("costi");
    	$frammento->appendXML("<br/>".$row["dettagli_costi"]."<br/><br/>");
    	$costi->appendChild($frammento);

		// prendo tutti i device compatibili col servizio
		$prodotti = "select prodotti.id from servizi join prodotti_servizi on servizi.id = prodotti_servizi.id_servizio join prodotti on prodotti_servizi.id_prodotto = prodotti.id where servizi.id = $id";
		$res = $conn->query($prodotti);

		// qui bisogna inserire le cose nel carousel
        
    	echo $doc->saveHTML();
    	libxml_clear_errors();
	}
	else{
		echo "error";
	}

?>