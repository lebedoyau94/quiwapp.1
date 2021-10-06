<?php

if (isset($_GET["key_function"])){
$key_function = $_GET["key_function"];
}else{$key_function = "";};
$jsonparametros = file_get_contents('php://input');
$Body = file_get_contents('php://headers');

if($jsonparametros=='' ){
    echo json_encode(array('respuesta'=>'no envio informacion'));exit;
}else{
    $jsonparametros = ltrim($jsonparametros, '"');
    $jsonparametros = rtrim($jsonparametros, '"');
    $jsonparametros = str_replace(array("\\"), '', $jsonparametros);
    
}

switch ($key_function) {
    case "conexionusuario":
        conexion_usuario($jsonparametros);
        break;
    
        case "getcliente":
        getcliente($jsonparametros);
        break;
}

function conexion_usuario($jsonparametros) {
    include ("archivoglobal.php");
    $json_result =get_object_vars(json_decode( $jsonparametros));
    
   //echo  $json_result["usuario"] . "____";
   //echo  $json_result["contrasena"];
   //echo  $host;
    

    echo json_encode(array("respuesta" => "ok","usuario" => $json_result["usuario"],"contrasena" => $json_result["contrasena"] ));
}

function getcliente($jsonparametros) {
    include ("archivoglobal.php");
    $host;
    //$json_result =get_object_vars(json_decode( $jsonparametros));
    $array = array();
    //$array[0] = array("nombrecliente" => 'JOSE',"posicion" => 1,"debe" => 1000);
    //$array[1] = array("nombrecliente" => 'ELIANA',"posicion" => 2,"debe" => 2000);
    //$array[2] = array("nombrecliente" => 'CARLOS',"posicion" => 3,"debe" => 3000);
    array_push($array, array("nombrecliente" => 'KAROL',"posicion" => 4,"debe" => 3000));

    echo json_encode($array);
}

