<?php 

	if(isset($_GET['id'])) {
		$id = $_GET['id'];
		$conn = mysqli_connect("localhost", "root", "");
    	mysqli_select_db($conn, "tim");
    	$stringa = "select * from Prodotti where Nome = '$id'";
    	$ris = $conn->query($stringa);
    	$row = mysqli_fetch_array($ris);

    	$doc = new DOMDocument();
    	libxml_use_internal_errors(true);
    	$doc->loadHTMLFile("device.html");
    	$frammento =$doc->createDocumentFragment();

    	$nome_dispositivo = $doc->getElementById('nome_dispositivo');
    	$frammento->appendXML($row['Nome']);
    	$nome_dispositivo->appendChild($frammento);

        $prezzo_dispositivo = $doc->getElementById('prezzo');
        $frammento->appendXML($row['Prezzo']);
        $prezzo_dispositivo->appendChild($frammento);

        $panoramica = $doc->getElementById('panoramica');
        $frammento->appendXML($row['Panoramica']);
        $panoramica->appendChild($frammento);

        $descrizione = $doc->getElementById('descrizione');
        $frammento->appendXML($row['Descrizione']);
        $descrizione->appendChild($frammento);

        $specifiche_tecniche = $doc->getElementById('specifiche_tecniche');
        $frammento->appendXML($row['Specifiche']);
        $specifiche_tecniche->appendChild($frammento);

    	echo $doc->saveHTML();
    	libxml_clear_errors();
	}
	else{
		echo "error";
	}

?>