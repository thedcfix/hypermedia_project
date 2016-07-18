<?php

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "hyp_db");
    $stringa = "select * from assistenza where ID = '$id'";
    $ris = $conn->query($stringa);
    $row = mysqli_fetch_array($ris);
    $views = $row['views'];
    $record = $row['id'];
    if (mysqli_num_rows($ris) > 0) {
        $page = implode("", file("assistenzaDispositivo.html"));
        $stringa = '<p align="center" id="linkdispositivo"><a href = "device_assistenza.html?id=' . $id . '">Dispositivi collegati</a></p>';
        $final_page = preg_replace("#<!--Linkassistenza-->#", $stringa, $page);
        $stringa = '<div align="center" class="embed-responsive embed-responsive-16by9">
                            <video controls class="embed-responsive-item">
                                <source src="' . $row["video"] . '" type="video/mp4">
                            </video>
                        </div>';
        $final_page = preg_replace("#<!--Video-->#", $stringa, $final_page);
        $final_page = preg_replace("#<!--Problema-->#", $row["descrizione"], $final_page);
        $stringa = '<li><a href="assistenza.html">Tutte le assistenze</a></li>
            <li id="categoria"><a href="assistenza_servizi.php?category=' . $row["categoria_device"] . '">' . $row["categoria_device"] . '</a></li>
            <li class="active" id="nome_assistenza">' . $row["servizio"] . '</li>';
        $final_page = preg_replace("#<!--Breadcrumbs-->#", $stringa, $final_page);
        echo $final_page;
    }
    else {
        echo "Sono un errore";
    }
}
else {
    echo "error";
}

$query = "UPDATE assistenza SET views=$views+1 where id=$record";
$conn->query($query);
?>