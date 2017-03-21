<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>拖放完成自定义页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

<!-- Bootstrap --> 
<link href="${pageContext.request.contextPath }/static/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"> 
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries --> <!-- WARNING: Respond.js doesn't work if you view the page via file:// --> 
<!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
   <![endif]--> 
<link href="${pageContext.request.contextPath }/static/css/Pre/PreCustomPage.css" rel="stylesheet"> 
<script type="text/javascript" id="jqueryUrl" src="${pageContext.request.contextPath }/static/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" id="customJs" src="${pageContext.request.contextPath }/static/js/pages/PreCustomPage.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/static/js/customPlug.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/static/js/webPagination.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/static/js/picHandle.js"></script>
</head>
<body>
<nav id="nav_head" class="navbar navbar-default navbar-fixed-top" role="navigation"> 
    <div class="container-fluid" id="domScrollPanel"> 
    </div>
</nav><div id="hiddenDom" style="visibility:hidden;height:210px">这是隐藏的部分</div>
<div class="openDrage"><img alt="" src="${pageContext.request.contextPath }/static/images/Pre/customPage/close.png" height="auto" width="80"/></div>
<div class="btn btn-success btn-sm" onclick="savePage();" id="savePageButton">&nbsp;&nbsp;保存&nbsp;&nbsp;</div>
<div id="bottomBox">

</div>
</body>
</html>