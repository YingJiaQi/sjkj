var validata = 1;
$(function(){
	//密码强度验证
	$('#password').blur(function(e) {
		var obj = $(this);
		validatePwd(obj);
		return true;
	});
	$('#userName').blur(function(e) {
		validateUserName();
		return true;
	});
	$('#email').blur(function(e) {
		validateEmail();
		return true;
	});
	$("#registerPreUser").click(function(){
		var obj = $("#password");
		validatePwd(obj);
		validateUserName();
		validateEmail();
		if(validata == 0){
			alert("请检查注册表单，确认没有错误提示")
			//$("#showError").show();
			return;
		}
		if($("#password").val() != $("#repassword").val()){
			alert("两次密码不同，请核验！")
			$("#repassword").focus();
			return;
		}
		var BASE64 = new Base64(); 
		var uu = $('#userName').val();
		var pp = $('#password').val();
		var ee = $('#email').val();
		uu = BASE64.encode(uu);
	    pp = BASE64.encode(pp);
		ee = BASE64.encode(ee);
		var formData = "userName="+uu+"&userPassword="+pp+"&userEmail="+ee;
		//alert(formData)
		$.ajax({
			type: 'post',
			url: "../preUser/addPreUser",
			data: JSON.stringify(conveterParamsToJson(formData)),
			dataType: 'json',
			contentType: "application/json; charset=utf-8",
			success: function(data) {
				if(data.success == "true") {
					for(var i = 3; i >= 0; i--) {
						window.setTimeout(
								'toIndex(' + i +
								')',
								(3 - i) * 1000);
					}
					alert("恭喜"+ data.msg +	"-将在3秒后自动跳转至登录页面");
				} else {
					alert('失败'+data.msg);
				}
			}
		});
	});
});
function toIndex(num){
	if(num == 0) {
		window.location.href = "../";
	}
}
function validatePwd(obj){
	//密码为八位及以上并且字母数字特殊字符三项都包括
	var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
	//密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
	var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
	var enoughRegex = new RegExp("(?=.{6,}).*", "g");
	if (false == enoughRegex.test($(obj).val())) {
		$('#pwdStrength').html('<span style="color:red">不能少于6个字符</span>');
		validata = 0;
		} else if (strongRegex.test($(obj).val())) {
			$('#pwdStrength').html('<span style="color:green">强</span>');
			validata = 1;
		} else if (mediumRegex.test($(obj).val())) {
			$('#pwdStrength').html('<span style="color:orange">中</span>');
			validata = 1;
		} else {
			$('#pwdStrength').html('<span style="color:red">弱</span>');
	   		validata = 1;
	   	}
}
function validateUserName(){
	if($("#userName").val().length > 36){
		$('#userNameValidate').html('<span style="color:red">用户名长度不能大于36</span>');
		validata = 0;
	}
	if($("#userName").val() == null || $("#userName").val() == ""){
		$('#userNameValidate').html('<span style="color:red">用户名不能为空</span>');
		validata = 0;
	}
}
function validateEmail(){
	if($("#email").val() == null || $("#email").val() == ""){
		$('#emailValidate').html('<span style="color:red">邮箱不能为空</span>');
		validata = 0;
	}
	var email=$("#email").val();
	if(!email.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)){
	   $('#emailValidate').html('<span style="color:red">邮箱格式不正确！请重新输入</span>');
	   validata = 0;
	}
}
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