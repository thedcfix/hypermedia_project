<?php
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "tim");    
    $res = mysqli_query($conn, "select Immagine from Prodotti");
    $row = mysqli_fetch_array($res);
    echo $row["Immagine"];
?>