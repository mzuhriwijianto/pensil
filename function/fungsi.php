<?php
include '../bridge.php';

function ambilExt($var){
  $source = strrev($var);
  $data=explode(".",$source);
  $ext=strrev($data[0]);
  
  if($ext=='jpg'){
    echo "<i class='nav-icon fas fa-regular fa-image'></i>";
  }elseif($ext=='pdf'){
    echo "<i class='nav-icon fas fa-regular fa-file-pdf'></i>";
  }elseif($ext=='jpeg'){
    echo "<i class='nav-icon fas fa-regular fa-image'></i>";
  }else{
  }
}
?>