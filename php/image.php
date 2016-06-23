<?php
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "tim");    
    $res = mysqli_query($conn, "select Immagine from prodotti where nome = iphone 6S");
    echo $res;
?>