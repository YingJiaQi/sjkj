$(function(){
	//页面加载时，起动手风琴样式，向后台请求数据
	startAccordion();
});
/**
 * 动态获取手拉琴菜单，方便权限管理
 */
function startAccordion(){
	//1,获取json
	$.ajax({
		url: '../user/getMenu',
		type: "post",
		success: function(data) {
			//2.解析json 
			//21,首先解析父菜单 //没有page属性的就是父
			for(var i = 0; i < data.length; i++) {

				if(data[i].page == undefined) {
					var parhtml = '<div  title="' + data[i].name + '"style="padding:5px;width:auto;fillSpace: true"><ul class="m-list" id="par_' + data[i].id + '"></ul></div>';
					$("#menuList").append(parhtml);
				}
			}
			//子菜单解析 ,有page属性  ,并把子添加到父容器中
			var chtml = null;
			for(var i = 0; i < data.length; i++) {
				if(data[i].page != undefined) {
					var pageName = data[i].name;
					var pageUrl = data[i].page;
					var component = data[i].componentCode;
					//子节点设计
					chtml = '<li><a href="#'+component+'" data-options="animation:'+"'"+'slide'+"'"+',direction:'+"'"+'left'+"'"+'" pageName="' + pageName + '" pageUrl="' + pageUrl + '" onclick="openpages(this)">' + '<img src="../static/images/BSMainPage/clipboard.png" style="height:12px">' + data[i].name + '</a></li>';
					//chtml = '<p style="cursor:pointer;height:20px;font-size:12px;padding:5px 0px 0px 5px;" pageName="' + pageName + '" pageUrl="' + pageUrl + '" onclick="openTabs(this)">' + '<img src="../static/images/BSMainPage/clipboard.png" style="height:12px">' + data[i].name + '</p>';
					$("#par_" + data[i].pId).append(chtml);
					
				}
			}
			$("#menuList").accordion(); //启动手风琴样式
			$("#menuList").accordion('getSelected').panel('collapse'); //默认关闭
		},
		error: function(data) {}
	});
}
//菜单点击,打开
/*function openpages(obj) {
	var text = $(obj).html();
	if(text.indexOf("后台用户管理") >0){
		alert(1)
		window.location.href="../login/BSMainPage";
	}
}*/
/**
 * 退出登录
 */
function loginOut(){
	$.ajax({
		type: "POST",
		url: "../user/loginOut",
		success: function(data) {
			location.href = '../login/BackStageLogin';
		}
	});
}
/**
 * 修改密码
 */
function changePassword(){
	var old = $("#oldPwd").val();
	if(old == null || old == ""){
		$("#popup_oldPwd").dialog("open").dialog("center");
		return;
	}
	var newPwd = $("#newPwd").val();
	if(newPwd == null || newPwd == ""){
		$("#popup_newPwd").dialog("open").dialog("center");
		return;
	}
	var reNewPwd = $("#reNewPwd").val();
	if(reNewPwd == null || reNewPwd == ""){
		$("#popup_reNewPwd").dialog("open").dialog("center");
		return;
	}
	if(reNewPwd != newPwd){
		$("#popup_pwdCompare").dialog("open").dialog("center");
		return;
	}
	var BASE64 = new Base64(); 
	var dataVo = {
		"newPwd": BASE64.encode(newPwd),
		"oldPwd": BASE64.encode(old)
	};
	$.ajax({
		type: "POST",
		url: "../user/changePwd",
		data: JSON.stringify(dataVo),
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		success: function(data) {
			if(data.success == "true") {
				$.messager.alert("恭喜", data.msg +
					"-将在3秒后自动跳转至登录页面",
					"info");
				for(var i = 3; i >= 0; i--) {
					window.setTimeout(
						'toLoginPage(' + i +
						')',
						(3 - i) * 1000);
				}
			} else {
				$.messager.alert("出错了！",
					data.msg);
			}
		}
	});
}
function toLoginPage(num) {
	if(num == 0) {
		window.location.href = "../login/BackStageLogin";
	}
}
/*******顶部特效 *******/
/**
 * 更换EasyUI主题的方法
 * @param themeName
 * 主题名称
 */
changeTheme = function(themeName) {
	var $easyuiTheme = $('#easyuiTheme');
	var url = $easyuiTheme.attr('href');
	var href = url.substring(0, url.indexOf('themes')) + 'themes/' +themeName + '/easyui.css';
	$easyuiTheme.attr('href', href);
	var $iframe = $('iframe');
	if($iframe.length > 0) {
		for(var i = 0; i < $iframe.length; i++) {
			var ifr = $iframe[i];
			$(ifr).contents().find('#easyuiTheme').attr('href', href);
		}
	}
};