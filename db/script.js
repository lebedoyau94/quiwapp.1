

$('document').ready(function () {
	/* validation */
	$("#savempresa").validate({
		rules:
		{
			documsucursal: { required: false },
			cuit: { required: true, digits: false },
			nomsucursal: { required: true },
			tlfsucursal: { required: true, digits: false },
			correosucursal: { required: true, email: true },
			//id_provincia: { required: false },
			id_departamento: { required: false },
			direcsucursal: { required: true },
			//nroactividad: { required: true },
			//iniciofactura: { required: true, digits: false },
			//fechaautorizacion: { required: true },
			//llevacontabilidad: { required: true },
			documencargado: { required: false },
			dniencargado: { required: true, number: true },
			nomencargado: { required: true, lettersonly: true },
			tlfencargado: { required: true, digits: false },
			//descuentoglobal: { required: true, number: true },
			//porcentaje: { required: true, number: true },
			//codmoneda: { required: true },
			//codmoneda2: { required: true },
		},
		messages:
		{
			documsucursal: { required: "Seleccione Tipo de Documento" },
			cuit: { required: "Ingrese N&deg; de Empresa", digits: "Ingrese solo digitos para N&deg; de Empresa" },
			nomsucursal: { required: "Ingrese Nombre de Empresa" },
			tlfsucursal: { required: "Ingrese N&deg; de Tel&eacute;fono de Empresa", digits: "Ingrese solo digitos para Tel&eacute;fono" },
			correosucursal: { required: "Ingrese Email de Empresa", email: "Ingrese un Correo v&aacute;lido" },
			id_provincia: { required: "Seleccione Provincia" },
			id_departamento: { required: "Seleccione Departamento" },
			direcsucursal: { required: "Ingrese Direcci&oacute;n de Empresa" },
			nroactividad: { required: "Ingrese N&deg; de Actividad", digits: "Ingrese solo digitos para N&deg; de Actividad" },
			iniciofactura: { required: "Ingrese N&deg; de Inicio de Factura", digits: "Ingrese solo digitos para N&deg; de Inicio de Fcatura" },
			fechaautorizacion: { required: "Ingrese Fecha de Autorizaci&oacute;n" },
			llevacontabilidad: { required: "Seleccione si lleva Contabilidad" },
			documencargado: { required: "Seleccione Tipo de Documento" },
			dniencargado: { required: "Ingrese N&deg; de Documento de Encargado", number: "Ingrese solo numeros" },
			nomencargado: { required: "Ingrese Nombre de Encargado", lettersonly: "Ingrese solo letras para Nombres" },
			tlfencargado: { required: "Ingrese N&deg; de Tel&eacute;fono de Encargado", digits: "Ingrese solo digitos para Tel&eacute;fono" },
			descuentoglobal: { required: "Ingrese Descto Global para Ventas", number: "Ingrese solo digitos con 2 decimales" },
			porcentaje: { required: "Ingrese Porcentaje Precio Venta", number: "Ingrese solo numeros con dos decimales" },
			codmoneda: { required: "Seleccione Moneda Nacional" },
			codmoneda2: { required: "Seleccione Moneda para Cambio" },
		},
		submitHandler: function (form) {

			var data = $("#savempresa").serialize();
			var formData = new FormData($("#savempresa")[0]);

			$.ajax({
				type: 'POST',
				url: 'registrase.php',
				async: false,
				data: formData,
				//necesario para subir archivos via ajax
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function () {
					$("#save").fadeOut();
					$("#btn-submit").html('<i class="fa fa-refresh"></i> Verificando...');
				},
				success: function (data) {
					if (data == 1) {

						$("#save").fadeIn(1000, function () {

							var n = noty({
								text: "<span class='fa fa-warning'></span> LOS CAMPOS NO PUEDEN IR VACIOS, VERIFIQUE NUEVAMENTE POR FAVOR...!",
								theme: 'defaultTheme',
								layout: 'center',
								type: 'error',
								timeout: 5000,
							});
							$("#btn-submit").html('<span class="fa fa-edit"></span> Actualizar');

						});

					} else if (data == 2) {

						$("#save").fadeIn(1000, function () {

							var n = noty({
								text: "<span class='fa fa-warning'></span> YA EXISTE UN RESTAURANTE CON ESE NOMBRE, VERIFIQUE NUEVAMENTE POR FAVOR ...!",
								theme: 'defaultTheme',
								layout: 'center',
								type: 'warning',
								timeout: 5000,
							});
							$("#btn-submit").html('<span class="fa fa-save"></span> Guardar');

						});
					} else {

						$("#save").fadeIn(1000, function () {

							var n = noty({
								text: '<center> ' + data + ' </center>',
								theme: 'defaultTheme',
								layout: 'center',
								type: 'success',
								timeout: 5000,
							});
							$("#savempresa")[0].reset();
							$("#proceso").val("save");
							//$('#restaurantes').html("");
							$("#btn-submit").html('<span class="fa fa-save"></span> Guardar');
							//$('#restaurantes').append('<center><i class="fa fa-spin fa-spinner"></i> Por favor espere, cargando registros ......</center>').fadeIn("slow");
						});
					}
				}
			});
			return false;
		}
		/* form submit */
	});
});
/* FIN DE  FUNCION JQUERY PARA VALIDAR ACTUALIZACION DE CONFIGURACION GENERAL */
