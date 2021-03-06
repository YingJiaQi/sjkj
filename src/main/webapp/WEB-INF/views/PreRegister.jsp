<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>杰讯信息</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

<!-- Bootstrap --> 
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries --> <!-- WARNING: Respond.js doesn't work if you view the page via file:// --> 
<!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
   <![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.11.3.js"></script>
<link href="${pageContext.request.contextPath }/static/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/Pre/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/Pre/PreRegister.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath }/static/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/pages/pre/PreRegister.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/base64.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation"> 
    <div class="container"> 
    <div class="navbar-header"> 
        <a class="navbar-brand" href="#">杰讯信息</a> 
	    <span style="font-style:italic;font-size:0.9em;position:absolute;left:23%;top:53%">为时尚&nbsp;&nbsp;让我们一起努力！</span>
    </div> 
    <div> 
        <ul class="nav navbar-nav" id="register-nav"> 
            <li><a href="../">首页</a></li> 
            <li><a href="#">我的书屋</a></li> 
            <li class="dropdown"> 
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
                   	讯航<b class="caret"></b> 
                </a> 
                <ul class="dropdown-menu"> 
                    <li><a href="#">jmeter</a></li> 
                    <li><a href="#">EJB</a></li> 
                    <li><a href="#">Jasper Report</a></li> 
                    <li class="divider"></li> 
                    <li><a href="#">分离的链接</a></li> 
                    <li class="divider"></li> 
                    <li><a href="#">另一个分离的链接</a></li> 
                </ul> 
            </li> 
        </ul> 
    </div> 
    </div> 
</nav>

<div class="container-fluid" id="registerBody">
	<div class="row">
		<div class="col-md-offset-1 col-md-5">
			<div class="htmleaf-container" id="registerPanel">
				<div class="demo form-bg" style="padding: 20px 0;">
			            <div class="row">
			                <div class="col-md-12">
			                    <form class="form-horizontal" id="addUserForm">
			                        <span class="heading">用户注册</span>
			                        <span class="needWrite">*</span>
			                        <span id="userNameValidate"></span>
			                        <div class="form-group">
			                            <input type="text" class="form-control" id="userName" name="userName" placeholder="用户名">
			                            <i class="fa fa-user"></i>
			                        </div>
			                        <span class="needWrite">*</span>
			                        <span id="pwdStrength"></span>
			                        <div class="form-group">
			                            <input type="password" class="form-control" id="password" name="userPassword" placeholder="密　码">
			                            <i class="fa fa-lock"></i>
			                        </div>
			                       	<span class="needWrite">*</span>
			                       	<div class="form-group">
			                            <input type="password" class="form-control" id="repassword" name="repassword" placeholder="重复密码">
			                            <i class="fa fa-lock"></i>
			                        </div>
			                        <span class="needWrite">*</span>
			                        <span id="emailValidate"></span>
			                        <div class="form-group">
			                            <input type="text" class="form-control" id="email" name="userEmail" placeholder="邮箱">
			                            <i class="fa  fa-envelope"></i>
			                        </div>
			                    </form>
			                    <button  class="btn btn-success" id="registerPreUser" style="margin-left:40%">&nbsp;&nbsp;注册&nbsp;&nbsp;</button>
			                </div>
			            </div>
			    </div>
			</div>
		</div>
	</div>
</div>
<!-- 错误信息提示框 -->
<div class="modal fade" id="showError">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        <p>One fine body…</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>