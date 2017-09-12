//对象转json
function conveterParamsToJson(paramsAndValues) {  
	paramsAndValues = paramsAndValues.replace(/\+/g," ");   //
	paramsAndValues = decodeURIComponent(paramsAndValues);
	
    var jsonObj = {};  
    var param = paramsAndValues.split("&");  
    for ( var i = 0; param != null && i < param.length; i++) {  
        var para = param[i].split("=");  
        jsonObj[para[0]] = para[1];  
    }  
  
    return jsonObj;  
} 

//数组是否包含有个值
function isCon(arr, val){
	for(var i=0; i<arr.length; i++){
		if(arr[i] == val)
			return true;
	}
	return false;
}

//是否全屏
var inFullScreen = false; // flag to show when full screen

document.onkeydown=function(event){ 
	var e = event || window.event || arguments.callee.caller.arguments[0]; 
	if(e && e.keyCode==27){ // 按 Esc 
	//要做的事情 
		if(inFullScreen){
			if(isIE = navigator.userAgent.indexOf("MSIE")!=-1){
				var WsShell = new ActiveXObject('WScript.Shell');
				WsShell.SendKeys('{F11}'); 
			}
			$('#fullScreen').html('全屏');
			inFullScreen = false;
    	}
	} 
}
//全屏显示
function fillScreen(){
	var docElm = document.documentElement;
	//W3C 
	if (docElm.requestFullscreen) { 
	  docElm.requestFullscreen(); 
	}//FireFox 
	else if (docElm.mozRequestFullScreen) { 
	  docElm.mozRequestFullScreen(); 
	}//Chrome等 
	else if (docElm.webkitRequestFullScreen) { 
	  docElm.webkitRequestFullScreen(); 
	}//IE11
	else if (docElm.msRequestFullscreen) {
		docElm.msRequestFullscreen();
	}// IE
	else if(isIE = navigator.userAgent.indexOf("MSIE")!=-1){
		window.open(location.href,'','width='+(window.screen.availWidth-10)+',height='+(window.screen.availHeight-30)+',top=0,left=0,resizable=yes,status=yes,menubar=no,scrollbars=yes'); 
/*		var WsShell = undefined;
		try{
			WsShell = new ActiveXObject('WScript.Shell');
	    }catch(e){
	    	alert(IEFullScreen);
	    	return false;
	    }
		WsShell.SendKeys('{F11}'); */
	}
	inFullScreen = true;
	return true;
}
//退出全屏
function reset() {
    if (document.exitFullscreen) {
      document.exitFullscreen();
    }
    else if (document.msExitFullscreen) {
      document.msExitFullscreen();
    }
    else if (document.mozCancelFullScreen) {
      document.mozCancelFullScreen();
    }
    else if (document.webkitCancelFullScreen) {
      document.webkitCancelFullScreen();
    }// IE
    else if(isIE = navigator.userAgent.indexOf("MSIE")!=-1){
		var WsShell = new ActiveXObject('WScript.Shell');
		WsShell.SendKeys('{F11}'); 
	}
	inFullScreen = false;
	return true;
  }
function ajaxLoading(){
    $("<div class=\"datagrid-mask\"></div>").css({display:"block",width:"100%",height:$(window).height()}).appendTo("body");
    $("<div class=\"datagrid-mask-msg\"></div>").html("Loading...").appendTo("body").css({display:"block",left:($(document.body).outerWidth(true) - 190) / 2,top:($(window).height() - 45) / 2});
 }
 function ajaxLoadEnd(){
     $(".datagrid-mask").remove();
     $(".datagrid-mask-msg").remove();            
}