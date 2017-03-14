function openpages(obj){
	var text = $(obj).html();
	if(text.indexOf("后台用户管理") >0){
		//工具栏
		var toolbar = [ {
			id : 'button-search',	
			text : '查询',
			iconCls : 'icon-search',
			handler : doSearch
		}, {
			id : 'button-add',
			text : '增加',
			iconCls : 'icon-add',
			handler : doAdd
		}, {
			id : 'button-delete',
			text : '删除',
			iconCls : 'icon-cancel',
			handler : doDelete
		}];
		var columns = [ [
		{
			field : 'id',
			title : 'id',
			width : 90,
			align : 'center',
			hidden :true
		},{
			field : 'userName',
			title : '用户名',
			width : 90,
			align : 'center',
		},
		{
			field : 'userGender',
			title : '性别',
			width : 40,
			align : 'center',
			formatter : function(data, row, index) {
				if (data == '1') {
					return "男";
				} else {
					return "女";
				}
			}
		},
		{
			field : 'userMobile',
			title : '手机号',
			width : 90,
			align : 'center'
		},
		{
			field : 'userEmail',
			title : '邮箱',
			width : 120,
			align : 'center'
		},
		{
			field : 'birthday',
			title : '生日',
			width : 80,
			align : 'center'
		},
		{
			field : 'loginTimes',
			title : '登录次数',
			width : 60,
			align : 'center',
		},
		{
			field : 'lastLoginTime',
			title : '最后登录的时间',
			width : 130,
			align : 'center',
			
		}] ];
		$('#grid').datagrid({
			fit : true,
			border : false,
			rownumbers : true,
			animate : true,
			singleSelect : true,
			striped : true,
			pageList : [ 10, 20, 50 ],
			pagination : true,
			url : "../user/getUserList",
			columns : columns,
			toolbar : toolbar,
			loadMsg : '数据加载中...',
			frozenColumns : [ [ {
				field : 'userCode',
				title : '账号',
				width : 80,
				align : 'left',
			} ] ],
			onDblClickRow : doDblClickRow
		});
	}
}
//双击修改内容
function doDblClickRow(rowIndex, rowData){
	$("#updateUser").dialog("open").dialog("center");
	$("#updateUserForm").form("load", rowData);
}
function doAdd(){
	$("#addUser").dialog("open").dialog("center");
}

function doDelete(){
	$.messager.confirm('提示:',	'你确认要删除吗?',	function(event) {
		if (event) {
			var id = $('#grid').datagrid("getSelected");
			var dataVo = {
				id : id
			};
			$.ajax({
				type : 'post',
				url : '../user/deleteUserById',
				data : JSON.stringify(dataVo),
				dataType : 'json',
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					if (data.success == "true") {
						$('#grid').datagrid('reload');
						$.messager.alert('提示',data.msg,"info");
					} else {
						$.messager.alert('提示',	data.msg);
					}
				}
			});
		} else {
			return;
		}
	});
}

function doSearch(){
	//$('#searchWindow').window("open");
}
/**
 * 保存更新
 */
function saveUpdate(){
	var data = $("#updateUserForm").serialize();
	//alert(data)
	if($("#updateUserForm").form("validate")) {
		$.ajax({
			type: 'post',
			url: "../user/updateUser",
			data: JSON.stringify(conveterParamsToJson(data)),
			dataType: 'json',
			contentType: "application/json; charset=utf-8",
			success: function(data) {
				if(data.success == "true") {
					$("#grid").datagrid('reload');
					$.messager.alert('更新成功', data.msg, "info");
				} else {
					$.messager.alert('更新失败', data.msg, "error");
				}
			}
		});
	} else {
		return;
	}
	$('#updateUser').dialog('close');
	$("#updateUserForm").form('reset');
}
/**
 * 保存添加
 */
function saveAdd(){
	var data = $("#addUserForm").serialize();
	//alert(data)
	if($("#addUserForm").form("validate")) {
		$.ajax({
			type: 'post',
			url: "../user/addUser",
			data: JSON.stringify(conveterParamsToJson(data)),
			dataType: 'json',
			contentType: "application/json; charset=utf-8",
			success: function(data) {
				if(data.success == "true") {
					$("#grid").datagrid('reload');
					$.messager.alert('添加成功', data.msg, "info");
				} else {
					$.messager.alert('添加失败', data.msg, "error");
				}
			}
		});
	} else {
		return;
	}
	$('#addUser').dialog('close');
	$("#addUserForm").form('reset');
}