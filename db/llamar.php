<?php
require_once("class.php"); 
ini_set('memory_limit', '-1'); //evita el error Fatal error: Allowed memory size of X bytes exhausted (tried to allocate Y bytes)...
ini_set('max_execution_time', 3800); // es lo mismo que set_time_limit(300) ; 

if(isset($_POST["action"])) { // Se pasa una acción
    switch($_POST["action"]) { // ¿Qué acción?
        case 1:
            //crearNotificacion();
            $tra = new Registro();
            $res = $tra->crearNotificacion();
            break;
        default:
            echo "Error: Falta una acción";
    }
}
