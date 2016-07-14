<?php 

	if(isset($_GET['category'])) {
		$category = $_GET['category'];
		$conn = mysqli_connect("localhost", "root", "");
    	mysqli_select_db($conn, "hyp_db");
    	$res = mysqli_query($conn, "select * from assistenza where categoria_device = '$category'");   

    	$doc = new DOMDocument();
    	libxml_use_internal_errors(true);
    	$doc->loadHTMLFile("assistenza_servizi.html");
    	
    	$elenco_servizi_assistenza = $doc->getElementById('contenuto');
        $frammento =$doc->createDocumentFragment();

         while($row = mysqli_fetch_array($res)){
             $aggiunta = '<div class="col-sm-4" align="center" style="float:left"><a href="assistenza.php?id='.$row["id"].'""><p>'.$row["servizio"].'<br/></p></a></div>';
             echo $aggiunta;
             // <img src="'.$img["img"].'" style="width:230px; height:230px">
             $frammento->appendXML($aggiunta);
             $elenco_servizi_assistenza->appendChild($frammento);
         }

         echo $doc->saveHTML();
    	 libxml_clear_errors();
	}
	else{
		echo "error";
	}

?>