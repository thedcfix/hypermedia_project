<?php
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "my_reyze");    
    $res = mysqli_query($conn, "select * from assistenza order by views DESC limit 5");
    while($row = mysqli_fetch_array($res))
        echo '<div class="col-sm-4" align="center" style="float"><br><a href="http://reyze.altervista.org/assistance.php?id='.$row["id"].'"><img src="'.$row["img"].'" style="width:160px; height:160px"></img><p>'.$row["categoria_device"]."<br>".$row["servizio"].'<br/></p></a></div>';
?>