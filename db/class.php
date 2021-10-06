<?php
require_once("classconexion.php"); 
include_once('funciones_basicas.php');
//include "class.phpmailer.php";
//include "class.smtp.php";

ini_set('memory_limit', '-1'); //evita el error Fatal error: Allowed memory size of X bytes exhausted (tried to allocate Y bytes)...
ini_set('max_execution_time', 3800); // es lo mismo que set_time_limit(300) ; 

class Registro extends Db{

    public function __construct()
	{
		parent::__construct();
    } 
	
	public function crearNotificacion(){
		if(empty($_POST["empresa"]) or empty($_POST["mesa"]))
		{
			echo "1";
			exit;
		}
		$query = " INSERT INTO notificaciones values (null, ?, ?, ?, ?, ?);";
			$stmt = $this->dbh->prepare($query);
			$stmt->bindParam(1, $mesa);
			$stmt->bindParam(2, $fecha_hora);
			$stmt->bindParam(3, $rol);
			$stmt->bindParam(4, $estado);
			$stmt->bindParam(5, $empresa);

			$mesa = $_POST["mesa"];
			$fecha_hora = date('Y-m-d H:i:s');
			$rol = NULL;
			$estado = "A";
			$empresa = $_POST["empresa"];
			$res = $stmt->execute();
	}

    public function RegistrarConfiguracion(){  
		self::SetNames();
		if(empty($_POST["cuit"]) or empty($_POST["nomsucursal"]) or empty($_POST["tlfsucursal"])){
			echo "1";
			exit;
		}
		

		$sql = " SELECT nomsucursal FROM configuracion WHERE cuit = ?";
		$stmt = $this->dbh->prepare($sql);
		$stmt->execute(array($_POST["cuit"]));
		$num = $stmt->rowCount();
		if($num>0){
			echo "<span class='fa fa-warning'></span> YA EXISTE UN RESTAURANTE CON ESTE N&deg; DE REGISTRO, VERIFIQUE NUEVAMENTE POR FAVOR ...!";
			exit;
		}
		$sql = " SELECT nomsucursal FROM configuracion WHERE nomsucursal = ?";
		$stmt = $this->dbh->prepare($sql);
		$stmt->execute(array($_POST["nomsucursal"]));
		$num = $stmt->rowCount();
		if($num == 0){
			$query = " INSERT INTO configuracion values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, null);";
			$stmt = $this->dbh->prepare($query);
			$stmt->bindParam(1, $documsucursal);
			$stmt->bindParam(2, $cuit);
			$stmt->bindParam(3, $nomsucursal);
			$stmt->bindParam(4, $tlfsucursal);
			$stmt->bindParam(5, $correosucursal);
			$stmt->bindParam(6, $id_provincia);
			$stmt->bindParam(7, $id_departamento);
			$stmt->bindParam(8, $direcsucursal);
			$stmt->bindParam(9, $nroactividad);
			$stmt->bindParam(10, $iniciofactura);
			$stmt->bindParam(11, $fechaautorizacion);
			$stmt->bindParam(12, $llevacontabilidad);
			$stmt->bindParam(13, $documencargado);
			$stmt->bindParam(14, $dniencargado);
			$stmt->bindParam(15, $nomencargado);
			$stmt->bindParam(16, $tlfencargado);
			$stmt->bindParam(17, $descuentoglobal);
            $stmt->bindParam(18, $porcentaje);
            $stmt->bindParam(19, $codmoneda);
			$stmt->bindParam(20, $codmoneda2);

			$documsucursal = limpiar($_POST["documsucursal"]);
			$cuit = limpiar($_POST["cuit"]);
			$nomsucursal = $_POST["nomsucursal"];
			$tlfsucursal = limpiar($_POST["tlfsucursal"]);
			$correosucursal = $_POST["correosucursal"];
			$id_provincia = limpiar(0);
			$id_departamento = limpiar($_POST["id_departamento"]);
			$direcsucursal = limpiar($_POST["direcsucursal"]);
			$nroactividad = limpiar('001');
			$iniciofactura = limpiar('00001');
			if (limpiar($_POST['fechaautorizacion']!="") && limpiar($_POST['fechaautorizacion']!="0000-00-00")) { 
				$fechaautorizacion = limpiar(date("Y-m-d",strtotime($_POST['fechaautorizacion']))); 
			}else{ 
                $fechaautorizacion = limpiar('0000-00-00'); 
            };
			$llevacontabilidad = limpiar('NO');
			$documencargado = limpiar($_POST["documencargado"]);
			$dniencargado = $_POST["dniencargado"];
			$nomencargado = $_POST["nomencargado"];
			$tlfencargado = $_POST["tlfencargado"];
			$descuentoglobal = "0.00";
            $porcentaje = limpiar($_POST["porcentaje"]);
            $codmoneda = 1;
			$codmoneda2 = 1;
			$res = $stmt->execute();
            $con = new Registro();
            $con = $con->RegistrarUsuarios();

		} else {

			echo "<span class='fa fa-warning'></span> YA EXISTE UN RESTAURANTE CON ESE NOMBRE, VERIFIQUE NUEVAMENTE POR FAVOR ...!";
			exit;
		}
    }

