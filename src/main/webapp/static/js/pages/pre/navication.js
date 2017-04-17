$(function (){
	/*请求收藏分类、收藏网址*/
	$.ajax({
		url: "../getCollectionWebsite",
		success: function(data) {
			if(data.success == "true") {
				for(var i=0;i<data.pubcList.length;i++){
					var htmlFrame = "<dd style='display:none;'><div class='row'>";
					var htmlContent = "";
					var htmlFrameEnd = "</div></dd>";
					if(i == 0){
						htmlFrame = "<dd style='display:bolck;'><div class='row'>";
						/*导航分类*/
						$("#navCategoryList").append("<li><a class='navClassify' onmouseover='cateMouseOverStyle(this);' style='border:2px solid #F38844;border-right:none;background-color:#EEEEEE;display:block;text-align:center;font-weight:bold;color:#F38844'>"+data.pubcList[i].brandCategoryName+"</a></li>")
						/*详细导航页*/
						if(data.publList[i] != undefined && data.publList[i].length>0){
							/*默认显示页有关联*/
							for(var j=0;j<data.publList[i].length;j++){
								var cacheHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
								"<a href='"+data.publList[i][j].brandUrl+"' class='img-responsive' target='_blank'><img src='http://localhost/SJKJ/static"+data.publList[i][j].brandImgUrl+"'  alt='"+data.publList[i][j].brandName+"'></a><span><a href='"+data.publList[i][j].brandUrl+"' >"+data.publList[i][j].brandName+"</a></span>"+
								"</div>";
								htmlContent += cacheHtml;
							}
							$("#detailUrlList").append(htmlFrame+htmlContent+htmlFrameEnd);
						}else{
							/*默认显示页没有关联*/
							var cacheHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
							"<a href='#' class='img-responsive' target='_blank'><img src='#'  alt='#'></a>"+
							"</div>";
							htmlContent += cacheHtml;
							$("#detailUrlList").append(htmlFrame+htmlContent+htmlFrameEnd);
						}
					}else{
						$("#navCategoryList").append("<li><a class='navClassify' onmouseover='cateMouseOverStyle(this);' style='border:1px solid grey;display:block;text-align:center'>"+data.pubcList[i].brandCategoryName+"</a></li>")
							/*详细导航页 --非默认页*/
						if(data.publList[i] != undefined){
							/*显示页有关联*/
							for(var j=0;j<data.publList[i].length;j++){
								var cacheHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
								"<a href='"+data.publList[i][j].brandUrl+"' class='img-responsive' target='_blank'><img src='http://localhost/SJKJ/static"+data.publList[i][j].brandImgUrl+"'  alt='"+data.publList[i][j].brandName+"'></a><span><a href='"+data.publList[i][j].brandUrl+"' >"+data.publList[i][j].brandName+"</a></span>"+
								"</div>";
								htmlContent += cacheHtml;
							}
							$("#detailUrlList").append(htmlFrame+htmlContent+htmlFrameEnd);
						}else{
							/*显示页没有关联*/
							var cacheHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
							"<a href='#' class='img-responsive' target='_blank'><img src='#'  alt='#'></a>"+
							"</div>";
							htmlContent += cacheHtml;
							$("#detailUrlList").append(htmlFrame+htmlContent+htmlFrameEnd);
						}
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
	$( "#id-btn-addURLCategory" ).on('click', function(e) {
		e.preventDefault();
	
		$( "#dialog-confirm" ).removeClass('hide').dialog({
			resizable: false,
			modal: true,
			title: "<div class='widget-header'><h4 class='smaller'><i class='icon-warning-sign red'></i> Empty the recycle bin?</h4></div>",
			title_html: true,
			buttons: [
				{
					html: "<i class='icon-trash bigger-110'></i>&nbsp; Delete all items",
					"class" : "btn btn-danger btn-xs",
					click: function() {
						$( this ).dialog( "close" );
					}
				}
				,
				{
					html: "<i class='icon-remove bigger-110'></i>&nbsp; Cancel",
					"class" : "btn btn-xs",
					click: function() {
						$( this ).dialog( "close" );
					}
				}
			]
		});
	});
});
function cateMouseOverStyle(obj){
	$(".navClassify").css("border","1px solid grey");
	$(".navClassify").css("background-color", "white");
	$(".navClassify").css("color", "black");
	$(".navClassify").css("font-weight", "normal");
	$(obj).css("border","2px solid #F38844");
	$(obj).css("border-right","none");
	$(obj).css("color","#F38844");
	$(obj).css("font-weight","bold");
	$(obj).css("background-color", "#EEEEEE");
	var liList = $(".navClassify");
	for(var i=0;i<liList.length;i++){
		if($(liList[i]).text() ==$(obj).text()){
			var dd = $("#metro_box dl dd")[i];
			if(dd == undefined){
				$("#metro_box dl dd").css("display", "none");
			}else{
				$(dd).siblings().css("display", "none");
				$(dd).css("display", "block");
			}
		}
	}
}
function addCategory(){
	alert(1)
}
function customBtnStyle(obj){
	$(obj).css("color","#F38844");
}
function customOut(obj){
	$(obj).css("color","white");
}