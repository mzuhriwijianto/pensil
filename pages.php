<?php
error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));

switch($_GET['page']){

case 'project':
$url='view/quick_report_dashboard.php';
break;

case 'addproject':
$url='view/newproject.php';
break;

case 'showproject':
$url='view/listproject.php';
break;

case 'dispoa':
$url='view/update_dispo_a.php';
break;

case 'dispob':
$url='view/update_dispo_b.php';
break;

case 'dispoc':
$url='view/update_dispo_c.php';
break;

case 'responstaf':
$url='view/update_dispo_c_2.php';
break;

case 'timeline':
$url='view/tl_project.php';
break;

case 'adduser':
$url='view/newuser.php';
break;

case 'addbidang':
$url='view/newbidang.php';
break;

case 'addsubbidang':
$url='view/newsubbidang.php';
break;

case 'showvalidasi':
$url='view/listvalidasi.php';
break;
}
?>