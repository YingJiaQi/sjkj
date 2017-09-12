<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE HTML>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta content="" name="description">
        <meta content="" name="keywords">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="HandheldFriendly" content="true">
        <meta content="telephone=no" name="format-detection">
        <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/bootstrap.css" type="text/css" >
        <!--[if (gt IE 9)|!(IE)]><!-->
        <!-- custom CSS -->
        <!-- END custom CSS -->
        <!--<![endif]-->
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title></title>
</head>

<body>
	
	<div id="floatButton"  class="hidden-xs"  style="position: absolute;left:95%;top:30%;z-index:9999">
		<button type="button" onclick="writeNodeSkin();" class="btn btn-info">换肤</button>
		<button type="button" onclick="writeNodeSave();" class="btn btn-info">保存</button>
		<button type="button" onclick="writeNodeClose();" class="btn btn-danger">关闭</button>
	</div>
	<div id="floatButton"  class="visible-xs"  style="position: absolute;left:83%;top:1%;z-index:9999">
		<button type="button" onclick="writeNodeSkin();" class="btn btn-info">换肤</button>
		<button type="button" onclick="writeNodeSave();" class="btn btn-info">保存</button>
		<button type="button" onclick="writeNodeClose();" class="btn btn-danger">关闭</button>
	</div>
	<div class="container">
		<form id="ueditForm" action="../pre/noteManage/addNote" method="post"  role="form">
			<div class="form-group">
			    <label for="firstname" class="col-sm-1 control-label text-center"  style="padding-top:0.5em;">分类</label>
			    <div class="col-sm-3">
			    	<input type="text" class="form-control" id="firstname" name="catename" placeholder="请单击选择分类 ">
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="secname" class="col-sm-1 control-label text-center" style="padding-top:0.5em;">标题</label>
			    <div class="col-sm-7">
			    	<input type="text" class="form-control" id="secname" name="notetitle" placeholder="请输入标题">
			    </div>
			</div>
			 <div class="form-group">
			 	<label for="secname" class="col-sm-1 control-label text-center"></label>
			    <div class="col-sm-7">
			    </div>
			 </div>
			<div class="form-group">
				<div class="col-sm-12">
			    	<!-- 加载编辑器的容器 -->
	   	 			<script id="container" name="content" type="text/plain">
        			</script>
        		</div>
        	</div>
		</form>
	</div>
	<!-- 页面弹出提示框（Modal） -->
		<div class="modal fade" id="showCate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <br>
		                <!-- <h4 class="modal-title" id="showTipTitle"></h4> -->
		            </div>
		            <div class="modal-body">
		            	<div class="container">
		            		<div class="row">
		            			<p>
		            				<button type="button" class="btn btn-default cateName">科技</button>
		            				<button type="button" class="btn btn-default cateName">日记</button>
		            				<button type="button" class="btn btn-default cateName">java</button>
		            				<button type="button" class="btn btn-default cateName">品质</button>
		            				<button type="button" class="btn btn-default cateName">电脑</button>
		            				<button type="button" class="btn btn-default cateName">杂志</button>
		            				<button type="button" class="btn btn-default cateName">小说</button>
		            				<button type="button" class="btn btn-default cateName">励志</button>
		            			</p>
		            		</div>
		            		<div class="row" style="height:2em">
		            		</div>
		            		<div class="row visible-on">
							    <input type="text" style="width:46%" class="form-control hidden-xs" id="customCate" placeholder="自定义分类，若是多个分类以逗号分隔，如A,B">
							    <input type="text" style="width:90%" class="form-control visible-xs" id="customCate" placeholder="自定义分类，多个以逗号分隔  A,B">
		            		</div>
		            	</div>
		            </div>
		           <div class="modal-footer">
		                <button type="button" class="btn btn-default showCateSure" data-dismiss="modal">确定</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
    <!-- 配置文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/uedit/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/uedit/ueditor.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/utils.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
  //控制网页logo大小
		var body_height=document.documentElement.clientHeight;
        var ue = UE.getEditor('container',{
        	initialFrameHeight:body_height*0.86 //初始化选项
        });
    </script>
   	<script type="text/javascript">
		window.jQuery || document.write("<script src='${pageContext.request.contextPath }/static/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
	</script>
	<!-- <![endif]-->
	<!--[if IE]>
		<script type="text/javascript">
			 window.jQuery || document.write("<script src='${pageContext.request.contextPath }/static/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
		</script>
	<![endif]-->
    <!-- 自定义JS -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/pages/pre/pre_write_node.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/bootstrap.js"></script>
</body>

</html>