    public function RegistrarUsuarios()
	{
		self::SetNames();
		if(empty($_POST["nomencargado"]) or empty($_POST["usuario"]) or empty($_POST["password"]))
		{
			echo "1";
			exit;
		}
        $stmt = null;
		$sql = "SELECT id FROM configuracion WHERE nomsucursal = ?";
        $stmt = $this->dbh->prepare($sql);
        $stmt->execute(array($_POST["nomsucursal"]));
        if($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                    $x[]=$row;
        }
        $empresa_r= $x[0]["id"];	

            ////////////////////USUARIO//////////////////////////
            $sql = " SELECT dni FROM usuarios WHERE dni = ?";
            $stmt = $this->dbh->prepare($sql);
            $stmt->execute(array($_POST["dniencargado"]));
            $num = $stmt->rowCount();
            if($num > 0){
                
                echo "<span class='fa fa-warning'></span> YA EXISTE UN USUARIO CON ESE DNI, VERIFIQUE NUEVAMENTE POR FAVOR ...!";
                exit;
            }
                $sql = " SELECT usuario FROM usuarios WHERE usuario = ?";
				$stmt = $this->dbh->prepare($sql);
				$stmt->execute(array($_POST["usuario"]));
				$num = $stmt->rowCount();
				if($num == 0){
					$query = " INSERT INTO usuarios values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
					$stmt = $this->dbh->prepare($query);
					$stmt->bindParam(1, $dni);
					$stmt->bindParam(2, $nombres);
					$stmt->bindParam(3, $sexo);
					$stmt->bindParam(4, $direccion);
					$stmt->bindParam(5, $telefono);
					$stmt->bindParam(6, $email);
					$stmt->bindParam(7, $usuario);
					$stmt->bindParam(8, $password);
					$stmt->bindParam(9, $nivel);
					$stmt->bindParam(10, $status);
					$stmt->bindParam(11, $comision);
					$stmt->bindParam(12, $empresa);//add empresa

                    $dni = limpiar($_POST["dniencargado"]);
                    $nombres = limpiar($_POST["nomencargado"]);
                    $sexo = limpiar($_POST["sexo"]);
                    $direccion = limpiar($_POST["direccion"]);
                    $telefono = limpiar($_POST["tlfencargado"]);
                    $email = limpiar($_POST["correosucursal"]);
                    $usuario = limpiar($_POST["usuario"]);
                    $password = sha1(md5($_POST["password"]));
                    $nivel = 'ADMINISTRADOR(A)';
                    $status = 1;
                    $comision = '0.00';
                    $empresa = $empresa_r;
                    $stmt->execute();
                    
					echo "<span class='fa fa-check-square-o'></span> SE HA SIDO REGISTRADO EXITOSAMENTE INGRESE CON EL USUARIO QUE REGISTRO";
                    ?>
<script>
function redireccionar() {
    location.href = "quiwapp/index.php";
}
setTimeout("redireccionar()", 3000);
</script>
<?php
                    exit;
                }else{
					echo "6";
					exit;
				}
	}
	


