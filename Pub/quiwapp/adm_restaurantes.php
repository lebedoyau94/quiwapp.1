<?php
require_once("class/class.php");
if (isset($_SESSION['acceso'])) {
    if ($_SESSION['acceso'] == "superadministrador") {

$tra = new Login();
$ses = $tra->ExpiraSession();

if(isset($_POST["proceso"]) and $_POST["proceso"]=="save"){
$reg = $tra->RegistrarConfiguracion();
exit;
}elseif(isset($_POST["proceso"]) and $_POST["proceso"]=="update"){
$reg = $tra->ActualizarConfiguracionAdm();
exit;
}  
?>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="QuiwappDesarrollo">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title></title>

    <!-- Menu CSS -->
    <link href="assets/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- toast CSS -->
    <link href="assets/plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- Sweet-Alert -->
    <link rel="stylesheet" href="assets/css/sweetalert.css">
    <!-- animation CSS -->
    <link href="assets/css/animate.css" rel="stylesheet">
    <!-- needed css -->
    <link href="assets/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="assets/css/default.css" id="theme" rel="stylesheet"> 

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

<body onLoad="muestraReloj()" class="fix-header">
    
   <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>

<!-- sample modal content -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h4 class="modal-title text-white" id="myModalLabel"><i class="fa fa-align-justify"></i> Detalle de Restaurante</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><img src="assets/images/close.png"/></button>
                </div>
                <div class="modal-body">

                <div id="muestrarestaurantemodal"></div> 

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-dark" data-dismiss="modal"><span class="fa fa-times-circle"></span> Cerrar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-boxed-layout="full" data-boxed-layout="boxed" data-header-position="fixed" data-sidebar-position="fixed" class="mini-sidebar"> 
    
        <!-- INICIO DE MENU -->
        <?php include('menu.php'); ?>
        <!-- FIN DE MENU -->
   

        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb border-bottom">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-xs-12 align-self-center">
            <h5 class="font-medium text-uppercase mb-0"><i class="fa fa-tasks"></i> Restaurantes</h5>
                    </div>
                    <div class="col-lg-9 col-md-8 col-xs-12 align-self-center">
                        <nav aria-label="breadcrumb" class="mt-2 float-md-right float-left">
                            <ol class="breadcrumb mb-0 justify-content-end p-0">
                                <li class="breadcrumb-item">Administraci??n</li>
                                <li class="breadcrumb-item active" aria-current="page">Restaurantes</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="page-content container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
               
<!-- Row -->
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header bg-warning">
                <h4 class="card-title text-white"><i class="fa fa-pencil"></i>Gesti??n de Restaurantes</h4>
            </div>
            <form class="form-material" method="post" action="#" name="savempresa" id="savempresa" enctype="multipart/form-data">

            <div id="save">
               <!-- error will be shown here ! -->
           </div>

           <div class="form-body">

            <div class="card-body">

            <div class="row">
                
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Tipo de Documento: </label>
                        <i class="fa fa-bars form-control-feedback"></i> 
                        <select name="documsucursal" id="documsucursal" class='form-control' required="" aria-required="true">
                            <option value="0"> -- SELECCIONE -- </option>
                            <?php
                            $doc = new Login();
                            $doc = $doc->ListarDocumentos();
                            for($i=0;$i<sizeof($doc);$i++){ ?>
                                <option value="<?php echo $doc[$i]['coddocumento'] ?>"<?php if (!(strcmp($reg[0]['documsucursal'], htmlentities($doc[$i]['coddocumento'])))) { echo "selected=\"selected\""; } ?>><?php echo $doc[$i]['documento'] ?></option>
                            <?php }  ?>
                        </select>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">N?? de Registro: <span class="symbol required"></span></label>
                        <input type="hidden" name="proceso" id="proceso" value="save"/>
                        <input type="hidden" class="form-control" name="id" id="id" value="<?php echo $reg[0]['id']; ?>"/>
                        <input type="text" class="form-control" name="cuit" id="cuit" value="<?php echo $reg[0]['cuit']; ?>" onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese N?? de Registro" autocomplete="off" required="" aria-required="true"/> 
                        <i class="fa fa-bolt form-control-feedback"></i> 
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Nombre/Raz??n Social: <span class="symbol required"></span></label>
                        <input type="text" class="form-control" name="nomsucursal" id="nomsucursal" value="<?php echo $reg[0]['nomsucursal']; ?>" onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Nombre de Empresa" autocomplete="off" required="" aria-required="true"/>  
                        <i class="fa fa-pencil form-control-feedback"></i> 
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">N?? de Tel??fono: <span class="symbol required"></span></label>
                        <input type="text" class="form-control phone-inputmask" name="tlfsucursal" id="tlfsucursal" value="<?php echo $reg[0]['tlfsucursal']; ?>" onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese N?? de Tel??fono de Empresa" autocomplete="off" required="" aria-required="true"/>  
                        <i class="fa fa-phone form-control-feedback"></i> 
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Correo Electr??nico: <span class="symbol required"></span></label>
                        <input type="text" class="form-control" name="correosucursal" id="correosucursal" value="<?php echo $reg[0]['correosucursal']; ?>" onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Email de Empresa" autocomplete="off" required="" aria-required="true"/> 
                        <i class="fa fa-envelope-o form-control-feedback"></i> 
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Provincia: </label>
                        <i class="fa fa-bars form-control-feedback"></i> 
                        <select name="id_provincia" id="id_provincia" onChange="CargaDepartamentos(this.form.id_provincia.value);" class='form-control' required="" aria-required="true">
                            <option value="0"> -- SELECCIONE -- </option>
                            <?php
                            $pro = new Login();
                            $pro = $pro->ListarProvincias();
                            for($i=0;$i<sizeof($pro);$i++){ ?>
                                <option value="<?php echo $pro[$i]['id_provincia'] ?>"<?php if (!(strcmp($reg[0]['id_provincia'], htmlentities($pro[$i]['id_provincia'])))) { echo "selected=\"selected\""; } ?>><?php echo $pro[$i]['provincia'] ?></option>
                            <?php }  ?>
                        </select>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Departamento: </label>
                        <i class="fa fa-bars form-control-feedback"></i>
                        <select class="form-control" id="id_departamento" name="id_departamento" required="" aria-required="true">
                            <option value="0"> -- SELECCIONE -- </option>
                            <?php
                            $dep = new Login();
                            $dep = $dep->ListarDepartamentos();
                            for($i=0;$i<sizeof($dep);$i++){ ?>
                                <option value="<?php echo $dep[$i]['id_departamento'] ?>"<?php if (!(strcmp($reg[0]['id_departamento'], htmlentities($dep[$i]['id_departamento'])))) { echo "selected=\"selected\""; } ?>><?php echo $dep[$i]['departamento'] ?></option>
                            <?php }  ?>
                        </select>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Direcci??n: <span class="symbol required"></span></label>
                        <input type="text" class="form-control" name="direcsucursal" id="direcsucursal" value="<?php echo $reg[0]['direcsucursal']; ?>" onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Direcci??n de Empresa" autocomplete="off" required="" aria-required="true"/>  
                        <i class="fa fa-map-marker form-control-feedback"></i> 
                    </div>
                </div>
            </div>


            <div class="row"> 
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">N?? de Actividad: <span class="symbol required"></span></label>
                        <input type="text" class="form-control" name="nroactividad" id="nroactividad" onKeyUp="this.value=this.value.toUpperCase();" value="<?php echo $reg[0]['nroactividad']; ?>" autocomplete="off" placeholder="Ingrese N?? de Actividad" required="" aria-required="true">
                        <i class="fa fa-pencil form-control-feedback"></i> 
                    </div>
                </div> 
                
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">N?? Inicio de Factura: <span class="symbol required"></span></label>
                        <input type="text" class="form-control" name="iniciofactura" id="iniciofactura" onKeyUp="this.value=this.value.toUpperCase();" value="<?php echo $reg[0]['iniciofactura']; ?>" placeholder="Ingrese N?? Inicio de Factura" autocomplete="off" required="" aria-required="true"/> 
                        <i class="fa fa-bolt form-control-feedback"></i>  
                    </div>
                </div> 

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Fecha de Autorizaci??n: <span class="symbol required"></span></label>
                        <input type="text" class="form-control calendario" name="fechaautorizacion" id="fechaautorizacion" onKeyUp="this.value=this.value.toUpperCase();" value="<?php echo $reg[0]['fechaautorizacion'] == '0000-00-00' ? "0000-00-00" : date("d-m-Y",strtotime($reg[0]['fechaautorizacion'])); ?>"  autocomplete="off" placeholder="Ingrese Fecha de Autorizaci??n" required="" aria-required="true">
                        <i class="fa fa-calendar form-control-feedback"></i> 
                    </div>
                </div> 

                <div class="col-md-3"> 
                    <div class="form-group has-feedback"> 
                        <label class="control-label">Lleva Contabilidad: <span class="symbol required"></span></label>
                        <i class="fa fa-bars form-control-feedback"></i>
                        <select name="llevacontabilidad" id="llevacontabilidad" class="form-control" required="" aria-required="true">
                        <option value=""> -- SELECCIONE -- </option>
                        <option value="SI"<?php if (!(strcmp('SI', $reg[0]['llevacontabilidad']))) {echo "selected=\"selected\"";} ?>>SI</option>
                        <option value="NO"<?php if (!(strcmp('NO', $reg[0]['llevacontabilidad']))) {echo "selected=\"selected\"";} ?>>NO</option>
                        </select>
                    </div> 
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Tipo de Documento: </label>
                        <i class="fa fa-bars form-control-feedback"></i> 
                        <select name="documencargado" id="documencargado" class='form-control' required="" aria-required="true">
                            <option value="0"> -- SELECCIONE -- </option>
                            <?php
                            $doc = new Login();
                            $doc = $doc->ListarDocumentos();
                            for($i=0;$i<sizeof($doc);$i++){ ?>
                                <option value="<?php echo $doc[$i]['coddocumento'] ?>"<?php if (!(strcmp($reg[0]['documencargado'], htmlentities($doc[$i]['coddocumento'])))) { echo "selected=\"selected\""; } ?>><?php echo $doc[$i]['documento'] ?></option>
                            <?php }  ?>
                        </select>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                       <label class="control-label">N?? de  Doc. de Encargado: <span class="symbol required"></span></label>
                       <input type="text" class="form-control" cvalue="<?php echo $reg[0]['dniencargado']; ?>" onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese N?? Documento de Gerente" autocomplete="off" required="" aria-required="true"/>  
                       <i class="fa fa-bolt form-control-feedback"></i> 
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Nombre de Encargado: <span class="symbol required"></span></label>
                        <input type="text" class="form-control" name="nomencargado" id="nomencargado" value="<?php echo $reg[0]['nomencargado']; ?>" onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Nombre de Gerente" autocomplete="off" required="" aria-required="true"/>  
                        <i class="fa fa-pencil form-control-feedback"></i> 
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">N?? de Tel??fono: <span class="symbol required"></span></label>
                        <input type="text" class="form-control phone-inputmask" name="tlfencargado" id="tlfencargado" value="<?php echo $reg[0]['tlfencargado']; ?>" onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese N?? de Tel??fono Encargado" autocomplete="off" required="" aria-required="true"/>  
                        <i class="fa fa-phone form-control-feedback"></i> 
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3"> 
                    <div class="form-group has-feedback"> 
                        <label class="control-label">Descto Global: <span class="symbol required"></span></label> 
                        <input type="text" class="form-control" name="descuentoglobal" id="descuentoglobal" onKeyPress="EvaluateText('%f', this);" onBlur="this.value = NumberFormat(this.value, '2', '.', '')" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Descto Global para Ventas" value="<?php echo $reg[0]['descuentoglobal']; ?>" required="" aria-required="true">
                        <i class="fa fa-usd form-control-feedback"></i>  
                    </div> 
                </div>

                <div class="col-md-3"> 
                    <div class="form-group has-feedback"> 
                       <label class="control-label">Porcentaje Calculo Precio Venta: <span class="symbol required"></span></label> 
                       <input type="text" class="form-control" name="porcentaje" id="porcentaje" value="<?php echo $reg[0]['porcentaje']; ?>" onKeyPress="EvaluateText('%f', this);" onBlur="this.value = NumberFormat(this.value, '2', '.', '')" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Porcentaje para Calcular Precio Venta"  required="" aria-required="true">
                       <i class="fa fa-usd form-control-feedback"></i>  
                    </div> 
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Seleccione Moneda Nacional: <span class="symbol required"></span></label>
                        <i class="fa fa-bars form-control-feedback"></i>
                        <select name="codmoneda" id="codmoneda" class='form-control' required="" aria-required="true">
                            <option value="0"> -- SELECCIONE -- </option>
                            <?php
                            $moneda = new Login();
                            $moneda = $moneda->ListarTipoMoneda();
                            for($i=0;$i<sizeof($moneda);$i++){ ?>
                                <option value="<?php echo $moneda[$i]['codmoneda'] ?>"<?php if (!(strcmp($reg[0]['codmoneda'], htmlentities($moneda[$i]['codmoneda'])))) { echo "selected=\"selected\""; } ?>><?php echo $moneda[$i]['moneda'] ?></option>        
                            <?php } ?>
                        </select> 
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Seleccione Moneda para Cambio: <span class="symbol required"></span></label>
                        <i class="fa fa-bars form-control-feedback"></i>
                        <select name="codmoneda2" id="codmoneda2" class='form-control' required="" aria-required="true">
                            <option value=""> -- SELECCIONE -- </option>
                            <?php
                            $moneda = new Login();
                            $moneda = $moneda->ListarTipoMoneda();
                            for($i=0;$i<sizeof($moneda);$i++){ ?>
                                <option value="<?php echo $moneda[$i]['codmoneda'] ?>"<?php if (!(strcmp($reg[0]['codmoneda2'], htmlentities($moneda[$i]['codmoneda'])))) { echo "selected=\"selected\""; } ?>><?php echo $moneda[$i]['moneda'] ?></option>        
                            <?php } ?>
                        </select> 
                    </div>
                </div>
            </div>

            <div class="row">
            <div class="col-md-4">
                  <div class="fileinput fileinput-new" data-provides="fileinput">
                      <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 90px; height: 110px;">
                        <?php if (file_exists("fotos/empresa/logo-".$reg[0]['id'].".png")){
                            echo "<img src='fotos/empresa/logo-".$reg[0]['id'].".png' class='img-rounded' border='0' width='90' height='110' title='Logo' data-rel='tooltip'>"; 
                        } else if(file_exists("fotos/empresa/logo-".$reg[0]['id'].".jpg")) {
                            echo "<img src='fotos/empresa/logo-".$reg[0]['id'].".jpg' class='img-rounded' border='0' width='90' height='110' title='Logo' data-rel='tooltip'>"; echo "<img src='fotos/empresa/logo-".$reg[0]['id'].".png' class='img-rounded' border='0' width='90' height='110' title='Logo' data-rel='tooltip'>"; 
                        }else{
                            echo "<img src='fotos/ninguna.png' class='img-rounded' border='0' width='90' height='110' title='Sin Logo' data-rel='tooltip'>"; 
                        } ?>
                    </div>
                    <div>
                      <span class="btn btn-success btn-file">
                          <span class="fileinput-new"><i class="fa fa-file-image-o"></i> Logo Principal</span>
                          <span class="fileinput-exists"><i class="fa fa-paint-brush"></i> Logo Principal</span>
                          <input type="file" size="10" data-original-title="Subir Logo Principal" data-rel="tooltip" placeholder="Suba su Logo Principal" name="imagen" id="imagen"/>
                      </span>
                      <a href="#" class="btn btn-dark fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times-circle"></i> Remover</a><small><p>Para Subir el Logo Principal debe tener en cuenta:<br> * La Imagen debe ser extension.png<br> * La imagen no debe ser mayor de 200 KB</p></small>                             </div>
                  </div>
              </div>

              <div class="col-md-4">
                  <div class="fileinput fileinput-new" data-provides="fileinput">
                      <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 90px; height: 110px;">
                        <?php if (file_exists("fotos/empresa/logo-pdf".$reg[0]['id'].".png")){
                            echo "<img src='fotos/empresa/logo-pdf".$reg[0]['id'].".png' class='img-rounded' border='0' width='90' height='110' title='Logo' data-rel='tooltip'>"; 
                        } else if(file_exists("fotos/empresa/logo-pdf".$reg[0]['id'].".jpg")) {
                            echo "<img src='fotos/empresa/logo-pdf".$reg[0]['id'].".jpg' class='img-rounded' border='0' width='90' height='110' title='Logo' data-rel='tooltip'>"; 
                        }else{
                            echo "<img src='fotos/ninguna.png' class='img-rounded' border='0' width='90' height='110' title='Sin Logo' data-rel='tooltip'>"; 
                        } ?>
                    </div>
                    <div>
                      <span class="btn btn-success btn-file">
                          <span class="fileinput-new"><i class="fa fa-file-image-o"></i> Logo Reporte #1</span>
                          <span class="fileinput-exists"><i class="fa fa-paint-brush"></i> Logo Reporte #1</span>
                          <input type="file" size="10" data-original-title="Subir Logo #2" data-rel="tooltip" placeholder="Suba su Logo #2" name="imagen2" id="imagen2"/>
                      </span>
                      <a href="#" class="btn btn-dark fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times-circle"></i> Remover</a><small><p>Para Subir el Logo #1 debe tener en cuenta:<br> * La Imagen debe ser extension.png<br> * La imagen no debe ser mayor de 200 KB</p></small>                             </div>
                  </div>
              </div>
          </div>
          </div>

          <div class="text-right">
            <button type="submit" name="btn-submit" id="btn-submit" class="btn btn-warning"><span class="fa fa-save"></span> Guardar</button>
            <button class="btn btn-dark" type="button" onclick="
                document.getElementById('proceso').value = 'save',
                document.getElementById('id').value = '',
                document.getElementById('documsucursal').value = '',
                document.getElementById('cuit').value = '',
                document.getElementById('nomsucursal').value = '',
                document.getElementById('tlfsucursal').value = '',
                document.getElementById('correosucursal').value = '',
                document.getElementById('id_provincia').value = '',
                document.getElementById('id_departamento').value = '',
                document.getElementById('direcsucursal').value = '',
                document.getElementById('documencargado').value = '',
                document.getElementById('dniencargado').value = '',
                document.getElementById('nomencargado').value = '',
                document.getElementById('imagen').value = '',
                document.getElementById('imagen2').value = '',
                document.getElementById('tlfencargado').value = '',
                document.getElementById('descuentoglobal').value = '',
                document.getElementById('porcentaje').value = '',
                document.getElementById('codmoneda').value = '',
                document.getElementById('codmoneda2').value = '',
                document.getElementById('nroactividad').value = '',
                document.getElementById('iniciofactura').value = '',
                document.getElementById('fechaautorizacion').value = '',
                document.getElementById('empresa').value = '',
                document.getElementById('llevacontabilidad').value = ''
                "><span class="fa fa-trash-o"></span> Limpiar</button>
        </div>
    </div>

            </div>
        </form>
    </div>
</div>
</div>
<!-- End Row -->
<!-- Row -->
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header bg-warning">
                <h4 class="card-title text-white"><i class="fa fa-tasks"></i> Restaurantes</h4>
            </div>

            <div class="form-body">

                <div class="card-body">

                    <div class="row">

                        <div class="col-md-7">

                          <div class="btn-group m-b-20">
                            <a class="btn waves-effect waves-light btn-light" href="reportepdf?tipo=<?php echo encrypt("RESTAURANTES") ?>" target="_blank" rel="noopener noreferrer"  data-toggle="tooltip" data-placement="bottom" title="Exportar Pdf"><span class="fa fa-file-pdf-o text-dark"></span> Pdf</a>

                            <a class="btn waves-effect waves-light btn-light" href="reporteexcel?documento=<?php echo encrypt("EXCEL") ?>&tipo=<?php echo encrypt("RESTAURANTES") ?>" data-toggle="tooltip" data-placement="bottom" title="Exportar Excel"><span class="fa fa-file-excel-o text-dark"></span> Excel</a>

                            <a class="btn waves-effect waves-light btn-light" href="reporteexcel?documento=<?php echo encrypt("WORD") ?>&tipo=<?php echo encrypt("RESTAURANTES") ?>" data-toggle="tooltip" data-placement="bottom" title="Exportar Word"><span class="fa fa-file-word-o text-dark"></span> Word</a>
                        </div>
                    </div>
                </div>

                <div id="restaurantes"></div>

            </div>
        </div>
     </div>
  </div>
</div>
<!-- End Row -->
                
                
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                <i class="fa fa-copyright"></i> <span class="current-year"></span>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
   

    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="assets/script/jquery.min.js"></script> 
    <script src="assets/js/bootstrap.js"></script>
    <!-- apps -->
    <script src="assets/js/app.min.js"></script>
    <script src="assets/js/app.init.horizontal-fullwidth.js"></script>
    <script src="assets/js/app-style-switcher.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="assets/js/perfect-scrollbar.js"></script>
    <script src="assets/js/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="assets/js/waves.js"></script>
    <!-- Sweet-Alert -->
    <script src="assets/js/sweetalert-dev.js"></script>
    <!--Wave Effects -->
    <script src="assets/js/waves.js"></script>
     <!--Menu sidebar -->
    <script src="assets/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="assets/js/custom.js"></script>

    <!-- Custom file upload -->
    <script src="assets/plugins/fileupload/bootstrap-fileupload.min.js"></script>


    <!-- script jquery -->
    <script type="text/javascript" src="assets/script/titulos.js"></script>
    <script type="text/javascript" src="assets/script/jquery.mask.js"></script>
    <script type="text/javascript" src="assets/script/mask.js"></script>
    <script type="text/javascript" src="assets/script/script2.js"></script>
    <script type="text/javascript" src="assets/script/validation.min.js"></script>
    <script type="text/javascript" src="assets/script/script.js"></script>
    <script type="text/javascript">
        jQuery.validator.addMethod("lettersonly", function(value, element) {
          return this.optional(element) || /^[a-zA-Z????????????????????????,. ]+$/i.test(value);
      });
    </script>
    <!-- script jquery -->

    <!-- Calendario -->
    <link rel="stylesheet" href="assets/calendario/jquery-ui.css" />
    <script src="assets/calendario/jquery-ui.js"></script>
    <script src="assets/script/jscalendario.js"></script>
    <script src="assets/script/autocompleto.js"></script>
    <!-- Calendario -->

    <!-- jQuery -->
    <script src="assets/plugins/noty/packaged/jquery.noty.packaged.min.js"></script>
    <script type="text/jscript">
    $('#restaurantes').append('<center><i class="fa fa-spin fa-spinner"></i> Por favor espere, cargando registros ......</center>').fadeIn("slow");
    setTimeout(function() {
    $('#restaurantes').load("consultas?CargaRestaurantes=si");
     }, 2000);
    </script>
    <!-- jQuery -->
    

</body>
</html>

<?php } else { ?>   
        <script type='text/javascript' language='javascript'>
        alert('NO TIENES PERMISO PARA ACCEDER A ESTA PAGINA.\nCONSULTA CON EL ADMINISTRADOR PARA QUE TE DE ACCESO')  
        document.location.href='panel'   
        </script> 
<?php } } else { ?>
        <script type='text/javascript' language='javascript'>
        alert('NO TIENES PERMISO PARA ACCEDER AL SISTEMA.\nDEBERA DE INICIAR SESION')  
        document.location.href='logout'  
        </script> 
<?php } ?>