<?php
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "tim");    
    $res = mysqli_query($conn, "select Descrizione from Prodotti where nome = iPhone 6S");
    echo $res;
?>