    ########################## FUNCION LISTAR TIPO DE DOC ################################
	public function ListarDocumentos(){
		self::SetNames();
		$sql = "SELECT * FROM documentos ORDER BY documento ASC";
		foreach ($this->dbh->query($sql) as $row ){ $this->p[] = $row; }
		return $this->p;
		$this->dbh=null;
	}
	######################### FUNCION LISTAR TIPO DE DOCUMENTOS ##########################

    ########################## FUNCION PARA LISTAR DEPARTAMENTOS ##########################
	public function ListarDepartamentos()
	{
		self::SetNames();
		$sql = "SELECT * FROM departamentos LEFT JOIN provincias ON departamentos.id_provincia = provincias.id_provincia";
		foreach ($this->dbh->query($sql) as $row)
		{
			$this->p[] = $row;
		}
		return $this->p;
		$this->dbh=null;
	}
	######################### FUNCION PARA LISTAR DEPARTAMENTOS ##########################

	############################ FUNCION ID MESAS #################################
	public function detalle_mesa(){
		if (isset($_GET['codmesa'])) { 
		self::SetNames();
		$sql = "SELECT clientes.dnicliente, clientes.nomcliente, ventas.codpedido, ventas.codcaja, ventas.codcliente, documentos.documento, ventas.subtotalivasi, ventas.subtotalivano, ventas.iva, ventas.totaliva, ventas.descuento, ventas.totaldescuento, ventas.totalpago, ventas.totalpago2, ventas.codigo, ventas.observaciones, detallepedidos.coddetallepedido, detallepedidos.codpedido, detallepedidos.pedido, detallepedidos.codproducto, detallepedidos.producto, detallepedidos.cantventa, detallepedidos.ivaproducto, detallepedidos.descproducto, detallepedidos.valortotal, detallepedidos.totaldescuentov, detallepedidos.valorneto, salas.nomsala, mesas.codmesa, mesas.nommesa, usuarios.nombres 
		FROM mesas INNER JOIN ventas ON mesas.codmesa = ventas.codmesa 
		INNER JOIN detallepedidos ON detallepedidos.codpedido = ventas.codpedido
		INNER JOIN salas ON salas.codsala = mesas.codsala  
		LEFT JOIN clientes ON ventas.codcliente = clientes.codcliente 
		LEFT JOIN documentos ON clientes.documcliente = documentos.coddocumento 
		LEFT JOIN usuarios ON ventas.codigo = usuarios.codigo 
		WHERE mesas.codmesa = ".$_GET["codmesa"]." AND mesas.statusmesa = 1 AND ventas.statuspago = 1";
		$stmt = $this->dbh->prepare($sql);
		$stmt->execute(array($_GET["codmesa"]));
		$num = $stmt->rowCount();
		if($num==0)
		{
			echo "";
		}
		else
		{	$total = 0;

			while($row = $stmt->fetch(PDO::FETCH_ASSOC))
			{	$subtotal = $row['valortotal'] * $row['cantventa'];
				$total = $total + $subtotal;
				if (file_exists("quiwapp/fotos/productos/". $row['codproducto'].".jpg")){
					$img = 'quiwapp/fotos/productos/'.$row['codproducto'].'.jpg';
				}else if (file_exists("quiwapp/fotos/productos/". $row['codproducto'].".png")){
					$img = 'quiwapp/fotos/productos/'.$row['codproducto'].'.png';
				}else if (file_exists("fotos/productos/". $row['codproducto'].".jpeg")){
					$img = 'quiwapp/fotos/productos/'.$row['codproducto'].'.jpeg';
				}else{
					$img  = 'quiwapp/fotos/producto.png'; 
				} 
				$this->p[] = [
				'id' => $row['codproducto'],
				'codpedido' => $row['codpedido'],
				'producto' => $row['producto'],
				'valorneto' => $row['valorneto'],
				'valortotal' => $row['valortotal'],
				'subtotal' => $subtotal,
				'cantventa' => $row['cantventa'],
				'mesa' => $row['nommesa'],
				'img' => $img,
				'totales' => $total
				];

//$this->p[]=$row;
			}
			return $this->p;
			$this->dbh=null;
		}
	}
}


############################ FUNCION ID MESAS #################################

############################# FUNCION LISTAR PRODUCTOS ################################
	public function ListarProductosModal(){
		if (isset($_GET['empresa'])) { 
		self::SetNames();
		$sql = "SELECT * FROM productos 
		INNER JOIN categorias ON productos.codcategoria=categorias.codcategoria WHERE productos.empresa = ".$_GET['empresa'];
		foreach ($this->dbh->query($sql) as $row){
		$this->p[] = $row;
		}
		return $this->p;
		$this->dbh=null;
		}else{
		return null;
		}
	}
########################## FUNCION LISTAR PRODUCTOS ################################


######################## FUNCION BUSCAR PRODUCTOS POR MONEDA ###########################
	public function MonedaProductoId(){
		self::SetNames();
		$sql = "SELECT configuracion.nomsucursal, configuracion.codmoneda2, tiposmoneda.moneda, tiposmoneda.siglas, tiposmoneda.simbolo, tiposcambio.montocambio 
		FROM configuracion 
		INNER JOIN tiposmoneda ON configuracion.codmoneda2 = tiposmoneda.codmoneda
		INNER JOIN tiposcambio ON tiposmoneda.codmoneda = tiposcambio.codmoneda WHERE configuracion.id = ? ORDER BY tiposcambio.codcambio DESC LIMIT 1";
		$stmt = $this->dbh->prepare($sql);
		$stmt->execute(array($_GET['empresa']));
		$num = $stmt->rowCount();
		if($num==0)
		{
			echo "";
		}
		else
		{
			if($row = $stmt->fetch(PDO::FETCH_ASSOC))
			{
				$this->p[] = $row;
			}
			return $this->p;
			$this->dbh=null;
		}
	}
###################### FUNCION BUSCAR PRODUCTOS POR MONEDA ##########################

