<?php 

	if(isset($_GET['category'])) {
		$category = $_GET['category'];
		$conn = mysqli_connect("localhost", "root", "");
    	mysqli_select_db($conn, "my_reyze");
    	$res = mysqli_query($conn, "select * from servizi where categoria = '$category'");   

    	$doc = new DOMDocument();
    	libxml_use_internal_errors(true);
    	$doc->loadHTMLFile("servizi_categoria.html");
    	
    	$elenco_servizi = $doc->getElementById('contenuto');
        $frammento =$doc->createDocumentFragment();

         while($row = mysqli_fetch_array($res)){

             $aggiunta = '<div class="col-sm-4" align="center" style="float"><a href="http://reyze.altervista.org/servizio.php?id='.$row["id"].'"><img src="'.$row["img"].'" style="width:160px; height:160px"></img><p>'.$row["nome"].'<br/></p></a><p>'.$row["descrizione"].'</p><a href="http://reyze.altervista.org/servizio.php?id='.$row["id"].'"><button>Scopri</button></a></div>';
             // <img src="'.$img["img"].'" style="width:230px; height:230px"></img>
             $frammento->appendXML($aggiunta);
             $elenco_servizi->appendChild($frammento);
         }

        // serve a impostare i breadcrumbs
        $cat = $doc->getElementById('categoria');
        $frammento->appendXML($category);
        $cat->appendChild($frammento);

        echo $doc->saveHTML();
    	libxml_clear_errors();
	}
	else{
		echo "error";
	}

?>