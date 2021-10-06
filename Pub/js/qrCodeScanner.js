//const qrcode = window.qrcode;

const video = document.createElement("video");
const canvasElement = document.getElementById("qr-canvas");
const canvas = canvasElement.getContext("2d");

const qrResult = document.getElementById("qr-result");
const outputData = document.getElementById("outputData");
const btnScanQR = document.getElementById("btn-scan-qr");
const btnLink = document.getElementById("link");
const btnCam = document.getElementById("camera");

let scanning = false;
var front = false;
//var mediaDevices = navigator.mediaDevices;
qrcode.callback = res => {
  console.log(res);
  var result = res.search("quiwapp.com/consulta.php");
  console.log(result);
  if (res) {
    outputData.innerText = res;
    //btnLink.innerHref = res;
    if(result != -1){
    document.getElementById('link').setAttribute('href', 'https://' + res);
    scanning = false;
    video.srcObject.getTracks().forEach(track => {
      track.stop();
    });
    qrResult.hidden = false;
    canvasElement.hidden = true;
    btnScanQR.hidden = false;
    }else{
      alert(' Mesa No Encontrada, Intente de Nuevo ');
      btnScanQR.onclick();
    }
  }
};

btnCam.onclick = () => {
  if (front) {
    front = false;
    btnScanQR.onclick();
    document.getElementById("camera").innerHTML = "Principal";
  } else {
    front = true;
    btnScanQR.onclick();
    document.getElementById("camera").innerHTML = "Frontal";
  }
}
btnScanQR.onclick = () => {
  //var front = document.getElementById('flip-button').onclick = function () { front = !front; }
  navigator.mediaDevices
    .getUserMedia({ video: { facingMode: (front ? "user" : "environment") } })
    .then(function (stream) {
      scanning = true;
      qrResult.hidden = true;
      btnScanQR.hidden = true;
      canvasElement.hidden = false;
      video.setAttribute("playsinline", true); // required to tell iOS safari we don't want fullscreen
      video.srcObject = stream;
      video.play();
      tick();
      scan();
    });
};

function tick() {
  canvasElement.height = video.videoHeight;
  canvasElement.width = video.videoWidth;
  canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);

  scanning && requestAnimationFrame(tick);
}

function scan() {
  try {
    qrcode.decode();
  } catch (e) {
    setTimeout(scan, 300);
  }
}
