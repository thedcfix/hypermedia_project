<?php
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "hyp_db");    
    $res = mysqli_query($conn, "select Immagine from Prodotti where Nome = 'iPhone6S'");
    $row = mysqli_fetch_array($res);
    echo $row["Immagine"];
?>