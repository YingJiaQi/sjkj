$(function() {
	$("#firstname").val("");
	//dom随页面流动
	$(window).scroll(function() {
		var top = $(window).scrollTop()+200;
		var left= document.body.clientWidth*0.95;
		$("#floatButton").css({ left:left + "px", top: top + "px" });
	});
	$("#firstname").click(function() {
		//弹出分类选择框
		$("#showCate").modal("show");
	});
	//分类名添加颜色
	$(".cateName").click(function(){
		if($(this).attr('class').indexOf("default")>0){
			$(this).removeClass("btn-default");
			$(this).addClass("btn-success");
		}else{
			$(this).removeClass("btn-success");
			$(this).addClass("btn-default");
		}
	});
	//弹出框点确认
	$(".showCateSure").click(function(){
		//获取选中的分类
		var chooseCate="";
		$(".cateName").each(function(){
			if($(this).attr('class').indexOf("success")>0){
				chooseCate += $(this).text()+",";
			}
		});
		if($("#customCate").val() != null || $("#customCate").val() != ""){
			chooseCate = chooseCate + $("#customCate").val();
		}else{
			chooseCate = chooseCate.substring(0,chooseCate.length-1);
		}
		$("#firstname").val(chooseCate);
	});
	//动态加载用户之前定义的笔记类目
	$.ajax({
		type: 'post',
		url: "../getUserNoteCategory",
		success: function(data) {
			if(data.success == "true") {
				for(var i=0;i<data.cateList.length;i++){
					$("#note_cate_list").append("<button type='button' class='btn btn-default cateName'>"+data.cateList[i]+"</button>");
				}
			} else {
				alert("类目加载失败");
			}
		}
	});
}); 
function writeNodeClose(){
	window.close();
}
//保存记录
function writeNodeSave(){
	if($("#firstname").val() == ""){
		alert("分类不能为空");
		return;
	}
	if($("#secname").val() == ""){
		alert("标题不能为空");
		return;
	}
	if(ue.hasContents()){ //此处以非空为例
		ue.sync();       //同步内容
		document.getElementById("ueditForm").submit();  //提交Form
	}else{
		alert("内容不能为空");
	}
}
function writeNodeSkin(){
	alert("换肤")
}
