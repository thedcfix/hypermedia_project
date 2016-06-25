<?php
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "tim");    
    $res = mysqli_query($conn, "select Specifiche from Prodotti where Nome = 'iPhone 6S'");
    $row = mysqli_fetch_array($res);
    echo $row["Specifiche"];
?>