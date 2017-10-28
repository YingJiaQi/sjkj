$(function (){
	/*页面加载获取书籍信息*/
	$.ajax({
		url:'../stackroomManager/getBooksList',
		type:'post',
		data:'',
		contentType: "application/json; charset=utf-8",
		success:function(data){
			if(data.success == "true"){
				//动态去除页面上的网页收藏 新书上架
				for(var i=0;i<data.newList.length;i++){
					var oldprice = "";
					var remarks = "";
					if(data.newList[i].oldPrice != undefined){
						oldprice = data.newList[i].oldPrice;
					}
					if(data.newList[i].remarks != undefined){
						remarks = data.newList[i].remarks;
					}
					var html = " <div class='col-xs-6 col-sm-4 col-md-2'> "+
					        " <div class='thumbnail'>  "+
					        	"<a href='javascript:void(0)' onclick='showBookDetail(this)' urls='"+data.newList[i].bookUrl+"'>  "+
						            "<img src='http://47.95.208.48:8088"+data.newList[i].picUrl+"' alt='"+data.newList[i].bookName+"' class='img-rounded'>  "+
					        		"<br><b style='color:#000000'>&nbsp;"+data.newList[i].bookName+"</b>  "+
					        	"</a>  "+
					            "<div class='caption'>  "+
					                "<h5 style='color:#BFBFBF'>"+data.newList[i].bookAuthor+"</h5>  "+
					                "<p><b style='color:#CE3D0D'>"+data.newList[i].price+"积分</b>"+oldprice+"</p>  "+
					                "<p>"+remarks+"</p>"+
					            "</div>  "+
					        "</div>  "+
					    "</div>";
					$("#newBooksList").append(html);
				}
				
				//畅销榜
				for(var i=0;i<data.cxList.length;i++){
					var oldprice = "";
					var remarks = "";
					if(data.cxList[i].oldPrice != undefined){
						oldprice = data.cxList[i].oldPrice;
					}
					if(data.cxList[i].remarks != undefined){
						remarks = data.cxList[i].remarks;
					}
					var html = " <div class='col-xs-6 col-sm-4 col-md-2'> "+
					        " <div class='thumbnail'>  "+
					        	"<a href='javascript:void(0)' onclick='showBookDetail(this)' urls='"+data.cxList[i].bookUrl+"'>  "+
						            "<img src='http://47.95.208.48:8088"+data.cxList[i].picUrl+"' alt='"+data.cxList[i].bookName+"' class='img-rounded'>  "+
					        		"<br><b style='color:#000000'>&nbsp;"+data.cxList[i].bookName+"</b>  "+
					        	"</a>  "+
					            "<div class='caption'>  "+
					                "<h5 style='color:#BFBFBF'>"+data.cxList[i].bookAuthor+"</h5>  "+
					                "<p><b style='color:#CE3D0D'>"+data.cxList[i].price+"积分</b>"+oldprice+"</p>  "+
					                "<p>"+remarks+"</p>"+
					            "</div>  "+
					        "</div>  "+
					    "</div>";
					$("#cxBooksList").append(html);
				}
				//好评榜
				for(var i=0;i<data.hpList.length;i++){
					var oldprice = "";
					var remarks = "";
					if(data.hpList[i].oldPrice != undefined){
						oldprice = data.hpList[i].oldPrice;
					}
					if(data.hpList[i].remarks != undefined){
						remarks = data.hpList[i].remarks;
					}
					var html = " <div class='col-xs-6 col-sm-4 col-md-2'> "+
					        " <div class='thumbnail'>  "+
					        	"<a href='javascript:void(0)' onclick='showBookDetail(this)' urls='"+data.hpList[i].bookUrl+"'>  "+
						            "<img src='http://47.95.208.48:8088"+data.hpList[i].picUrl+"' alt='"+data.hpList[i].bookName+"' class='img-rounded'>  "+
					        		"<br><b style='color:#000000'>&nbsp;"+data.hpList[i].bookName+"</b>  "+
					        	"</a>  "+
					            "<div class='caption'>  "+
					                "<h5 style='color:#BFBFBF'>"+data.hpList[i].bookAuthor+"</h5>  "+
					                "<p><b style='color:#CE3D0D'>"+data.hpList[i].price+"积分</b>"+oldprice+"</p>  "+
					                "<p>"+remarks+"</p>"+
					            "</div>  "+
					        "</div>  "+
					    "</div>";
					$("#hpBooksList").append(html);
				}
				//收藏榜
				for(var i=0;i<data.scList.length;i++){
					var oldprice = "";
					var remarks = "";
					if(data.scList[i].oldPrice != undefined){
						oldprice = data.scList[i].oldPrice;
					}
					if(data.scList[i].remarks != undefined){
						remarks = data.scList[i].remarks;
					}
					var html = " <div class='col-xs-6 col-sm-4 col-md-2'> "+
					        " <div class='thumbnail'>  "+
					        	"<a href='javascript:void(0)' onclick='showBookDetail(this)' urls='"+data.scList[i].bookUrl+"'>  "+
						            "<img src='http://47.95.208.48:8088"+data.scList[i].picUrl+"' alt='"+data.scList[i].bookName+"' class='img-rounded'>  "+
					        		"<br><b style='color:#000000'>&nbsp;"+data.scList[i].bookName+"</b>  "+
					        	"</a>  "+
					            "<div class='caption'>  "+
					                "<h5 style='color:#BFBFBF'>"+data.scList[i].bookAuthor+"</h5>  "+
					                "<p><b style='color:#CE3D0D'>"+data.scList[i].price+"积分</b>"+oldprice+"</p>  "+
					                "<p>"+remarks+"</p>"+
					            "</div>  "+
					        "</div>  "+
					    "</div>";
					$("#scBooksList").append(html);
				}
			}else{
				alert("系统暂时无响应");
			}
		}
	});
});
function showBookDetail(obj){
	var url = $(obj).attr("urls");
	window.open("../stackroomManager/toBookReadingPage?bookUrl="+url);
}
