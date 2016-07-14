<?php

if (isset($_GET['id']))
    {
    $id = $_GET['id'];
    $conn = mysqli_connect("localhost", "root", "");
    mysqli_select_db($conn, "hyp_db");
    $stringa = "select * from assistenza where ID = '$id'";
    $ris = $conn->query($stringa);
    $row = mysqli_fetch_array($ris);
    if (mysqli_num_rows($ris) > 0)
        {
        $page = implode("", file("assistenzaDispositivo.html"));
        $stringa = '<p align="center" id="linkdispositivo"><a href = "device_assistenza.html?id=' . $id . '">Dispositivi collegati</a></p>';
        $final_page = eregi_replace("<!--Linkassistenza-->", $stringa, $page);
        $stringa = '<div align="center" class="embed-responsive embed-responsive-16by9">
                            <video controls class="embed-responsive-item">
                                <source src="' . $row["video"] . '" type="video/mp4">
                            </video>
                        </div>';
        $final_page = eregi_replace("<!--Video-->", $stringa, $final_page);
        $final_page = eregi_replace("<!--Problema-->", $row["descrizione"], $final_page);
        echo $final_page;
        }
      else
        {
        echo "Sono un errore";
        }
    }
  else
    {
    echo "error";
    }

?>