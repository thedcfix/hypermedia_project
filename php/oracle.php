<?php

switch ($_POST['method']) {
    case 'device_assistance':
        $stringa = dispositiviWithAssistenza($_POST['id']);
        echo $stringa;
        break;
    
    case 'products_show':
        $conn = mysqli_connect("localhost", "root", "");
        mysqli_select_db($conn, "my_reyze");
        $res = productsShow($_POST['type'],$conn);
        while($row = mysqli_fetch_array($res)) {
            $var = $row['id'];
            $imma = mysqli_query($conn, "select img from immagini where disp_id = $var");
            $img =  mysqli_fetch_array($imma);
            echo '<div class="col-sm-4" align="center" style="float:left"><a href="http://reyze.altervista.org/device.php?id='.$row["id"].'""><img src="'.$img["img"].'" style="width:230px; height:230px"><p>'.$row["marca"].'<br/>'.$row["nome"].'</p></a></div>';
        }
        break;

    case 'products_show_min_max':
        $conn = mysqli_connect("localhost", "root", "");
        mysqli_select_db($conn, "my_reyze");
        $res = productsShowMinMax($_POST['type'],$conn,$_POST['min'],$_POST['max']);
        while($row = mysqli_fetch_array($res)) {
            $var = $row['id'];
            $imma = mysqli_query($conn, "select img from immagini where disp_id = $var");
            $img =  mysqli_fetch_array($imma);
            echo '<div class="col-sm-4" align="center" style="float:left"><a href="http://reyze.altervista.org/device.php?id='.$row["id"].'""><img src="'.$img["img"].'" style="width:230px; height:230px"><p>'.$row["marca"].'<br/>'.$row["nome"].'</p></a></div>';
        }
        break;

    default:
        echo "Non ho questo metodo!!!";
        break;
}

?>

<?php


function dispositiviWithAssistenza($idAssistenza) {
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "my_reyze");
    $stringa = "select id_prodotto, nome from prodotti_assistenza join prodotti on prodotti_assistenza.id_prodotto = prodotti.id where id_assistenza = '$idAssistenza'";
    $ris = $conn->query($stringa);
    $dispo = array();
    while($row = mysqli_fetch_array($ris)){
        $var = $row['id_prodotto'];
        $temp = $var.'-'.$row['nome'];
        array_push($dispo, $temp);
    }
    $dispositivi = implode(';', $dispo);
    return $dispositivi; //Deve essere una stringa formata dal nome dei device separati da ';' " es: iPhone 6S;Samsung S7;che ne so "

}
 
?>

<?php


function productsShow($type,$conn) {
    if($type != 'Outlet') {
        $res = mysqli_query($conn, "select * from prodotti where tipologia = '$type' order by Prezzo DESC");
    }
    else {
        $res = mysqli_query($conn, "select * from prodotti where outlet order by Prezzo DESC");
    }
    return $res;

}
 
?>

<?php


function productsShowMinMax($type,$conn,$min,$max) {
    if($type != 'Outlet') {
        $res = mysqli_query($conn, "select * from prodotti where tipologia = '$type' && prezzo < $max && prezzo > $min order by Prezzo DESC");
    }
    else {
        $res = mysqli_query($conn, "select * from prodotti where outlet && prezzo < $max && prezzo > $min order by Prezzo DESC");
    }
    return $res;

}
 
?>

