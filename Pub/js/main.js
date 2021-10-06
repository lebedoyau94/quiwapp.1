function inicio_video(){
	navigator.getUserMedia = (
		navigator.getUserMedia ||
		navigator.webkitGetUserMedia ||
		navigator.mozGetUserMedia ||
		navigator.msGetUserMedia
	);
	navigator.getUserMedia(
		{
			video:{}
		},
		stream => video.srcObject = stream,
		err => console.log(err) 
	);
}
inicio_video();




let scanner = new Instascan.Scanner(
            {
                video: document.getElementById('video')
            }
        );
        scanner.addListener('scan', function(content) {
            alert('Mesa encontrada: ' + content);
            //window.open(content, "_blank");
            window.location.assign("https://"+content);
        });
        Instascan.Camera.getCameras().then(cameras => 
        {
            if(cameras.length > 0){
                scanner.start(cameras[0]);
            } else {
                console.error("No existe camara ó dispositivo!");
            }
        });