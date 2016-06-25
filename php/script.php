<?php
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "tim");    
    $res = mysqli_query($conn, "select * from prodotti order by Prezzo DESC");
    while($row = mysqli_fetch_array($res))
        echo '<div class="col-sm-4" align="center" style="float"><br/><br/><a href="iPhone.html"><img src="'.$row["Immagine"].'" style="width:230px; height:230px"><p>'.$row["Marca"].'<br/>'.$row["Nome"].'</p></a></div>';
?>