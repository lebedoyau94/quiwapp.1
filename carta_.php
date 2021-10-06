<?php 
require_once("db/class.php"); 
$tra = new Registro();
$monedap = new Registro();
$datos = $_GET["data"];
$identificador = explode("/",$datos) or die ("error");
$_GET["empresa"] = $identificador[0];
$_GET["codmesa"] = end($identificador);
$detalle = $tra->ListarProductosModal();
$cambio = $monedap->MonedaProductoId(); 
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link href="public/css/icomoon/style.css" rel="stylesheet">
    <link href="public/css/padre.css" rel="stylesheet">
    <link href="public/css/campos.css" rel="stylesheet">
    <link href="public/css/tabla.css" rel="stylesheet">
    <link href="public/css/grid.css" rel="stylesheet">
    <!-- Required Stylesheets -->
    <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css" />
    <!-- Required scripts -->
    <script src="https://unpkg.com/vue"></script>
    <script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="quiwapp/assets/images/favicon.png">
    <title>Consulta - Carta</title>
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.20.0/axios.min.js"></script>
    <script src='https://code.jquery.com/jquery-1.12.3.js'></script>
    <script src='https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js'></script>
    <script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js" charset="utf-8"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.1.0/css/responsive.bootstrap.min.css">
    <script>
    $(document).ready(function() {
        $("#example").DataTable({
            // "sPaginationType": "bootstrap",
        });
    });
    </script>
</head>

<body>
    <div class="main bg_imagen" id="app">
        <body-vue></body-vue>
    </div>

    <script>
    var detalle = <?php echo json_encode($detalle); ?>;
    console.log(JSON.stringify(detalle));
    console.log(detalle.length);

    function llamar() {
        $.ajax({
            url: 'db/llamar.php',
            type: "POST",
            //dataType: "html",
            data: {
                'action': '1',
                'empresa': <?php echo $_GET["empresa"]; ?>,
                'mesa': <?php echo $_GET["codmesa"]; ?>,
            },
        }).done(function(data) {
            console.log("result : " + data);
            //location.reload();
            alert("Se Realizo la llamada Espere.");
        });
    }
    </script>
    <script>
    Vue.component('header-vue', {
        template: `
		<header class="b_b h2_5 vw100 flex f_between p_f bg_white">   
			<p class="f_orange f1_5">{{titulo}}</p>
			<div class="h100_ flex">
				<button class="btn-gr">Menu</button>
				<button class="btn-gr">Consumo</button>
			</div>
		</header>
	`,

        data() {
            return {
                titulo: 'Consulta - Carta'
            }
        },
        mounted() {

        },
        methods: {
            iniciar: function() {
                console.log(this.titulo);
            }
        }
        //v-on:keyup="filtro_producto(t_busq_producto)"
    });

    Vue.component('body-vue', {
        template: ` 
        <div class="content_carta">
        
            <p class="center f2 f_orange sombra_text"><?php echo $cambio[0]['nomsucursal'] ?> - CARTA</p>
            <div class="stretch_v center content_tabla"> 
                <div class="grid_busqueda">                          
                    <input type="text" 
                    v-model="t_busq_producto" id="ipt_t_cisterna_busqueda"                    
                    >
                    <label for="ipt_t_cisterna_busqueda" class="icon-search"></label>
                </div> 
                <div class="stretch_v stretch content_tab c_t_carta sombra_ext" style="width: 105%;">
                    <table class="tab_x t_carta" cellspacing="0">
                        <thead>
                            <tr>
                                <th class="hfijo_x tl w10" style="width: 60%;">Producto</th>
                                <th class="hfijo tr">Precio U.</th> 
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="item in filtro_detalle">
                                <td class="tl fijo_x w10">
                                    {{item.producto}}
                                </td>
                                <td class="tr"> <?php echo $cambio[0]['simbolo'] ?> {{item.precioventa}}
                                </td>
                            </tr>                            
                        </tbody>
                    </table>
                </div>
		    </div>
            <div class="center flex_around">
                <button class="m1 center button_mini border_orange bg_orange sombra_text" onclick="window.history.back();">
                    <i class="icon-arrow-left"></i>
                    Atras
                </button>
                <button class="m1 center button_mini border_blue bg_SteelBlue sombra_text"  onclick="llamar();">
                    <i class="icon-phone"></i>
                    Llamar
                </button>
            </div>
		</div>
	`,
        /*<div class="vh70 center w17 block bg_yellow">
                    <div class="table-responsive">
                        <table id="example" class="table table-hover nowrap" style="width:100%;">
                            <thead class="thead-light">
                                <tr>
                                <th class="f1 f_marlboro" style="font-size:24px;  width: 60%;">Producto</th>
                                <th class="f1 f_marlboro" style="font-size:24px">Precio U.</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="item in detalle">
                                <td class="f1 f_marlboro">{{item.producto}}</td>
                                <td class="f1 f_marlboro"> <?php //echo $cambio[0]['simbolo'] ?> {{item.precioventa}}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>*/
        data() {
            return {
                t_busq_producto: '',
                logo: '..',
                listaConsumo: [],
                total: 0
            }

        },
        mounted() {},
        methods: {

        },
        computed: {
            filtro_detalle() {
                let self = this;
                let fil = detalle.filter((item) => {
                    return item.producto.includes(self.t_busq_producto.toUpperCase());
                });
                return fil;
            }
        }

    });

    new Vue({
        el: '#app'
    });
    </script>
</body>

</html>