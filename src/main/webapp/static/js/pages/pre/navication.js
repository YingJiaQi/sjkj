$(function (){
	/*请求收藏分类、收藏网址*/
	$.ajax({
		url: "../getCollectionWebsite",
		success: function(data) {
			if(data.success == "true") {
				for(var i=0;i<data.pubcList.length;i++){
					if(i == 0){
						$("#navCategoryList").append("<li><a class='navClassify' style='border:2px solid #F38844;border-right:none;background-color:#EEEEEE;display:block;text-align:center'>"+data.pubcList[i].brandCategoryName+"</a></li>")
					}else{
						$("#navCategoryList").append("<li><a class='navClassify' style='border:1px solid grey;display:block;text-align:center'>"+data.pubcList[i].brandCategoryName+"</a></li>")
					}
				}
			} else {
				$(".saveUrlStyle").remove();
				$(".saveUrlStyleBottom").remove();
				$("#contentEntity").html("").html("<h1 style='position:absolute;top:48%;left:48%'>"+data.msg+"</h1>");
				var wh = $(window).height();
				wh = wh-138-100;
				$("footer").css("margin-top",wh);
			}
		}
	});
	$("#metro_box").css("margin-top", "10px");
	//链接在新窗口打开
	$(".a_link dd a").attr("target", "_blank");
	$(".a_link ul li>a").hover(function() {
		var a_href = $(this).attr("href");
		$(this).siblings().find("a").attr("href", a_href);
	});
	$(".navClassify").mouseover(function(e){
		$(".navClassify").css("border","1px solid grey");
		$(".navClassify").css("background-color", "white");
		$(this).css("border","2px solid #F38844");
		$(this).css("border-right","none");
		$(this).css("background-color", "#EEEEEE");
		/*var liList = $(".navClassify");
		for(var i=0;i<liList.length;i++){
			if($(liList[i]).text() ==$(this).text()){
				var dd = $("#metro_box dl dd")[i];
				$(dd).siblings().css("display", "none");
				$(dd).css("display", "block");
			}
		}*/
	}).mouseout(function(e){
		//$(this).css("border","1px solid grey");
		//$(this).css("border-right","1px solid grey");
	})
});