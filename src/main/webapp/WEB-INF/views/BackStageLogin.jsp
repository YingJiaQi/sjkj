<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>尚捷科技</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" type="text/css" href="../static/js/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="../static/js/easyui/themes/mobile.css">
	<link rel="stylesheet" type="text/css" href="../static/js/easyui/themes/color.css">  
	<link rel="stylesheet" type="text/css" href="../static/js/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../static/css/backStageLogin.css">
	<script type="text/javascript" src="../static/js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="../static/js/base64.js"></script>
	<script type="text/javascript" src="../static/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../static/js/easyui/jquery.easyui.mobile.js"></script>
  </head>
  
<body style="background-color:#efeff4;">
	<div class="easyui-navpanel" style="position:relative;background-color:#efeff4;">
		<header>
			<div class="m-toolbar">
				<div class="m-title">登录</div>
			</div>
		</header>
		<div style="padding:30px 6px;width:95%;" data-options="inline:true,modal:true,closed:true,title:'Login'">
			<div style="margin-bottom:10px">
				<input id="username" class="easyui-textbox" prompt="用户名" style="width:100%;height:30px">
			</div>
			<div>
				<input id="password" class="easyui-textbox" type="password" prompt="密码" style="width:100%;height:30px">
			</div>
			<div class="promptErrorMessage" style="display:none"></div>
			<br><br>
			<div class="dialog-button">
				<a href="javascript:void(0)" class="easyui-linkbutton c1" style="width:100%;height:35px" onclick="login();">登录</a>
			</div>
		</div>
		<footer>
			<div class="footerBank">尚捷科技后台登录</div>
		</footer>
	</div>
	<script type="text/javascript">
		function login(){
			var username = $("#username").val();
			if(username == null || username == ""){
				$("#popup").dialog("open").dialog("center");
				return;
			}
			var password = $("#password").val();
			if(password == null || password == ""){
				$("#popup_pwd").dialog("open").dialog("center");
				return;
			}
			var BASE64 = new Base64(); 
			var dataVo = {
				"username": BASE64.encode(username),
				"password": BASE64.encode(password)
			};
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath }/login/initUser",
				contentType: "application/json",
				data: JSON.stringify(dataVo),
				success: function(jsonResult) {
					if(jsonResult.success == 'true') {
						window.location.href = "${pageContext.request.contextPath }/login/BSMainPage";
					} else {
						$(".promptErrorMessage").css("display","block");
						$(".promptErrorMessage").html(jsonResult.msg);
					}
				}
			});
		}
	</script>
	<div id="popup" class="easyui-dialog" style="padding:20px 6px;width:80%;" data-options="inline:true,modal:true,closed:true,title:'出错了!'">
		<div class="m-title centerFont">用户名不能为空！</div>
		<a style="position:absolute;top:6px;left:92%" href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#popup').dialog('close')"><b style="color:red">X</b></a>
	</div>
	<div id="popup_pwd" class="easyui-dialog" style="padding:20px 6px;width:80%;" data-options="inline:true,modal:true,closed:true,title:'出错了!'">
		<div class="m-title centerFont">密码不能为空！</div>
		<a style="position:absolute;top:6px;left:92%" href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#popup_pwd').dialog('close')"><b style="color:red">X</b></a>
	</div>
</body>
</html>
