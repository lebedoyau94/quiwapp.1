<!DOCTYPE html>
<html>

<head>
    <title>Escanear Qr - Quiwapp</title>
    <meta charset="UTF-8" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="quiwapp/assets/images/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/style.css" />
    <script src="https://rawgit.com/sitepoint-editors/jsqrcode/master/src/qr_packed.js"></script>
</head>

<body style="background: #1abc9c;">
    <div id="container">
        <h1 style="font-size: xx-large">Lector QR Quiwapp</h1>
        <!--<div class="div">      
        	<img src="assets/giro camara.png" class="img btn-gr" onclick="changeCamera()" id="camera" title="">        
      </div>
      <div class="contenedor_video">
      		<video id="video" autoplay muted poster="assets/qr_icon.svg"></video>   
      </div>-->
        <div class="div" >
        <img src="assets/giro camara.png" class="img btn-gr" onclick="changeCamera()" id="camera" title="">
        </div>
        <div class="contenedor_video" >
            <a id="btn-scan-qr">
              <img src="assets/qr_icon.svg">
            <a />
          <canvas hidden="" id="qr-canvas"></canvas>
        </div>
        <div id="qr-result" hidden="">
            <b style="display : none ">Data:</b> <span style="display : none " id="outputData"></span>
            <a href="" target="_bank" id="link">Consultar Mesa</a>
        </div>
    </div>

    <script src="js/qrCodeScanner.js"></script>

</body>
<script>

</script>

</html>