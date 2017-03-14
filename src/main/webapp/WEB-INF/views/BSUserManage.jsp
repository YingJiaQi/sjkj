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
	<script type="text/javascript" src="../static/js/pages/BSUserManage.js"></script>
	<link rel="stylesheet" type="text/css" href="../static/css/BSUserManage.css">
  </head>
  
  <body>
	<table id="grid"></table>
	<!-- 更新窗口 -->
	<div id="updateUser" class="easyui-dialog" style="padding:8px;width:80%;" data-options="inline:true,modal:true,closed:true,title:'更新'">
		<a style="position:absolute;top:6px;left:92%" href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#updateUser').dialog('close')"><b style="color:red">X</b></a>		
		<form id="updateUserForm">
			<input type="hidden" name="id">
			<div style="margin-bottom:7px">
				<span class="redPoint">.</span><input class="easyui-textbox" name="userCode" data-options="required:true,validType:'multiple[\'length[3,100]\',\'RegeMatch\']'"  prompt="账号"  readonly="readonly" style="width:100%">
			</div>
			<div style="margin-bottom:7px">
				<input class="easyui-textbox" name="userName" data-options="validType:'multiple[\'length[3,100]\',\'RegeMatch\']'"  prompt="用户名" style="width:100%">
			</div>
			<div style="margin-bottom:7px">
				<input class="easyui-numberbox" name="userMobile" data-options="validType:'phone'" prompt="手机号" style="width:100%">
			</div>
			<div style="margin-bottom:7px">
				<input class="easyui-textbox" name="userEmail" data-options="required:true,validType:'email'" prompt="Email" style="width:100%">
			</div>
			<div style="margin-bottom:7px">
				<input class="easyui-datebox" name="birthday" prompt="生日" data-options="editable:false,panelWidth:220,panelHeight:240,iconWidth:30,formatter:yStyle,parser:yDate" style="width:100%">
			</div>
			<div style="margin-bottom:12px">
				性别:&nbsp;&nbsp;<select class="easyui-combobox" name="userGender" data-options="panelHeight:50" editable="false" style="width: 80px">
					<option value="0">女</option>
					<option value="1">男</option>
				</select>
			</div>
			<div style="margin-bottom:10px">
				<label class="textbox-label">停用:&nbsp;&nbsp;</label><input class="easyui-switchbutton" name="isActive">
			</div><br/>
			<a href="javascript:void(0)" class="easyui-linkbutton" plain="true" outline="true" onclick="saveUpdate();" style="width:60px;margin-right:50px">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" plain="true" outline="true" onclick="$('#updateUserForm').form('reset')" style="width:60px">重置</a>
		</form>
	</div>
	<!-- 添加窗口 -->
	<div id="addUser" class="easyui-dialog" style="padding:8px;width:80%;" data-options="inline:true,modal:true,closed:true,title:'添加'">
		<a style="position:absolute;top:6px;left:92%" href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#addUser').dialog('close')"><b style="color:red">X</b></a>		
		<form id="addUserForm">
			<div style="margin-bottom:7px">
				<input class="easyui-textbox" name="userCode" data-options="required:true,validType:'multiple[\'length[3,100]\',\'RegeMatch\']'"  prompt="账号"  style="width:100%">
			</div>
			<div style="margin-bottom:7px">
				<input class="easyui-textbox" name="userName" data-options="required:true,validType:'multiple[\'length[3,100]\',\'RegeMatch\']'"  prompt="用户名" style="width:100%">
			</div>
			<div style="margin-bottom:7px">
				<input class="easyui-numberbox" name="userMobile" data-options="required:true,validType:'phone'" prompt="手机号" style="width:100%">
			</div>
			<div style="margin-bottom:7px">
				<input class="easyui-textbox" name="userEmail" data-options="required:true,validType:'email'" prompt="Email" style="width:100%">
			</div>
			<div style="margin-bottom:7px">
				<input class="easyui-datebox" name="birthday" prompt="生日" data-options="editable:false,panelWidth:220,panelHeight:240,iconWidth:30,formatter:yStyle,parser:yDate" style="width:100%">
			</div>
			<div style="margin-bottom:12px">
				性别:&nbsp;&nbsp;<select class="easyui-combobox" name="userGender" data-options="panelHeight:50" editable="false" style="width: 80px">
					<option value="0">女</option>
					<option value="1">男</option>
				</select>
			</div>
			<a href="javascript:void(0)" class="easyui-linkbutton" plain="true" outline="true" onclick="saveAdd();" style="width:60px;margin-right:50px">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" plain="true" outline="true" onclick="$('#addUserForm').form('reset')" style="width:60px">重置</a>
		</form>
	</div>
  </body>
</html>