	######################## FUNCION ID CONFIGURACION DEL SISTEMA #########################
	public function ConfiguracionPorId()
	{
		self::SetNames();
		$sql = " SELECT 
		configuracion.id,
		configuracion.documsucursal,
		configuracion.cuit,
		configuracion.nomsucursal,
		configuracion.tlfsucursal,
		configuracion.correosucursal,
		configuracion.id_provincia,
		configuracion.id_departamento,
		configuracion.direcsucursal,
		configuracion.nroactividad,
		configuracion.iniciofactura,
		configuracion.fechaautorizacion,
		configuracion.llevacontabilidad,
		configuracion.documencargado,
		configuracion.dniencargado,
		configuracion.nomencargado,
		configuracion.tlfencargado,
		configuracion.descuentoglobal,
		configuracion.porcentaje,
		configuracion.codmoneda,
		configuracion.codmoneda2,
		configuracion.codsala,
		documentos.documento,
		documentos2.documento AS documento2,
		tiposmoneda.moneda,
		tiposmoneda2.moneda AS moneda2,
		tiposmoneda.simbolo,
		tiposmoneda2.simbolo AS simbolo2,
		provincias.provincia,
		departamentos.departamento
		FROM configuracion 
		LEFT JOIN documentos ON configuracion.documsucursal = documentos.coddocumento
		LEFT JOIN documentos AS documentos2 ON configuracion.documencargado = documentos2.coddocumento 
		LEFT JOIN provincias ON configuracion.id_provincia = provincias.id_provincia 
		LEFT JOIN departamentos ON configuracion.id_departamento = departamentos.id_departamento 
		LEFT JOIN tiposmoneda ON configuracion.codmoneda = tiposmoneda.codmoneda
		LEFT JOIN tiposmoneda AS tiposmoneda2 ON configuracion.codmoneda2 = tiposmoneda2.codmoneda WHERE configuracion.id = ?";
		$stmt = $this->dbh->prepare($sql);
		if($_GET["e"] != null){
			$empresa = $_GET["e"];
		}else{
			$empresa = 1;
		}
		$stmt->execute(array($empresa));
		$num = $stmt->rowCount();
			if($num==0)
		{
			echo "";
		}
		else
		{
			if($row = $stmt->fetch(PDO::FETCH_ASSOC))
			{
				$this->p[] = $row;
			}
			return $this->p;
			$this->dbh=null;
		}
	}

