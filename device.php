<?php
/*
// 1 se è eseguito in localhost 0 altrimenti.
function breadcrumbs($isLocalHost) {
    $refer = $_SERVER['HTTP_REFERER'];
    $referExploded = explode("/",$refer);
    array_splice($referExploded,1,1); //elimina spazio vuoto creato dal //.

    //creo i link per i breadcrumbs
    if($isLocalHost == 1){
        $base = $referExploded[0]."//".$referExploded[1]."/".$referExploded[2];
        array_splice($referExploded,0,1);
        array_splice($referExploded,0,1);
        array_splice($referExploded,0,1);
    }
    else{
        $base = $referExploded[0]."//".$referExploded[1];
        array_splice($referExploded,0,1);
        array_splice($referExploded,0,1);
    }
    $links = array();
    $names = array();
    foreach ($referExploded as $crumbs) {
        array_push($names, $crumbs);
        $temp = $base."/".$crumbs.".html";
        array_push($links,$temp);
        $base = $base."/".$crumbs;
    }
    $result = count($links);
    $result = $result - 1;
    array_splice($links,$result,1);
    array_splice($names,$result,1);
    $strings = array();
    for ($i=0; $i < count($links); $i++) { 
        $stringa = '<li><a href="'.$links[i].'">'.$names[i].'</a></li>';
        array_push($strings,$stringa);
    }

    return implode($strings);

}
 */
?>


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

        /*$try = breadcrumbs(1);

        $bread = $doc->getElementById('breadcrums');
        $frammento->appendXML($try);
        $bread->appendChild($frammento);*/

    	$nome_dispositivo = $doc->getElementById('nome_dispositivo');
    	$frammento->appendXML($row['Nome']);
    	$nome_dispositivo->appendChild($frammento);

        $nome_dispositivo_b = $doc->getElementById('nome_dispositivo_b');
        $frammento->appendXML($row['Nome']);
        $nome_dispositivo_b->appendChild($frammento);

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

        $immagine = "<img src ='".$row['Immagine']."'></img>";

        $image_0 = $doc->getElementById('principal_image');
        $frammento->appendXML($immagine);
        $image_0->appendChild($frammento);

        $image_1 = $doc->getElementById('second_image');
        $frammento->appendXML($immagine);
        $image_1->appendChild($frammento);

        $image_2 = $doc->getElementById('third_image');
        $frammento->appendXML($immagine);
        $image_2->appendChild($frammento);

        $image_3 = $doc->getElementById('fourth_image');
        $frammento->appendXML($immagine);
        $image_3->appendChild($frammento);

        $pulsante_assistenza = $doc->getElementById('bottone_assistenza');
        $frammento->appendXML('<a href="#" class="btn btn-primary btn-lg" role="button"><div align="center">Assistenza<br></br><small>Ricevi assistenza per questo dispositivo</small></div></a>');
        $pulsante_assistenza->appendChild($frammento);

    	echo $doc->saveHTML();
    	libxml_clear_errors();
	}
	else{
		echo "error";
	}

?>