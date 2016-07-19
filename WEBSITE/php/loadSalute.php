<?php
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "my_reyze");
    $res = mysqli_query($conn, "select * from prodotti where categoria = 'Salute e benessere'");
    while($row = mysqli_fetch_array($res)) {
    	$var = $row['id'];
    	$imma = mysqli_query($conn, "select img from immagini where disp_id = $var");
    	$img =  mysqli_fetch_array($imma);
        echo '<div class="col-sm-4" align="center" style="float"><a href="http://reyze.altervista.org/device.php?id='.$row["id"].'""><img src="'.$img["img"].'" style="width:230px; height:230px"><p>'.$row["marca"].'<br/>'.$row["nome"].'</p></a></div>';
    }
?>
