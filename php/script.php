<?php
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "tim");    
    $res = mysqli_query($conn, "select * from prodotti");
    $row = mysqli_fetch_array($res);
    echo $row["Immagine"];
?>