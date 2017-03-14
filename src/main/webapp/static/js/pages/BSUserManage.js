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
			id : 'button-edit',	
			text : '修改',
			iconCls : 'icon-edit',
			handler : doEdit
		},{
			id : 'button-delete',
			text : '删除',
			iconCls : 'icon-cancel',
			handler : doDelete
		}];
		var columns = [ [
		{
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
			width : 120,
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
			width : 120,
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
/*	$('#updateWindow').window("open");
	$("#updateUserForm").form("load", rowData);*/
	alert(1)
}
function doAdd(){
	/*$('#addDecidedzoneWindow').window("open");*/
	alert("add")
}

function doEdit(){
	alert("修改...");
}

function doDelete(){
	alert("删除...");
}

function doSearch(){
	//$('#searchWindow').window("open");
}