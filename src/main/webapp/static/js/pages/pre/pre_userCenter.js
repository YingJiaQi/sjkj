$(function(){
	aboutUsFunction(1);
});
function aboutUsFunction(obj){
	if(obj == "1"){
		//个人中心
		$.ajax({
			type: 'post',
			url:'../user/getUserInfo',
			success:function(data){
				if(data.success == "true"){
					$("#account").val(data.data.userName);
					if(data.data.userGender == 0){
						$("#sex").val("女");
					}else{
						$("#sex").val("男");
					}
					$("#phonenum").val(data.data.userMobile);
					$("#email").val(data.data.userEmail);
					$("#birthday").val(data.data.birthday);
					$("#privilege").val(data.data.privilegeLevel);
					$("#lastLoginTime").val(data.data.lastLoginTime);
					$("#LoginTimes").val(data.data.loginTimes);
					$("#registerTime").val(data.data.createTime);
				}else{
					
				}
			}
		})
	}else if(obj == "2"){
		var dataVo = {moduleName : "信息修改", modulePage : "关于我们"};
		$("#moduleTitle").html("发展历程");
	}else if(obj == "3"){
		var dataVo = {moduleName : "公司文化", modulePage : "关于我们"};
		$("#moduleTitle").html("公司文化");
	}else if(obj == "4"){
		var dataVo = {moduleName : "联系我们", modulePage : "关于我们"};
		$("#moduleTitle").html("联系我们");
	}
}