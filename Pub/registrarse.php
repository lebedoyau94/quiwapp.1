<?php
require_once("db/class.php");
$tra = new Registro();
if(isset($_POST["proceso"]) and $_POST["proceso"]=="save"){
    $reg = $tra->RegistrarConfiguracion();
    exit;
}
?>
<!DOCTYPE html>
<html lang="es">
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
    <link rel="icon" type="image/png" sizes="16x16" href="quiwapp/assets/images/favicon.png">
    <title>Quiwapp - Registro</title>
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.12.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <!-- toast CSS -->
    <link href="quiwapp/assets/plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- Sweet-Alert -->
    <link rel="stylesheet" href="quiwapp/assets/css/sweetalert.css">
    <!-- animation CSS -->
    <link href="quiwapp/assets/css/animate.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="index.html"><img src="quiwapp/fotos/logo-principal.png" alt="150" width="150"/></a><button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">Precios</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#about">Nosotros</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">Contacto</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="registrarse.php">Registrarse</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="quiwapp/index.php">Inicia sesión</a></li>
                    </ul>
                </div>
            </div>
        </nav>
         
        <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <!--Cuerpo-->
        <div class="card-body">
        <div class="row">
    <div class="col-lg-12">
     <form id="formularioderegistro" name="savempresa" id="savempresa" accept-charset="UTF-8" action="#" method="POST">

     <div id="save">
        <div class="row">
                
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Tipo de Documento: </label>
                        <select name="documsucursal" id="documsucursal" class='form-control' required="" aria-required="true">
                            <option value="0"> -- SELECCIONE -- </option>
                            <?php
                            $doc = new Registro();
                            $doc = $doc->ListarDocumentos();
                            for($i=0;$i<sizeof($doc);$i++){ ?>
                                <option value="<?php echo $doc[$i]['coddocumento'] ?>" ><?php echo $doc[$i]['documento'] ?></option>
                            <?php }  ?>
                        </select>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <input type="hidden" name="proceso" id="proceso" value="save"/>
                        <label class="control-label">Nº de Registro:<span class="symbol required"></span></label>
                        <input type="hidden" class="form-control" name="id" id="id"/>
                        <input type="text" class="form-control" name="cuit" id="cuit" onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Nº de Registro" autocomplete="off" required="" aria-required="true"/>  
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Nombre/Razón Social:<span class="symbol required"></span></label>
                        <input type="text" class="form-control" name="nomsucursal" id="nomsucursal"  onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Nombre de Empresa" autocomplete="off" required="" aria-required="true"/>  
                         
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Correo Electrónico: <span class="symbol required"></span></label>
                        <input type="email" class="form-control" name="correosucursal" id="correosucursal"  onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Email de Empresa" autocomplete="off" required="" aria-required="true"/> 
                        </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Usuario de Acceso:<span class="symbol required"></span></label>
                        <input type="text" class="form-control" name="usuario" id="usuario"  onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Nombre de Empresa" autocomplete="off" required="" aria-required="true"/>  
                         
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Contraseña: <span class="symbol required"></span></label>
                        <input type="password" class="form-control" name="password" id="password"  onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese contraseña" autocomplete="off" required="" aria-required="true"/> 
                        </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Nº de Teléfono: <span class="symbol required"></span></label>
                        <input type="text" class="form-control phone-inputmask" name="tlfsucursal" id="tlfsucursal"  onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Nº de Teléfono de Empresa" autocomplete="off" required="" aria-required="true"/> 
                    </div>
                </div>
                            
                 

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Ciudad: </label>
                        <select class="form-control" id="id_departamento" name="id_departamento" required="" aria-required="true">
                            <option value="0"> -- SELECCIONE -- </option>
                            <?php
                            $dep = new Registro();
                            $dep = $dep->ListarDepartamentos();
                            for($i=0;$i<sizeof($dep);$i++){ ?>
                                <option value="<?php echo $dep[$i]['id_departamento'] ?>"><?php echo $dep[$i]['departamento'] ?></option>
                            <?php }  ?>
                        </select>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Dirección: <span class="symbol required"></span></label>
                        <input type="text" class="form-control" name="direcsucursal" id="direcsucursal"  onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Dirección de Empresa" autocomplete="off" required="" aria-required="true"/>  
                         
                    </div>
                </div>
                
                              
                
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Tipo de Documento: </label>
                        <select name="documencargado" id="documencargado" class='form-control' required="" aria-required="true">
                            <option value="0"> -- SELECCIONE -- </option>
                            <?php
                            $doc = new Registro();
                            $doc = $doc->ListarDocumentos();
                            for($i=0;$i<sizeof($doc);$i++){ ?>
                                <option value="<?php echo $doc[$i]['coddocumento'] ?>"><?php echo $doc[$i]['documento'] ?></option>
                            <?php }  ?>
                        </select>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <input type="hidden" name="proceso" id="proceso" value="save"/>
                        <label class="control-label">Nº de Doc. de Encargado:<span class="symbol required"></span></label>
                        <input type="text" class="form-control" name="dniencargado" id="dniencargado"  onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Nº de Registro" autocomplete="off" required="" aria-required="true"/>  
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Nombre de Encargado: <span class="symbol required"></span></label>
                        <input type="text" class="form-control" name="nomencargado" id="nomencargado"  onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Nombre de Gerente" autocomplete="off" required="" aria-required="true"/>  
                         
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Nº de Teléfono: <span class="symbol required"></span></label>
                        <input type="text" class="form-control phone-inputmask" name="tlfencargado" id="tlfencargado"  onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Nº de Teléfono Encargado" autocomplete="off" required="" aria-required="true"/>  
                         
                    </div>
                </div>

                <div class="col-md-3">
                        <div class="form-group has-feedback">
                            <label class="control-label">Sexo de Usuario: <span class="symbol required"></span></label>
                            <i class="fa fa-bars form-control-feedback"></i>
                            <select name="sexo" id="sexo" class="form-control" required="" aria-required="true">
                                <option value=""> -- SELECCIONE -- </option>
                                <option value="MASCULINO">MASCULINO</option>
                                <option value="FEMENINO">FEMENINO</option>
                            </select> 
                        </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group has-feedback">
                        <label class="control-label">Dirección Domiciliaria: <span class="symbol required"></span></label>
                        <input type="text" class="form-control" name="direccion" id="direccion"  onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Dirección de Empresa" autocomplete="off" required="" aria-required="true"/>  
                         
                    </div>
                </div>

                <div class="col-md-3"> 
                    <div class="form-group has-feedback"> 
                       <label class="control-label">Porcentaje Calculo Precio Venta: <span class="symbol required"></span></label> 
                       <input type="text" class="form-control" name="porcentaje" id="porcentaje" value="0.00" onKeyPress="EvaluateText('%f', this);" onBlur="this.value = NumberFormat(this.value, '2', '.', '')" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Porcentaje para Calcular Precio Venta"  required="" aria-required="true">
                    </div> 
                </div>
                    
                </div>
             

                    <div class="text-center">
                        <button type="submit" name="btn-update" id="btn-update" class="btn btn-warning"><span class="fa fa-save"></span> Registrame</button>
                        <button class="btn btn-dark" type="reset"><span class="fa fa-trash-o"></span> Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</div>
