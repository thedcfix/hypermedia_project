<?php

if (isset($_GET['category']))
{
    $category = $_GET['category'];
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "tim");
    $stringa = "select * from assistenza where categoria_device = '$category'";
    $ris = $conn->query($stringa);
    
    while($row = mysqli_fetch_array($ris))
        echo '<div class="col-sm-4" align="center" style="float:left"><a href="assistance.php?id='.$row["id"].'""><p>'.$row["servizio"].'<br/>'.'</p></a></div>';
    }
    // <img src="'.$row["img"].'" style="width:230px; height:230px">
?>