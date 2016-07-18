
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
    	mysqli_select_db($conn, "my_reyze");
    	$stringa = "select * from prodotti where id = '$id'";
    	$ris = $conn->query($stringa);
    	$row = mysqli_fetch_array($ris);
        $var = $row['id'];
        $imma = mysqli_query($conn, "select img from immagini where disp_id = $var");
        $query = "select * from prodotti_servizi join servizi on prodotti_servizi.id_servizio = servizi.id where id_prodotto = $id ";
        $servizi = $conn->query($query);

    	$doc = new DOMDocument();
    	libxml_use_internal_errors(true);
    	$doc->loadHTMLFile("device.html");
    	$frammento =$doc->createDocumentFragment();



        $bread = $doc->getElementById('categoria');
        $frammento->appendXML('<a href="products.html?type='.$row['tipologia'].'">'.$row['tipologia'].'</a>');
        $bread->appendChild($frammento);

    	$nome_dispositivo = $doc->getElementById('nome_dispositivo');
    	$frammento->appendXML($row['nome']);
    	$nome_dispositivo->appendChild($frammento);

        $nome_dispositivo_b = $doc->getElementById('nome_dispositivo_b');
        $frammento->appendXML($row['nome']);
        $nome_dispositivo_b->appendChild($frammento);

        $prezzo_dispositivo = $doc->getElementById('prezzo');
        $frammento->appendXML($row['prezzo']);
        $prezzo_dispositivo->appendChild($frammento); 

        $panoramica = $doc->getElementById('panoramica');
        $frammento->appendXML($row['panoramica']);
        $panoramica->appendChild($frammento);

        $descrizione = $doc->getElementById('descrizione');
        $frammento->appendXML($row['descrizione']);
        $descrizione->appendChild($frammento);

        $specifiche_tecniche = $doc->getElementById('specifiche_tecniche');
        $frammento->appendXML($row['specifiche']);
        $specifiche_tecniche->appendChild($frammento);

        $img =  mysqli_fetch_array($imma);
        $immagine = '<div class="item active" id="principal_image"><img src ="'.$img['img'].'"></img></div>';
        $image_0 = $doc->getElementById('carosello');
        $frammento->appendXML($immagine);
        $image_0->appendChild($frammento);

        $int = 0;

        $image_0 = $doc->getElementById('cerchiprimocar');
        $frammento->appendXML('<li data-target="#myCarousel" data-slide-to="'.$int.'" class="active"></li>');
        $image_0->appendChild($frammento);
        $int++;

        while($img =  mysqli_fetch_array($imma)) { 
            
            $immagine = '<div class="item"><img src ="'.$img['img'].'"></img></div>';
            $image_0 = $doc->getElementById('carosello');
            $frammento->appendXML($immagine);
            $image_0->appendChild($frammento);

            $image_0 = $doc->getElementById('cerchiprimocar');
            $frammento->appendXML(' <li data-target="#myCarousel" data-slide-to="'.$int.'"></li>');
            $image_0->appendChild($frammento);
            $int++;

        }

        $pulsante_assistenza = $doc->getElementById('bottone_assistenza');
        $frammento->appendXML('<a href="http://reyze.altervista.org/assistenza_servizi.php?category='.$row['categoria'].'" class="btn btn-primary btn-lg" role="button"><div align="center">Assistenza<br></br><small>Ricevi assistenza per questo dispositivo</small></div></a>');
        $pulsante_assistenza->appendChild($frammento);

        $serv = mysqli_fetch_array($servizi);
        
        $immagine = '<div class="item active" id="principal_image"><a href="http://reyze.altervista.org/servizio.php?id='.$serv['id'].'"><img src ="'.$serv['img'].'"></img></a></div>';
        $image_0 = $doc->getElementById('carosello_servizi');
        $frammento->appendXML($immagine);
        $image_0->appendChild($frammento);

        while($serv =  mysqli_fetch_array($servizi)) { 
            
            $immagine = '<div class="item"><a href="http://reyze.altervista.org/servizio.php?id='.$serv['id'].'"><img src ="'.$serv['img'].'"></img></a></div>';
            $image_0 = $doc->getElementById('carosello_servizi');
            $frammento->appendXML($immagine);
            $image_0->appendChild($frammento);

        }

    	echo $doc->saveHTML();
    	libxml_clear_errors();
	}
	else{
		echo "error";
	}

?>