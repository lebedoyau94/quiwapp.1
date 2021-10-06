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
		iniciar: function () {
			console.log(this.titulo);
		}
	}

});

Vue.component('body-vue', {
	template: ` 
		<div class="content_consumo center">
			<div class="h5 w100_ tc pd02">
				<img src="public/imagenes/logores.png" class="w100_ h100_">
			</div>
			<div class="scroll_v">
				<div class="item_flex"
					v-for="(item, index) in listaConsumo"
		            :key=index
				>
					<div class="h8 w10 tc">
						<img :src="item.imagen" class="h7 w7 circulo">
					</div>
					<div class="item_flex f_around tc"> 
						<div>
							<p class="f2 f_orange">{{item.nombre}}</p>
							<p class="f1 f_ubuntu">{{item.descripcion}}</p>
						</div>
					
						<div class="tc">
							<p class="f2 f_marlboro"> Bs{{item.precio}}.-</p>
						</div>
					</div>
				</div>
			</div>
			<div class="h2_5 w100_ tc flex f_around sombra_int">
				<p class="f_print_bold_tt f2 sombra_text">Mesa: {{mesa}}</p>
				<p class="f_print_bold_tt f2 sombra_text">Precio total:bs{{totales}}.-</p>
			</div>
		</div>
	`,

	data() {
		return {
			logo: '..',
			mesa: 1,
			listaConsumo: [
				{ imagen: 'public/imagenes/comida.jpg', descripcion: 'Majadito batido', precio: 10, nombre: 'Majadito' },
				{ imagen: 'public/imagenes/coca_cola.jpeg', descripcion: 'Soda gaseosa de 2 litros', precio: 10, nombre: 'Coca cola' },
				{ imagen: 'public/imagenes/comida.jpg', descripcion: 'coca cola 2 litros', precio: 10, nombre: 'Hamburguesa' },
				{ imagen: 'public/imagenes/hamburguesa.jpg', descripcion: 'coca cola 2 litros', precio: 10, nombre: 'Pike' },
				{ imagen: 'public/imagenes/sidra.png', descripcion: 'Bebida dulce de 1 litro', precio: 10, nombre: 'Sidra' },
				{ imagen: 'public/imagenes/vino.png', descripcion: 'coca cola 2 litros', precio: 10, nombre: 'Kollberg' },
				{ imagen: 'public/imagenes/comida.jpg', descripcion: 'coca cola 2 litros', precio: 10, nombre: 'Pacumuto' }
			],
			total: 0
		}
		
	},
	mounted() {
		//this.getDetalle()
		var dataString = 'cargardatos=si&codmesa=' + 2;
		$.ajax({
			type: "GET",
			url: "consulta.php",
			data: dataString,
			success: function (response) {
				console.log(this.response)
			}
		  });
	},
	methods: {
		getDetalle: function () {
			return Axios
			  .get('consulta.php')
			  .then(response => {
				this.detalle = response.data
				console.log(this.detalle)
				return this.detalle
			  })
		  },
	},
	computed: {
		totales: function () {
			const tot = this.listaConsumo.reduce((total, item) => {
				return total + item.precio;
			}, 0);
			return tot;
		}
	}

});

new Vue({
	el: '#app'
});
//icon-book1