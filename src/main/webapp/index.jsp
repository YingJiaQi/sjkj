<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.* " %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<title>杰讯信息</title>
<meta charset="utf-8">
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/pages/pre/index.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/Pre/index.css">
<body>
<h2>Hello World!</h2>
<a href="${pageContext.request.contextPath }/pre/PreCustomPage" target="_blank" >自定义页面</a>
 <!-- 按钮触发模态框 -->  
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#loginPanel">登录</button>
	<!-- //登录Panel -->
	<!-- 模态框（Modal） -->  
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="loginPanel" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
   		<div class="modal-dialog">
      		<div class="modal-content">
<!--          		<div class="modal-header">
            		<button type="button" class="close"  data-dismiss="modal" aria-hidden="true"> &times; </button>
            		<h4 class="modal-title" id="myModalLabel"> </h4>
         		</div> -->
         		<div class="modal-body">
         			<button type="button" class="close"  data-dismiss="modal" aria-hidden="true"> &times; </button>
						<div class="htmleaf-container">
							<div class="demo form-bg" style="padding: 20px 0;">
						        <div class="container">
						            <div class="row">
						                <div class="col-md-6">
						                    <form class="form-horizontal">
						                        <span class="heading">用户登录</span>
						                        <div class="form-group">
						                            <input type="email" class="form-control" id="inputEmail3" placeholder="用户名或电子邮件">
						                            <i class="fa fa-user"></i>
						                        </div>
						                        <div class="form-group help">
						                            <input type="password" class="form-control" id="inputPassword3" placeholder="密　码">
						                            <i class="fa fa-lock"></i>
						                            <a href="#" class="fa fa-question-circle"></a>
						                        </div>
						                        <div class="form-group">
						                            <div class="main-checkbox">
						                                <input type="checkbox" value="None" id="checkbox1" name="check"/>
						                                <label for="checkbox1"></label>
						                            </div>
						                            <span class="text">Remember me</span>
						                            <button type="submit" class="btn btn-default">登录</button>
						                            
						                        </div>
						                            <a class="btn-link" style="font-size:11px" href="${pageContext.request.contextPath }/pre/PreRegister">立即注册</a>
						                         
						                    </form>
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
	                </div>  
	              <!--   <div class="modal-footer">  
	                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
	                 	<button type="button" class="btn btn-primary">提交更改</button>  
	                </div>   -->
	        </div>  
	    </div>  
	</div>
	
	
	
 	
</body>
</html>
