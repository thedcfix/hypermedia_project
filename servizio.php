<?php 

	if(isset($_GET['id'])) {
		$category = $_GET['id'];
		$conn = mysqli_connect("localhost", "root", "");
    	mysqli_select_db($conn, "hyp_db");
    	$res = mysqli_query($conn, "select * from servizi where id = '$id'");   

    	$doc = new DOMDocument();
    	libxml_use_internal_errors(true);
    	$doc->loadHTMLFile("assistenza_servizi.html");
    	
    	$elenco_servizi_assistenza = $doc->getElementById('contenuto');
        $frammento =$doc->createDocumentFragment();

         while($row = mysqli_fetch_array($res)){
             $aggiunta = '<div class="col-sm-4" align="center" style="float:left"><a href="assistance.php?id='.$row["id"].'"><img src="'.$row["img"].'" style="width:160px; height:160px"></img><p>'.$row["servizio"].'<br/></p></a></div>';
             // <img src="'.$img["img"].'" style="width:230px; height:230px"></img>
             $frammento->appendXML($aggiunta);
             $elenco_servizi_assistenza->appendChild($frammento);
         }

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