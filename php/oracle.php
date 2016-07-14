<?php

switch ($_POST['method']) {
    case 'device_assistance':
        $stringa = dispositiviWithAssistenza($_POST['id']);
        echo $stringa;
        break;
    
    default:
        echo "Non ho questo metodo!!!";
        break;
}

?>

<?php


function dispositiviWithAssistenza($idAssistenza) {
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "hyp_db");
    $stringa = "select id_prodotto from prodotti_assistenza where id_assistenza = '$idAssistenza'";
    $ris = $conn->query($stringa);
    $dispo = array();
    $dispositivi = "";
    while($row = mysqli_fetch_array($ris)){
        
    }
    return $row['Dispositivi_collegati']; //Deve essere una stringa formata dal nome dei device separati da ';' " es: iPhone 6S;Samsung S7;che ne so "

}
 
?>

