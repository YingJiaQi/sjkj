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
		var formData = $("#addUserForm").serialize();
		alert(formData)
	});
});
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