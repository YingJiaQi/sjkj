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
/**
 * 退出登录
 */
function loginOut(){
	$.ajax({
		type: "POST",
		url: "../user/loginOut",
		success: function(data) {
			location.href = '../login/bs_login';
		}
	});
}
/**
 * 修改密码
 */
function changePassword(){
	var old = $("#oldPwd").val();
	if(old == null || old == ""){
		$("#popup_oldPwd").dialog("open").dialog("center");
		return;
	}
	var newPwd = $("#newPwd").val();
	if(newPwd == null || newPwd == ""){
		$("#popup_newPwd").dialog("open").dialog("center");
		return;
	}
	var reNewPwd = $("#reNewPwd").val();
	if(reNewPwd == null || reNewPwd == ""){
		$("#popup_reNewPwd").dialog("open").dialog("center");
		return;
	}
	if(reNewPwd != newPwd){
		$("#popup_pwdCompare").dialog("open").dialog("center");
		return;
	}
	var BASE64 = new Base64(); 
	var dataVo = {
		"newPwd": BASE64.encode(newPwd),
		"oldPwd": BASE64.encode(old)
	};
	$.ajax({
		type: "POST",
		url: "../user/changePwd",
		data: JSON.stringify(dataVo),
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		success: function(data) {
			if(data.success == "true") {
				$.messager.alert("恭喜", data.msg +
					"-将在3秒后自动跳转至登录页面",
					"info");
				for(var i = 3; i >= 0; i--) {
					window.setTimeout(
						'toLoginPage(' + i +
						')',
						(3 - i) * 1000);
				}
			} else {
				$.messager.alert("出错了！",
					data.msg);
			}
		}
	});
}
function toLoginPage(num) {
	if(num == 0) {
		window.location.href = "../login/bs_login";
	}
}