	############################ FUNCION VER DETALLES PEDIDOS EN VENTAS #############################
public function DetallesPedidoMesa(){
self::SetNames();
if (isset($_GET["e"])) {

	$sql = "SELECT ventas.idventa, ventas.codpedido, ventas.codcliente, ventas.codmesa, ventas.subtotalivasi, ventas.subtotalivano, ventas.iva, ventas.totaliva, ventas.descuento, ventas.totaldescuento, ventas.totalpago, ventas.delivery, ventas.repartidor, usuarios.nombres, clientes.dnicliente, clientes.nomcliente, salas.nomsala, mesas.nommesa, detallepedidos.pedido, detallepedidos.observacionespedido, detallepedidos.cocinero, 
	GROUP_CONCAT(cantventa, ' | ', substr(producto, 1,17) , ' | ', valorneto SEPARATOR '<br>') AS detalles, SUM(valorneto) AS suma 
	FROM ventas INNER JOIN detallepedidos ON detallepedidos.codpedido = ventas.codpedido 
	LEFT JOIN clientes ON ventas.codcliente = clientes.codcliente 
	LEFT JOIN mesas ON mesas.codmesa = ventas.codmesa 
	LEFT JOIN salas ON mesas.codsala = salas.codsala 
	LEFT JOIN usuarios ON ventas.codigo = usuarios.codigo 
	WHERE detallepedidos.codpedido = ? AND mesas.empresa = ".$_GET['e']." AND ventas.empresa = ".$_GET['e']." AND salas.empresa = ".$_GET['e']." GROUP BY detallepedidos.codpedido, detallepedidos.pedido";
	$stmt = $this->dbh->prepare($sql);
	$stmt->execute(array($_GET["codpedido"]));
	$num = $stmt->rowCount();

		while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
			$this->p[]=$row;
		}
	return $this->p;
	$this->dbh=null;
}
 else {

$sql = "SELECT * FROM mesas INNER JOIN ventas ON mesas.codmesa = ventas.codmesa INNER JOIN detallepedidos ON detallepedidos.codpedido = ventas.codpedido WHERE mesas.codmesa = ? and mesas.statusmesa = '1'";
	$stmt = $this->dbh->prepare($sql);
	$stmt->execute(array(decrypt($_GET["codmesa"])));
	$num = $stmt->rowCount();
	if($num==0)
	{
	echo "";
	}
   else
   {
	while($row = $stmt->fetch(PDO::FETCH_ASSOC))
		{
			$this->p[]=$row;
		}
		return $this->p;
		$this->dbh=null;
	}
}
}
########################### FUNCION VER DETALLES PEDIDOS EN VENTAS ###########################

############################ FUNCION ID IMPUESTOS #################################
public function ImpuestosPorId()
{
	self::SetNames();
	$sql = "SELECT * FROM impuestos WHERE statusimpuesto = ? AND empresa = ?";
	$stmt = $this->dbh->prepare($sql);
	$stmt->execute(array("ACTIVO", $_GET["e"]));
	$num = $stmt->rowCount();
	if($row = $stmt->fetch(PDO::FETCH_ASSOC))
		{
			$this->p[] = $row;
		}
		return $this->p;
		$this->dbh=null;
}
############################ FUNCION ID IMPUESTOS #################################

}


?>