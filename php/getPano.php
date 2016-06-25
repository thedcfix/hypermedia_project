<?php
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "tim");    
    $res = mysqli_query($conn, "select Panoramica from Prodotti where Nome = 'iPhone6S'");
    $row = mysqli_fetch_array($res);
    echo $row["Panoramica"];
?>