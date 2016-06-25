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

    	$prezzo_disp = $doc->getElementById('prezzo');
    	$frammento->appendXML($row['Prezzo']);
    	$prezzo_disp->appendChild($frammento);

    	$titoloMenu1 = $doc->getElementById('titoloMenu1');
    	$frammento->appendXML('Panoramica');
    	$titoloMenu1->appendChild($frammento);

    	echo $doc->saveHTML();
    	libxml_clear_errors();
	}