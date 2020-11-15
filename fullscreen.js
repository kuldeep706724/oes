		function toggleFullscreen(el){
		if(document.fullscreenElement||document.mozFullScreenElement||document.webkitFullscreenElement||document.msFullscreenElement){
			if(document.exitFullscreen){
				document.exitFullscreen();
			}else if(document.mozCancelFullscreen){
				document.mozCancelFullscreen();
			}else if(document.webkitExitFullscreen){
				document.webkitExitFullscreen();
			}else if(document.msExitFullscreen){
				document.msExitFullscreen();
			} 
		}else {
			if(document.documentElement.requestFullscreen){
				el.requestFullscreen();
			}
			else if(document.documentElement.mozRequestFullScreen){
				el.mozRequestFullScreen();
			}else if(document.documentElement.webkitRequestFullscreen){
				el.webkitRequestFullscreen();
			}else if(document.documentElement.msRequestFullscreen){
				el.msRequestFullscreen();
			}
		}
	}
