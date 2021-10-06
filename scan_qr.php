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
    <title></title>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.12.1/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
        type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body id="page-top" onload="load()">

    <div class="container">

        <object id="iembedflash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="320"
            height="240">
            <param name="movie" value="camcanvas.swf" />
            <param name="quality" value="high" />
            <param name="allowScriptAccess" value="always" />
            <embed allowScriptAccess="always" id="embedflash" src="camcanvas.swf" quality="high" width="320"
                height="240" type="application/x-shockwave-flash"
                pluginspage="http://www.macromedia.com/go/getflashplayer" mayscript="true" />
        </object>

    </div>
    <button onclick="captureToCanvas()">Capture</button><br>
    <canvas id="qr-canvas" width="640" height="480"></canvas>

    </div>

    <!-- Modal -->
    <!-- Bootstrap core JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <!-- Third party plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/@zxing/library@latest"></script>
    <!-- Contact form JS-->
    <script src="assets/mail/jqBootstrapValidation.js"></script>
    <script src="assets/mail/contact_me.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>

    <script type="text/javascript" src="qr/grid.js"></script>
    <script type="text/javascript" src="qr/version.js"></script>
    <script type="text/javascript" src="qr/detector.js"></script>
    <script type="text/javascript" src="qr/formatinf.js"></script>
    <script type="text/javascript" src="qr/errorlevel.js"></script>
    <script type="text/javascript" src="qr/bitmat.js"></script>
    <script type="text/javascript" src="qr/datablock.js"></script>
    <script type="text/javascript" src="qr/bmparser.js"></script>
    <script type="text/javascript" src="qr/datamask.js"></script>
    <script type="text/javascript" src="qr/rsdecoder.js"></script>
    <script type="text/javascript" src="qr/gf256poly.js"></script>
    <script type="text/javascript" src="qr/gf256.js"></script>
    <script type="text/javascript" src="qr/decoder.js"></script>
    <script type="text/javascript" src="qr/qrcode.js"></script>
    <script type="text/javascript" src="qr/findpat.js"></script>
    <script type="text/javascript" src="qr/alignpat.js"></script>
    <script type="text/javascript" src="qr/databr.js"></script>

    <script type="text/javascript">
    var gCtx = null;
    var gCanvas = null;

    var imageData = null;
    var ii = 0;
    var jj = 0;
    var c = 0;


    function dragenter(e) {
        e.stopPropagation();
        e.preventDefault();
    }

    function dragover(e) {
        e.stopPropagation();
        e.preventDefault();
    }

    function drop(e) {
        e.stopPropagation();
        e.preventDefault();

        var dt = e.dataTransfer;
        var files = dt.files;

        handleFiles(files);
    }

    function handleFiles(f) {
        var o = [];
        for (var i = 0; i < f.length; i++) {
            var reader = new FileReader();

            reader.onload = (function(theFile) {
                return function(e) {
                    qrcode.decode(e.target.result);
                };
            })(f[i]);

            // Read in the image file as a data URL.
            reader.readAsDataURL(f[i]);
        }
    }

    function read(a) {
        alert(a);
    }

    function load() {
        initCanvas(640, 480);
        qrcode.callback = read;
        qrcode.decode("qr/test.png");
    }

    function initCanvas(ww, hh) {
        gCanvas = document.getElementById("qr-canvas");
        gCanvas.addEventListener("dragenter", dragenter, false);
        gCanvas.addEventListener("dragover", dragover, false);
        gCanvas.addEventListener("drop", drop, false);
        var w = ww;
        var h = hh;
        gCanvas.style.width = w + "px";
        gCanvas.style.height = h + "px";
        gCanvas.width = w;
        gCanvas.height = h;
        gCtx = gCanvas.getContext("2d");
        gCtx.clearRect(0, 0, w, h);
        imageData = gCtx.getImageData(0, 0, 320, 240);
    }

    function passLine(stringPixels) {
        //a = (intVal >> 24) & 0xff;

        var coll = stringPixels.split("-");

        for (var i = 0; i < 320; i++) {
            var intVal = parseInt(coll[i]);
            r = (intVal >> 16) & 0xff;
            g = (intVal >> 8) & 0xff;
            b = (intVal) & 0xff;
            imageData.data[c + 0] = r;
            imageData.data[c + 1] = g;
            imageData.data[c + 2] = b;
            imageData.data[c + 3] = 255;
            c += 4;
        }

        if (c >= 320 * 240 * 4) {
            c = 0;
            gCtx.putImageData(imageData, 0, 0);
        }
    }

    function captureToCanvas() {
        flash = document.getElementById("embedflash");
        flash.ccCapture();
        qrcode.decode();
    }
    </script>

</body>

</html>