</div>
        <!--Cuerpo-->
        </header>

               
        <!-- Footer-->
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h7 class="text-uppercase mb-4">Ubicacion</h7>
                        <p class="lead mb-0"><br /></p>
                    </div>
                    <!-- Footer Social Icons-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h7 class="text-uppercase mb-4">Redes:</h7>
                        <a class="btn btn-outline-light btn-social mx-1" href="#"><i class="fab fa-fw fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#"><i class="fab fa-fw fa-twitter"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#"><i class="fab fa-fw fa-linkedin-in"></i></a>
                    </div>
                    <!-- Footer About Text-->
                    <div class="col-lg-4">
                       <p class="lead mb-0">Todos los Derechos Reservados. QuiwappDesarollo &copy; 2020<a href=""></a>.</p>
                    </div>
                </div>
            </div>
        </footer>
        
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
        <div class="scroll-to-top d-lg-none position-fixed">
            <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i class="fa fa-chevron-up"></i></a>
        </div>
        
        <!-- Sweet-Alert -->
        <script src="quiwapp/assets/js/sweetalert-dev.js"></script>                    
        <script type="text/javascript" src="quiwapp/assets/script/jquery.mask.js"></script>
        <script type="text/javascript" src="quiwapp/assets/script/mask.js"></script>
        <script type="text/javascript" src="quiwapp/assets/script/validation.min.js"></script>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script type="text/javascript" src="db/script.js"></script>
        <script src="quiwapp/assets/plugins/noty/packaged/jquery.noty.packaged.min.js"></script>
    </body>
</html>
