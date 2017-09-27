<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>前台登录页面</title>
		<meta name="keywords" content="自定义主页，个人主页" />
		<meta name="description" content="自定义主页，个人主页" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- basic styles -->

		<link href="${pageContext.request.contextPath }/static/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<!-- fonts -->

		<!-- ace styles -->

		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/ace.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/ace-rtl.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/base64.js"></script>
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="${pageContext.request.contextPath }/static/assets/js/html5shiv.js"></script>
		<script src="${pageContext.request.contextPath }/static/assets/js/respond.min.js"></script>
		<![endif]-->
		
	</head>

	<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="icon-leaf green"></i>
									<span class="red">佳奇</span>
									<span class="white">网络</span>
								</h1>
								<h4 class="blue">&copy; Company Name</h4>
							</div>

							<div class="space-12"></div>
							<div class="space-12"></div>
							<div class="space-12"></div>
							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="icon-coffee green"></i>
												请输入登录信息
											</h4>

											<div class="space-6"></div>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="username" type="text" class="form-control" placeholder="用户名或邮箱地址" />
															<i class="icon-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="pwd" type="password" class="form-control" placeholder="密码" />
															<i class="icon-lock"></i>
														</span>
													</label>
													<label class="block clearfix">
															<div class="row">
																<div class="col-xs-6">
																	<input id="verify" type="text"  width="25%" placeholder="验证码" onkeypress="nextEvent('btn_Login',event);" />
																</div>
																<div class="col-xs-6">
									                       			<a href="javascript:changeImg();"><img id="img_code" class="img-rounded img-responsive" src="${pageContext.request.contextPath }/common/getGifCode" /></a>
																</div>
															</div>
													</label>
													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" id="remeberName" onclick="saveUserInfo()"/>
															<span class="lbl">记住用户名</span>
														</label>

														<button type="button" onclick="login();" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="icon-key"></i>
															登录
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>
											<div id="showWrongNews" class="social-or-login center" style="display:none">
											</div>
											<!-- 第三方登录 -->
											<!-- <div class="social-or-login center">
												<span class="bigger-110">Or Login Using</span>
											</div>
											
											<div class="social-login center">
												<a class="btn btn-primary">
													<i class="icon-facebook"></i>
												</a>
											
												<a class="btn btn-info">
													<i class="icon-twitter"></i>
												</a>
											
												<a class="btn btn-danger">
													<i class="icon-google-plus"></i>
												</a>
											</div> -->
										</div><!-- /widget-main -->

										<div class="toolbar clearfix">
											<div>
												<a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link">
													<i class="icon-arrow-left"></i>
													忘记密码
												</a>
											</div>

											<div>
												<a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link">
													注册
													<i class="icon-arrow-right"></i>
												</a>
											</div>
										</div>
									</div><!-- /widget-body -->
								</div><!-- /login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="icon-key"></i>
												密码找回
											</h4>

											<div class="space-6"></div>
											<p>
												输入您的电子邮件和接收指令
											</p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="icon-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="icon-lightbulb"></i>
															发送!
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /widget-main -->

										<div class="toolbar center">
											<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
												回到登录界面 
												<i class="icon-arrow-right"></i>
											</a>
										</div>
									</div><!-- /widget-body -->
								</div><!-- /forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="icon-group blue"></i>
												新用户注册
											</h4>

											<div class="space-6"></div>
											<p> 开始输入您的信息: </p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="icon-envelope"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="用户名" />
															<i class="icon-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="密码" />
															<i class="icon-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="重复密码" />
															<i class="icon-retweet"></i>
														</span>
													</label>
													<label class="block clearfix">
															<div class="row">
																<div class="col-xs-6">
																	<input id="verify" type="text"  width="25%" placeholder="验证码" onkeypress="nextEvent('btn_Login',event);" />
																</div>
																<div class="col-xs-6">
									                       			<a href="javascript:changeImg2();"><img id="img_code2" class="img-rounded img-responsive" src="${pageContext.request.contextPath }/common/getGifCode" /></a>
																</div>
															</div>
													</label>
													<label class="block">
														<input type="checkbox" class="ace" />
														<span class="lbl">
															阅读并接受
															<a href="#">用户注册协议</a>
														</span>
													</label>
													
													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="icon-refresh"></i>
															重置
														</button>

														<button type="button" class="width-65 pull-right btn btn-sm btn-success">
															注册
															<i class="icon-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>

										<div class="toolbar center">
											<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
												<i class="icon-arrow-left"></i>
												回到登录界面
											</a>
										</div>
									</div><!-- /widget-body -->
								</div><!-- /signup-box -->
							</div><!-- /position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='${pageContext.request.contextPath }/static/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath }/static/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
		//页面加载的时候，判断并设置
			$(function() {
				$("#username").val("");
				$("#verify").val("");
				if (getCookie("remeberName") != null){
				    $('#remeberName').attr("checked", "checked");
				    $('#username').val(getCookie("userName"));
				}
			});
		
			function show_box(id) {
			 jQuery('.widget-box.visible').removeClass('visible');
			 jQuery('#'+id).addClass('visible');
			}
			function changeImg() {
			    var imgSrc =document.getElementById("img_code");
			    var src = imgSrc.src;
			    var timestamp = (new Date()).valueOf();
			    imgSrc.src= src+"?timestamp="+timestamp;
			}
			function changeImg2() {
			    var imgSrc =document.getElementById("img_code2");
			    var src = imgSrc.src;
			    var timestamp = (new Date()).valueOf();
			    imgSrc.src= src+"?timestamp="+timestamp;
			}
			function nextEvent(strName,e){
				var theEvent = window.event || e;
			    var code = theEvent.keyCode || theEvent.which;
				if(code==13 || code==9){
				 	if (strName == "btn_Login"){
				 		login();
					}else{
						document.getElementById(strName).focus();
					}
				}
			}
			
			function login(){
				var username = $("#username").val();
				if(username == null || username == ""){
					$("#showWrongNews").css("display","block").html("<b style='color:red;'>用户名不能为空</b>");
					return;
				}else{
					username = "pre"+username;
				}
				var password = $("#pwd").val();
				if(password == null || password == ""){
					$("#showWrongNews").css("display","block").html("<b style='color:red;'>密码不能为空</b>");
					return;
				}
				var verify = $("#verify").val();
				if(verify == null || verify == ""){
					$("#showWrongNews").css("display","block").html("<b style='color:red;'>验证码不能为空</b>");
					return;
				}
				var BASE64 = new Base64(); 
				var dataVo = {
					"userName": BASE64.encode(username),
					"userPassword": BASE64.encode(password)
				};
				$.ajax({
					type: "POST",
					url: "${pageContext.request.contextPath }/pre/preUserLogin?verify="+verify,
					contentType: "application/json",
					data: JSON.stringify(dataVo),
					success: function(jsonResult) {
						if(jsonResult.success == 'true') {
							window.location.href = "${pageContext.request.contextPath }/";
						} else {
							$("#verify").focus();
							$("#showWrongNews").css("display","block");
							$("#showWrongNews").html("<b style='color:red;'>"+jsonResult.msg+"</b>");
						}
					}
				});
				
			}
			//记住用户名
			function saveUserInfo() {
			    if (($("#remeberName").prop("checked") == true) || ($("#remeberName").prop("checked") == "checked")) {
			        var userName = $("#username").val();
			        if (userName == "") {
			            alert("用户名不能为空！");
			           }
			        setCookie("remeberName", "true", 30); // 
			        setCookie("userName", userName, 30); // 
			    }else{
			    	delCookie("remeberName");        // 删除 cookie
			    	delCookie("userName");
			    }
			}
			//写cookies
			  function setCookie(name, value,days) {
			   var Days = days;
			   var exp = new Date();
			   exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
			   document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
			  }
			  //读取cookies 
			  function getCookie(name) {
			   var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
			   if (arr = document.cookie.match(reg)) return unescape(arr[2]);
			   else return null;
			  }
			  //删除cookies 
			  function delCookie(name) {
			   var exp = new Date();
			   exp.setTime(exp.getTime() - 1);
			   var cval = getCookie(name);
			   if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
			  }
		</script>
</body>
</html>
