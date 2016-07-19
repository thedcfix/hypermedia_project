<?php

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "my_reyze");
    $stringa = "select * from servizi where id = $id";
    $ris = $conn->query($stringa);
    $row = mysqli_fetch_array($ris);
    $id = $row['id'];
    $imma = $row["img"];
    $doc = new DOMDocument();
    libxml_use_internal_errors(true);
    $doc->loadHTMLFile("servizio_template.html");
    $frammento = $doc->createDocumentFragment();
    $bread = $doc->getElementById('categoria_servizio');
    $frammento->appendXML('<a href="http://reyze.altervista.org/servizio_categoria.php?category=' . $row['categoria'] . '">' . $row['categoria'] . '</a>');
    $bread->appendChild($frammento);
    $bread = $doc->getElementById('servizio_attuale');
    $frammento->appendXML($row['nome']);
    $bread->appendChild($frammento);
    $img = $doc->getElementById('immagine');
    $frammento->appendXML('<img src="'.$row["img"].'" class="img-responsive"></img><br/>');
    $img->appendChild($frammento);

    // dà problemi se le cose prese dal db hanno lettere accentate

    $offerta = $doc->getElementById('offerta');
    $frammento->appendXML("<br/>".$row["offerta"]."<br/><br/>");
    $offerta->appendChild($frammento);
    $costi = $doc->getElementById('costi');
    $frammento->appendXML("<br/>".$row["dettagli_costi"]."<br/><br/>");
    $costi->appendChild($frammento);

    // prendo tutti i device compatibili col servizio

    $prodotti = "select prodotti.id from servizi join prodotti_servizi on servizi.id = prodotti_servizi.id_servizio join prodotti on prodotti_servizi.id_prodotto = prodotti.id where servizi.id = $id";
    $res = $conn->query($prodotti);
    $prod = mysqli_fetch_array($res);
    $idProd = $prod['id'];
    $im = "select img from immagini where disp_id = $idProd";
    $repl = $conn->query($im);

    // filtro. Può essere che non ci siano dispositivi collegati

    if($repl){
        $img = mysqli_fetch_array($repl);
        $immagine = '<div class="item active" id="principal_image"><a href="http://reyze.altervista.org/device.php?id=' . $idProd . '"><img src ="' . $img['img'] . '" style="width: 45%; height: 45%"></img></a></div>';
        $image_0 = $doc->getElementById('dispositivi');
        $frammento->appendXML($immagine);
        $image_0->appendChild($frammento);
        while ($prod = mysqli_fetch_array($res)) {
            $idProd = $prod['id'];
            $im = "select img from immagini where disp_id = $idProd";
            $repl = $conn->query($im);
            $img = mysqli_fetch_array($repl);
            $immagine = '<div class="item"><a href="http://reyze.altervista.org/device.php?id=' . $idProd . '"><img src ="' . $img['img'] . '" style="width: 45%; height: 45%"></img></a></div>';
            $image_0 = $doc->getElementById('dispositivi');
            $frammento->appendXML($immagine);
            $image_0->appendChild($frammento);
        }
    }

    echo $doc->saveHTML();
    libxml_clear_errors();
}
else {
    echo "error";
}

?>
