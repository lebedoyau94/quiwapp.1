<?php
include_once('db/pdf.php');
require_once("db/class.php");
//ob_end_clean();
ob_start();

$casos = array (
        
                  'COMANDA' => array(

                                    'medidas' => array('P','mm','ticket'),

                                    'func' => 'TicketComanda',

                                    'setPrintFooter' => 'true',

                                    'output' => array('Ticket de Comanda.pdf', 'I')

                                  ),
        
                  'PRECUENTA' => array(

                                    'medidas' => array('P','mm','ticket'),

                                    'func' => 'TicketPrecuenta',

                                    'setPrintFooter' => 'true',

                                    'output' => array('Ticket de Precuenta.pdf', 'I')

                                  ),
        
                  'TICKET' => array(

                                    'medidas' => array('P','mm','ticket'),

                                    'func' => 'TicketVenta',

                                    'setPrintFooter' => 'true',

                                    'output' => array('Ticket de Venta.pdf', 'I')

                                  ),

                  'FACTURA' => array(

                                    'medidas' => array('P', 'mm', 'A4'),

                                    'func' => 'FacturaVenta',

                                    'output' => array('Factura de Ventas.pdf', 'I')

                                  ),

                );

 
  $tipo = decrypt($_GET['tipo']);
  $codigopedido = decrypt($_GET['codpedido']);
  $_GET['codpedido'] = $codigopedido;
  $caso_data = $casos[$tipo];
  $pdf = new PDF($caso_data['medidas'][0], $caso_data['medidas'][1], $caso_data['medidas'][2]);
  $pdf->AddPage();
  $pdf->SetAuthor("QuiwappDesarrollo");
  $pdf->SetCreator("FPDF Y PHP");
  $pdf->{$caso_data['func']}();
  $pdf->Output($caso_data['output'][0], $caso_data['output'][1]);
  ob_end_flush();

?>