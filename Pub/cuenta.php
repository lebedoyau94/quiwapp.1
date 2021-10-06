<?php 
require_once("db/class.php"); 
$tra = new Registro();
$datos = $_GET["data"];
$identificador = explode("/",$datos) or die ("error");
$_GET["empresa"] = $identificador[0];
$_GET["codmesa"] = end($identificador);
$detalle = $tra->detalle_mesa();
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
    <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css" />
    <!-- Required scripts -->
    <script src="https://unpkg.com/vue"></script>
    <script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="quiwapp/assets/images/favicon.png">
    <title>Consulta - Mesas</title>
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
    var totales = 0;
    var mesa = detalle[0].mesa;
    for (var i = 0; i < detalle.length; i++) {
        totales = totales + detalle[i].subtotal;
    }

    function trunc(x, posiciones = 0) {
        var s = x.toString()
        var l = s.length
        var decimalLength = s.indexOf('.') + 1
        var numStr = s.substr(0, decimalLength + posiciones)
        return Number(numStr)
    }
    console.log("Totales :" + totales);
    console.log("size : " + detalle.length);
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
                titulo: 'Consulta - Mesa'
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
        <div class="content_carta">
            <div class="h5 w100_ tc pd02">
                <img src="quiwapp/fotos/empresa/logo-1.png" class="w100_ h100_">            
            </div>

            <div class="center estretch_v scroll_v" style="width:100%; height:500px; overflow: scroll; display: flow-root list-item;">

                <div class="d_n" v-if="!detalle || !detalle.length">
                    <p class="f_print_bold_tt f2 sombra_text" 
                    style="text-align: center; color: green; ont-size: 60px;">
                        Mesa Disponible
                    </p>
                </div>
        
               

                <div class="item_flex" v-else v-for="(item, index) in detalle" :key=index>
					
					<div class="item_flex f_around tc"> 
						<div>
							<p class="f2 f_orange" style="font-size: 20px; text-align: left;margin-bottom: 0rem;">{{item.producto}}</p>
							<p class="f1 f_ubuntu" style="text-align: left;">Cantidad : {{item.cantventa}} Precio : {{item.valortotal}}$</p>
						</div>
					
						<div class="tc">
							<p class="f2 f_marlboro subtotal"  style="font-size: 24px;">$ {{item.subtotal}}.-</p>
                        </div>
                    </div>
                </div>
                <div class="h1_5 w100_ tc flex f_around sombra_int" style="float: inline-end;position: inherit;">
				<p class="f_print_bold_tt f2 sombra_text" >{{mesa}}</p>
				<p class="f_print_bold_tt f2 sombra_text" style="font-size: 30px;">Precio total:$ {{totales}}.-</p>
			</div>
            
            </div>
           
			
		</div>
	`,

        data() {
            return {
                logo: '..',
                mesa_disponible: true, //true o false true es mesa disponible
                mesa: mesa,
                listaConsumo: [{
                        imagen: 'public/imagenes/comida.jpg',
                        descripcion: 'Majadito batido',
                        precio: 10,
                        nombre: 'Majadito'
                    },
                    {
                        imagen: 'public/imagenes/coca_cola.jpeg',
                        descripcion: 'Soda gaseosa de 2 litros',
                        precio: 10,
                        nombre: 'Coca cola'
                    },
                    {
                        imagen: 'public/imagenes/comida.jpg',
                        descripcion: 'coca cola 2 litros',
                        precio: 10,
                        nombre: 'Hamburguesa'
                    },
                    {
                        imagen: 'public/imagenes/hamburguesa.jpg',
                        descripcion: 'coca cola 2 litros',
                        precio: 10,
                        nombre: 'Pike'
                    },
                    {
                        imagen: 'public/imagenes/comida.jpg',
                        descripcion: 'Majadito batido',
                        precio: 10,
                        nombre: 'Majadito'
                    },
                    {
                        imagen: 'public/imagenes/coca_cola.jpeg',
                        descripcion: 'Soda gaseosa de 2 litros',
                        precio: 10,
                        nombre: 'Coca cola'
                    },
                    {
                        imagen: 'public/imagenes/comida.jpg',
                        descripcion: 'coca cola 2 litros',
                        precio: 10,
                        nombre: 'Hamburguesa'
                    },
                    {
                        imagen: 'public/imagenes/hamburguesa.jpg',
                        descripcion: 'coca cola 2 litros',
                        precio: 10,
                        nombre: 'Pike'
                    },


                ],
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
    //icon-book1
    </script>
</body>

</html>