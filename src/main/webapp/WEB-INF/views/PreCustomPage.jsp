<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>拖放完成自定义页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/pages/PreCustomPage.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
body { background-color: #eee; }
.box {width: 200px; height: 100px; cursor: move; position: absolute; top: 50px; left: 20px; background-color: #FFF; border: 1px solid #CCCCCC}
.main_tabletop{width: 100%;height:20px;background:#ffee00;}
.box2 {
	width: 200px; height: 100px; cursor: move; position: absolute; top:170px; left: 20px; background-color: #FFF; border: 1px solid blue;
}
#leftBox {
	height:700px;
	width:20%;
	border: 1px solid grey;
	float: left;
	padding:5px;
}
#rightBox {
	height:700px;
	width:78%;
	border: 1px solid grey;
	float:right;
	padding: 5px;
}
.activeBox {
	-webkit-box-shadow: 10px 10px 25px #ccc;
	-moz-box-shadow: 10px 10px 25px #ccc;
	box-shadow: 10px 10px 25px #ccc;
}
</style>
</head>
<body>
<div style="height:30px; width:600px;margin-left:30px" onclick="savePage(this);">保存页面</div>
<div id="leftBox">
<div class="box">
    <div class="main_tabletop" title="box1"   onmouseover ="activeBox(this);">我是可以拖动的标题</div>
    左、右、下、左下、右下都可放大缩小
</div>
<div class="box2">
    <div class="main_tabletop" title="box2"  onmouseover ="activeBox(this);">点击我，拖拽</div>
    除了上边，其它边都可以拖动
</div>
</div>
<div id="rightBox">

</div>
</body>
</html>