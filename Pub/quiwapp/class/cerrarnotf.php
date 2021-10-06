<?php
require_once("class.php"); 
ini_set('memory_limit', '-1'); //evita el error Fatal error: Allowed memory size of X bytes exhausted (tried to allocate Y bytes)...
ini_set('max_execution_time', 3800); // es lo mismo que set_time_limit(300) ; 

$tra = new Login();
$res = $tra->CerrarNotificacion();