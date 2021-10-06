<?php 
require_once("db/class.php"); 
$tra = new Registro();
$monedap = new Registro();
$empresa = $_GET["e"];
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
     <!-- Required Stylesheets -->
    <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css" />
    <!-- Required scripts -->
    <script src="https://unpkg.com/vue"></script>
    <script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="quiwapp/assets/images/favicon.png">
    <title>Consulta - Carta</title>
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.20.0/axios.min.js"></script>
    <script src="quiwapp/assets/js/bootstrap.js"></script>
</head>

<body>
    <div class="main bg_imagen" id="app">

        <body-vue></body-vue>
    </div>
    <!--<script src="public/js/app.js">
    </script>-->
    <script>
    var detalle = <?php echo json_encode($detalle); ?>;
    console.log(detalle);
    console.log(detalle.length);
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

    });

    Vue.component('body-vue', {
        template: ` 
        <div class="content_consumo center">
            <div class="h5 w100_ tc pd02">
                <img src="quiwapp/fotos/empresa/logo-1.png" class="w100_ h100_">
                <p class="f2 f_orange"><?php echo $cambio[0]['nomsucursal'] ?> - CARTA</p>
            </div>
            <div class="h2 w100_ tc pd01"></div>
        <div class="scroll_v">
                <div class="item_flex" v-for="(item, index) in detalle" :key=index>
					<div class="item_flex f_around "> 
                        <div>
                            <p class="f1 f_ubuntu" style="margin-bottom: 0rem;">______________________________</p>
							<p class="f2 f_marlboro" style="font-size: 18px; margin-bottom: 0rem;">Producto : {{item.producto}}</p>
                            <p class="f2 f_marlboro" style="font-size: 18px; margin-bottom: -1rem;">Precio U.: {{item.precioventa}} <?php echo $cambio[0]['simbolo'] ?></p>
						</div>
            
                    </div>
				</div>
		</div>
		</div>
	`,

        data() {
            return {
                logo: '..',
                listaConsumo: [],
                total: 0
            }

        },
        mounted() {},
        methods: {},
        computed: {

        }

    });

    new Vue({
        el: '#app'
    });
    </script>
</body>

</html>