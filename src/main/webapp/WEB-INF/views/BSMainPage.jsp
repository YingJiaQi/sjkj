<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="../static/js/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="../static/js/easyui/themes/mobile.css">
	<link rel="stylesheet" type="text/css" href="../static/js/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../static/js/easyui/themes/color.css"> 
	<link rel="stylesheet" type="text/css" href="../static/css/BSMainPage.css">
	<script type="text/javascript" src="../static/js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="../static/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../static/js/easyui/jquery.easyui.mobile.js"></script>
	<script type="text/javascript" src="../static/js/base64.js"></script>
	<script type="text/javascript" src="../static/js/pages/BSMainPage.js"></script>
  </head>
  
  <body>
     <div class="easyui-navpanel">
	    <header>
	    	<div class="m-toolbar">
	    		<div class="m-toolbar">
	                <div class="m-title">尚捷科技</div>
	                <div class="m-left">
	                   <a href="javascript:void(0)" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu'"><img src='../static/images/BSMainPage/changeSkin.png' height="33px" width="33px" /> </a>
	                </div>
	                <div class="m-right">
	                    <a href="javascript:void(0)" class="">
							<img src='../static/images/BSMainPage/msg_none.png' height="33px" width="33px" />
							<a class="custom-badge">234</a>
	                    </a>
	                </div>
	            </div>
	    	</div>
	    </header>
		<div class="easyui-tabs" data-options="tabHeight:60,fit:true,tabPosition:'bottom',border:false,pill:true,narrow:true,justified:true">
			<div style="padding:10px">
				<div class="panel-header tt-inner">
					<img src='../static/images/BSMainPage/display_none.png'  height="33px" width="33px" /><br>展示台
				</div>
				<p>A modem (modulator-demodulator) is a device that modulates an analog carrier signal to encode digital information, and also demodulates such a carrier signal to decode the transmitted information.</p>
			</div>
			<div style="padding:10px">
				<div class="panel-header tt-inner">
					<img src='../static/images/BSMainPage/console_none.png'   height="33px" width="33px" /><br>控制台
				</div>
				<div id="menuList" data-options="multiple:false,fit:true" style="width:auto;"></div>
			</div>
			<div style="padding:10px">
				<div class="panel-header tt-inner">
					<img src='../static/images/BSMainPage/internet_none.png'   height="33px" width="33px" /><br>发现
				</div>
				<p>A personal digital assistant (PDA), also known as a palmtop computer, or personal data assistant, is a mobile device that functions as a personal information manager. PDAs are largely considered obsolete with the widespread adoption of smartphones.</p>
			</div>
			<div style="padding:10px">
				<div class="panel-header tt-inner">
					<img src='../static/images/BSMainPage/my_none.png' height="30px" width="30px" /><br>我的
				</div>
				<ul class="m-list">
					<li><a href="#loginOut" data-options="animation:'slide',direction:'left'">退出登录</a></li>
					<li><a href="#changePwd" data-options="animation:'slide',direction:'left'">修改密码</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!--控制台右划列表   start -->
	<div id="aa" class="easyui-navpanel">
 		<header>
			<div class="m-toolbar">
				<div class="m-left">
					<a href="#" class="easyui-linkbutton m-back" data-options="plain:true,outline:true,back:true">Back</a>
				</div>
				<div class="m-title">后台用户管理</div>
			</div>
		</header>
		<%@ include file="BSUserManage.jsp"%>
	</div>
	<div id="bb" class="easyui-navpanel">
		<header>
			<div class="m-toolbar">
				<div class="m-left">
					<a href="#" class="easyui-linkbutton m-back" data-options="plain:true,outline:true,back:true">Back</a>
				</div>
				<div class="m-title">新增商品</div>
			</div>
		</header>
		<%@ include file="BSAddCommodity.jsp"%>
	</div>
	<div id="bbb" class="easyui-navpanel">
		<header>
			<div class="m-toolbar">
				<div class="m-left">
					<a href="#" class="easyui-linkbutton m-back" data-options="plain:true,outline:true,back:true">Back</a>
				</div>
				<div class="m-title">商品详情管理</div>
			</div>
		</header>
		<%@ include file="BSCommodityManager.jsp"%>
	</div>
	<div id="bbbb" class="easyui-navpanel">
		<header>
			<div class="m-toolbar">
				<div class="m-left">
					<a href="#" class="easyui-linkbutton m-back" data-options="plain:true,outline:true,back:true">Back</a>
				</div>
				<div class="m-title">类目参数</div>
			</div>
		</header>
		<%@ include file="BSCommodityParams.jsp"%>
	</div>
	<div id="cc" class="easyui-navpanel">
		<header>
			<div class="m-toolbar">
				<div class="m-left">
					<a href="#" class="easyui-linkbutton m-back" data-options="plain:true,outline:true,back:true">Back</a>
				</div>
				<div class="m-title">网站内容管理</div>
			</div>
		</header>
		<%@ include file="BSWebContentManage.jsp"%>
	</div>
	<!--控制台右划列表   end -->
	
	<!-- 我的   start -->
	<div id="loginOut" class="easyui-navpanel">
		<header>
			<div class="m-toolbar">
				<div class="m-left">
					<a href="#" class="easyui-linkbutton m-back" data-options="plain:true,outline:true,back:true">Back</a>
				</div>
				<div class="m-title">退出登录</div>
			</div>
		</header>
		<div style="padding:10px">
			<p style="text-align:center;padding-top:40%">您确定要退出登录么</p>
			<div class="dialog-button" style="margin-top:60%">
				<a href="javascript:void(0)" class="easyui-linkbutton c1" style="width:30%;height:35px;margin-right:35%" onclick="loginOut();">确定</a>
			</div>
		</div>
	</div>
	<div id="changePwd" class="easyui-navpanel">
		<header>
			<div class="m-toolbar">
				<div class="m-left">
					<a href="#" class="easyui-linkbutton m-back" data-options="plain:true,outline:true,back:true">Back</a>
				</div>
				<div class="m-title">修改密码</div>
			</div>
		</header>
		<div style="padding:30px 6px;width:95%;" data-options="inline:true,modal:true,closed:true,title:'Login'">
			<div style="margin-bottom:10px">
				<input id="oldPwd" class="easyui-textbox" prompt="原密码" style="width:100%;height:30px">
			</div>
			<div  style="margin-bottom:10px">
				<input id="newPwd" class="easyui-textbox" type="password" prompt="新密码" style="width:100%;height:30px">
			</div>
			<div >
				<input id="reNewPwd" class="easyui-textbox" type="password" prompt="重复新密码" style="width:100%;height:30px">
			</div>
			<c:if test="${not empty msg }">
				<div class="promptErrorMessage">${ msg}</div>
			</c:if>
			<br><br>
			<div class="dialog-button">
				<a href="javascript:void(0)" class="easyui-linkbutton c1" style="width:100%;height:35px" onclick="changePassword();">确定</a>
			</div>
		</div>
	</div>
	<!-- 我的   start -->
	
	<style scoped>
       .tt-inner{
            display:inline-block;
            line-height:12px;
            padding-top:5px;
        }
		p{
			line-height:150%;
		}
	</style>
		<!-- 更换皮肤 -->
	<div id="layout_north_pfMenu" style="width: 120px; display: none;">
		<div onclick="changeTheme('default');">default</div>
		<div onclick="changeTheme('gray');">gray</div>
		<div onclick="changeTheme('black');">black</div>
		<div onclick="changeTheme('bootstrap');">bootstrap</div>
		<div onclick="changeTheme('metro');">metro</div>
		<div onclick="changeTheme('material');">material</div>
	</div>
	<!-- 修改密码提示信息 -->
	<div id="popup_oldPwd" class="easyui-dialog" style="padding:20px 6px;width:80%;" data-options="inline:true,modal:true,closed:true,title:'出错了!'">
		<div class="m-title centerFont">原密码不能为空！</div>
		<a style="position:absolute;top:6px;left:92%" href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#popup_oldPwd').dialog('close')"><b style="color:red">X</b></a>
	</div>
		<div id="popup_newPwd" class="easyui-dialog" style="padding:20px 6px;width:80%;" data-options="inline:true,modal:true,closed:true,title:'出错了!'">
		<div class="m-title centerFont">新密码不能为空！</div>
		<a style="position:absolute;top:6px;left:92%" href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#popup_newPwd').dialog('close')"><b style="color:red">X</b></a>
	</div>
		<div id="popup_reNewPwd" class="easyui-dialog" style="padding:20px 6px;width:80%;" data-options="inline:true,modal:true,closed:true,title:'出错了!'">
		<div class="m-title centerFont">重复新密码不能为空！</div>
		<a style="position:absolute;top:6px;left:92%" href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#popup_reNewPwd').dialog('close')"><b style="color:red">X</b></a>
	</div>
	<div id="popup_pwdCompare" class="easyui-dialog" style="padding:20px 6px;width:80%;" data-options="inline:true,modal:true,closed:true,title:'出错了!'">
		<div class="m-title centerFont">两次新密码不相同！</div>
		<a style="position:absolute;top:6px;left:92%" href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#popup_pwdCompare').dialog('close')"><b style="color:red">X</b></a>
	</div>
  </body>
</html>
