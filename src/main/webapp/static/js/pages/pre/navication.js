var categoryUrlArray = new Array();//存储收藏数目
var categoryUrlArrayId = new Array();//存储收藏分类ID
var categoryUrlLinkDetailArray = new Array();//存储收藏类目关联地址详情
var currPageCategory = 1;
$(function (){
	/*请求收藏分类、收藏网址   收藏分类和分类中的链接分别从后台传过来，序号一一对应*/
	$.ajax({
		url: "../getCollectionWebsite",
		success: function(data) {
			if(data.success == "true") {
				var htmlCategoryUrl = "";
				//如果收藏分类个数少于8个,收藏分类不显示向左和向右图标
				if(data.pubcList.length <= 8){
					$("#categoryPrev").remove();
					$("#categoryNext").remove();
				}
				//遍历收藏分类
				for(var i=0;i<data.pubcList.length;i++){
					var categoryId = data.pubcList[i].id;
					var htmlFrame = "<dd style='display:none;'><div class='row'>";
					var htmlContent = "";
					var htmlFrameEnd = "</div></dd>";
					if(i == 0){
						htmlFrame = "<dd style='display:bolck;'><div class='row'>";
						/*导航分类*/
						$("#navCategoryList").append("<li><a class='navClassify' id='"+data.pubcList[i].id+"' cateName='"+data.pubcList[i].brandCategoryName+"' onmouseover='cateMouseOverStyle(this);' style='border:2px solid #F38844;border-right:none;background-color:#EEEEEE;display:block;text-align:center;font-weight:bold;color:#F38844'><div class='hidden-xs'>"+data.pubcList[i].brandCategoryName+"</div><div class='visible-xs' style='font-size:10px'>"+data.pubcList[i].brandCategoryName+"</div></a></li>")
						/*详细导航页*/
						if(data.publList[i] != undefined && data.publList[i].length>0){
							//关联的URL数量大于16，左右翻页箭头显示
							if(data.publList[i].length > 16){
								var htmls = "<div class='saveUrlStyleBottom visible-xs'>"+
												"<div class='prev'><img src='${pageContext.request.contextPath }/static/images/Pre/brand/green_left.png'  class='img-responsive' height='15px' width='20px'></div>"+
												"<div class='next'><img src='${pageContext.request.contextPath }/static/images/Pre/brand/green_right.png'  class='img-responsive'  height='15px' width='20px'></div>"+
											"</div>";
								$("#metro_box").after(htmls);
								var htmlsmall = "<div class='prev'><img src='${pageContext.request.contextPath }/static/images/Pre/brand/green_left.png'  class='img-responsive'></div><br>"+
												"<div style='visibility:hidden;height:2%;overflow:hidden'>这是个隐藏的内容</div>"+
												"<div class='next'><img src='${pageContext.request.contextPath }/static/images/Pre/brand/green_right.png'  class='img-responsive'></div>";
								$(".saveUrlStyle").append(htmlsmall);
							}
							/*默认显示页有关联*/
							for(var j=0;j<data.publList[i].length;j++){
								var cacheHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
								"<a href='"+data.publList[i][j].brandUrl+"' class='img-responsive' target='_blank'><img src='http://localhost/SJKJ/static"+data.publList[i][j].brandImgUrl+"'  alt='"+data.publList[i][j].brandName+"'></a><span><a href='"+data.publList[i][j].brandUrl+"' >"+data.publList[i][j].brandName+"</a></span>"+
								"</div>";
								htmlContent += cacheHtml;
							}
							/*最后的添加*/
							var addHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
							"<a href='#' class='img-responsive'  onclick='addLink(&quot;"+categoryId+"&quot;);'><img src='http://localhost/SJKJ/static/images/Pre/brand/add.png'  alt='添加'></a>"+
							"</div>";
							htmlContent += addHtml;
							$("#detailUrlList").append(htmlFrame+htmlContent+htmlFrameEnd);
						}else{
							/*默认显示页没有关联*/
							var cacheHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
							"<a href='#' class='img-responsive' onclick='addLink(&quot;"+categoryId+"&quot;);'><img src='http://localhost/SJKJ/static/images/Pre/brand/add.png'  alt='添加'></a>"+
							"</div>";
							htmlContent += cacheHtml;
							$("#detailUrlList").append(htmlFrame+htmlContent+htmlFrameEnd);
						}
						htmlCategoryUrl += "</br><p><a href='#' orders='"+(i+1)+"' ids='"+data.pubcList[i].id+"' style='padding:2px;cursor:pointer' onclick='updateCategoryName(this);'>"+data.pubcList[i].brandCategoryName+"</a></p>";
					}else if(i <= 7){//限制只显示8个收藏类目,从0开始
						$("#navCategoryList").append("<li><a class='navClassify'  id='"+data.pubcList[i].id+"' cateName='"+data.pubcList[i].brandCategoryName+"' onmouseover='cateMouseOverStyle(this);' style='border:1px solid grey;display:block;text-align:center'><div class='hidden-xs'>"+data.pubcList[i].brandCategoryName+"</div><div class='visible-xs' style='font-size:10px'>"+data.pubcList[i].brandCategoryName+"</div></a></li>")
							/*详细导航页 --非默认页*/
						if(data.publList[i] != undefined){
							//关联的URL小于16，左右翻页箭头不显示
							if(data.publList[i].length > 16){
								var htmls = "<div class='saveUrlStyleBottom visible-xs'>"+
												"<div class='prev'><img src='${pageContext.request.contextPath }/static/images/Pre/brand/green_left.png'  class='img-responsive' height='15px' width='20px'></div>"+
												"<div class='next'><img src='${pageContext.request.contextPath }/static/images/Pre/brand/green_right.png'  class='img-responsive'  height='15px' width='20px'></div>"+
											"</div>";
								$("#metro_box").after(htmls);
								var htmlsmall = "<div class='prev'><img src='${pageContext.request.contextPath }/static/images/Pre/brand/green_left.png'  class='img-responsive'></div><br>"+
												"<div style='visibility:hidden;height:2%;overflow:hidden'>这是个隐藏的内容</div>"+
												"<div class='next'><img src='${pageContext.request.contextPath }/static/images/Pre/brand/green_right.png'  class='img-responsive'></div>";
								$(".saveUrlStyle").append(htmlsmall);
							}
							/*显示页有关联*/
							for(var j=0;j<data.publList[i].length;j++){
								var cacheHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
								"<a href='"+data.publList[i][j].brandUrl+"' class='img-responsive' target='_blank'><img src='http://localhost/SJKJ/static"+data.publList[i][j].brandImgUrl+"'  alt='"+data.publList[i][j].brandName+"'></a><span><a href='"+data.publList[i][j].brandUrl+"' >"+data.publList[i][j].brandName+"</a></span>"+
								"</div>";
								htmlContent += cacheHtml;
							}
							/*最后的添加*/
							var addHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
							"<a href='#' class='img-responsive' onclick='addLink(&quot;"+categoryId+"&quot;);'><img src='http://localhost/SJKJ/static/images/Pre/brand/add.png'  alt='添加'></a>"+
							"</div>";
							htmlContent += addHtml;
							$("#detailUrlList").append(htmlFrame+htmlContent+htmlFrameEnd);
						}else{
							/*显示页没有关联*/
							var cacheHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
							"<a href='#' onclick='addLink(&quot;"+categoryId+"&quot;);'><img src='http://localhost/SJKJ/static/images/Pre/brand/add.png'  alt='添加'></a>"+
							"</div>";
							htmlContent += cacheHtml;
							$("#detailUrlList").append(htmlFrame+htmlContent+htmlFrameEnd);
						}
						htmlCategoryUrl += "<p><p><a href='#'  orders='"+(i+1)+"'  ids='"+data.pubcList[i].id+"'  style='padding:2px;cursor:pointer' onclick='updateCategoryName(this);'>"+data.pubcList[i].brandCategoryName+"</a></p>";
					}else{
						//将其它收藏分类填入到分类更新框中
						htmlCategoryUrl += "<p><p><a href='#'  orders='"+(i+1)+"'  ids='"+data.pubcList[i].id+"'  style='padding:2px;cursor:pointer' onclick='updateCategoryName(this);'>"+data.pubcList[i].brandCategoryName+"</a></p>";
					}
					//将关联URL添加到数组中
					var cache= "";
					if(data.publList[i] != undefined && data.publList[i].length>0){
						for(var j=0;j<data.publList[i].length;j++){
							cache += data.publList[i][j].brandUrl+"|"+data.publList[i][j].brandImgUrl+"|"+data.publList[i][j].brandName+"&";
						}
						categoryUrlLinkDetailArray[i] = cache;
					}else{
						categoryUrlLinkDetailArray[i] = "null";
					}
					//将收藏类目信息添加到数组中
					categoryUrlArray[i] = data.pubcList[i].brandCategoryName;
					categoryUrlArrayId[i] = data.pubcList[i].id;
				}
				//类目更新框填入收藏地址信息
				$("#updateCategoryLeft").html(htmlCategoryUrl);
			} else {
				if(data.msg == "请登录"){
					$("#contentEntity").html("").html("<h1 style='position:absolute;top:48%;left:48%'>"+data.msg+"</h1>");
				}else{
					$("#showTipContent").html("<br><div class='alert alert-danger'>"+data.msg+"</div>");
					$("#showTipFrame").modal("show");
				}
				var wh = $(window).height();
				wh = wh-138-100;
				$("footer").css("margin-top",wh);
			}
		}
	});
	$( "#categoryPrev" ).on('click', function(e) {
		e.preventDefault();
		if(currPageCategory > 1){
			//去除原先的数据
			$(".navClassify").remove();
			$("#detailUrlList").html("");
			//当前页小于总页码时
			for(var i =(currPageCategory-1-1)*8;i<(currPageCategory-1-1)*8+8;i++){
				if(categoryUrlArray[i] != undefined){
					//加新类目
					$("#navCategoryList").append("<li><a class='navClassify' onmouseover='cateMouseOverStyle(this);' style='border:1px solid grey;display:block;text-align:center'><div class='hidden-xs'>"+categoryUrlArray[i]+"</div><div class='visible-xs' style='font-size:10px'>"+categoryUrlArray[i]+"</div></a></li>");
					//加新类目下的关联
					var htmlFrame = "<dd style='display:none;'><div class='row'>";
					var htmlContent = "";
					var htmlFrameEnd = "</div></dd>";
					if(i == (currPageCategory-1-1)*8){
						htmlFrame = "<dd style='display:bolck;'><div class='row'>";
					}
					var culd = categoryUrlLinkDetailArray[i].split("&");
					if(culd+"" != "null"){
						for(var k=0;k<culd.length;k++){
							var arr = (culd[k]+"").split("|");
							if(arr[k] == null || arr[k] == ""){
								continue;
							}
							var cacheHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
							"<a href='"+arr[0]+"' class='img-responsive' target='_blank'><img src='http://localhost/SJKJ/static"+arr[1]+"'  alt='"+arr[2]+"'></a><span><a href='"+arr[0]+"' >"+arr[2]+"</a></span>"+
							"</div>";
							htmlContent += cacheHtml;
						}
						/*最后的添加*/
						var addHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
						"<a href='#' class='img-responsive' onclick='addLink(&quot;"+categoryUrlArrayId[i]+"&quot;);'><img src='http://localhost/SJKJ/static/images/Pre/brand/add.png'  alt='添加'></a>"+
						"</div>";
						htmlContent += addHtml;
					}else{
						/*显示页没有关联*/
						var cacheHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
						"<a href='#' onclick='addLink(&quot;"+categoryUrlArrayId[i]+"&quot;);'><img src='http://localhost/SJKJ/static/images/Pre/brand/add.png'  alt='添加'></a>"+
						"</div>";
						htmlContent += cacheHtml;
					}
					$("#detailUrlList").append(htmlFrame+htmlContent+htmlFrameEnd);
				}
			}
			currPageCategory--;//当前页减1
		}else{
			alert("已经最左了！");
		}
	});
	$( "#categoryNext" ).on('click', function(e) {
		e.preventDefault();
		var aa = categoryUrlArray.length;
		var pages = Math.ceil(aa/8);//获取总页数
		if(currPageCategory < pages){
			//去除原先的数据
			$(".navClassify").remove();
			$("#detailUrlList").html("");
			//当前页小于总页码时
			for(var i =(currPageCategory*8);i<currPageCategory*8+8;i++){
				if(categoryUrlArray[i] != undefined){
					/*alert(i)
					alert(categoryUrlLinkDetailArray)*/
					//加新类目
					$("#navCategoryList").append("<li><a class='navClassify' onmouseover='cateMouseOverStyle(this);' style='border:1px solid grey;display:block;text-align:center'><div class='hidden-xs'>"+categoryUrlArray[i]+"</div><div class='visible-xs' style='font-size:10px'>"+categoryUrlArray[i]+"</div></a></li>");
					//加新类目下的关联
					var htmlFrame = "<dd style='display:none;'><div class='row'>";
					var htmlContent = "";
					var htmlFrameEnd = "</div></dd>";
					if(i == (currPageCategory*8)){
						htmlFrame = "<dd style='display:bolck;'><div class='row'>";
					}
					var culd = categoryUrlLinkDetailArray[i].split("&");
					if(culd+"" != "null"){
						for(var k=0;k<culd.length;k++){
							var arr = (culd[k]+"").split("|");
							if(arr[k] == null || arr[k] == ""){
								continue;
							}
							var cacheHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
							"<a href='"+arr[0]+"' class='img-responsive' target='_blank'><img src='http://localhost/SJKJ/static"+arr[1]+"'  alt='"+arr[2]+"'></a><span><a href='"+arr[0]+"' >"+arr[2]+"</a></span>"+
							"</div>";
							htmlContent += cacheHtml;
						}
						/*最后的添加*/
						var addHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
						"<a href='#' class='img-responsive' onclick='addLink(&quot;"+categoryUrlArrayId[i]+"&quot;);'><img src='http://localhost/SJKJ/static/images/Pre/brand/add.png' class='img-responsive' alt='添加'></a>"+
						"</div>";
						htmlContent += addHtml;
					}else{
						/*显示页没有关联*/
						var cacheHtml = "<div class='col-md-3 col-sm-4 col-xs-6'>"+
						"<a href='#' onclick='addLink(&quot;"+categoryUrlArrayId[i]+"&quot;);'><img src='http://localhost/SJKJ/static/images/Pre/brand/add.png' class='img-responsive' alt='添加'></a>"+
						"</div>";
						htmlContent += cacheHtml;
					}
					$("#detailUrlList").append(htmlFrame+htmlContent+htmlFrameEnd);
				}
			}
			currPageCategory++;//当前页加1
		}else{
			alert("已经最右了！");
		}
		
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
//添加收藏类目
function addCategory(){
	var categoryName = $("#cateName").val();
	var order = $("#orderList").val();
	//校验order只能是数字
	var reg = /^[-+]?\d+$/;
	if (reg.test(order)) {
		//$("#order_tip").text("<b color='green'>√</b>");
	}else{
		$("#order_tip").html("<b style='color:red'>序列号只能输入数字</b>");
		$("#orderList").focus();
		return false;
	} 
	$('#addUrlCategory').modal('hide');
	var data = {brandCategoryName:categoryName,brandCategoryOrder:order};
	$.ajax({
		type: 'post',
		url: "../user/addUrlCategory",
		data: JSON.stringify(data),
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		success: function(data) {
			if(data.success == "true") {
				window.location.reload();//刷新当前页面.
			} else {
				$("#showTipContent").html("<br><div class='alert alert-danger'>"+data.msg+"</div>");
				$("#showTipFrame").modal("show");
			}
		}
	});
}
//更新_点击收藏类目
function updateCategoryName(obj){
	$("#updateCategoryRight").html("<h2>"+$(obj).text()+"</h2><br>");
	$("#updateCategoryRight").append("<div class='row'><div class='col-xs-10 col-sm-4 col-md-4'>新类目名:</div><div class='col-xs-10 col-sm-7 col-md-8'><input type='text' name='newCategoryName' class='form-control' value='"+$(obj).text()+"'/></div></div><br>");
	$("#updateCategoryRight").append("<div class='row'><div class='col-xs-10 col-sm-4 col-md-4'>序列:</div><div class='col-xs-10 col-sm-7 col-md-8'><input type='text' name='newOrder' class='form-control' value='"+$(obj).attr("orders")+"'/></div></div>");
	$("#updateCategoryRight").append("<input type='hidden' name='ids' value='"+$(obj).attr("ids")+"'/>");
	$("#updateCategoryRight").append("<input type='hidden' name='hiddenOrder' value='"+$(obj).attr("orders")+"'/>");
}
//更新收藏类目
function updateCategory(){
	var newCategoryName = $("input[name='newCategoryName']").val();
	var newOrder = $("input[name='newOrder']").val();
	var id = $("input[name='ids']").val();
	var oldOrder = $("input[name='hiddenOrder']").val();
	//暂时用PreUserBrandCategory中的isDel字段来存原来的序号
	$('#updateUrlCategory').modal('hide');
	var data = {brandCategoryName:newCategoryName,brandCategoryOrder:newOrder,id:id,isDel:oldOrder};
	$.ajax({
		type: 'post',
		url: "../user/updateUrlCategory",
		data: JSON.stringify(data),
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		success: function(data) {
			if(data.success == "true") {
				window.location.reload();//刷新当前页面.
			} else {
				$("#showTipContent").html("<br><div class='alert alert-danger'>"+data.msg+"</div>");
				$("#showTipFrame").modal("show");
			}
		}
	});
}
function customBtnStyle(obj){
	
	$(obj).css("color","#F38844");
}
function customOut(obj){
	$(obj).css("color","white");
}
//添加连接
function addLink(id){
	//alert(id)
	$("#addUrlLink").modal("show");
}
function dynFindBrand(obj){
	if($(obj).val() == null || $(obj).val() == ""){
		return;
	}
	var addr = $(obj).val();
	var start = addr.indexOf(".")+1;
	var addr1 = addr.substring(start);
	var end = addr1.indexOf(".");
	var subject = addr1.substring(0,end);
	var data = {linkAddr:subject};
	$.ajax({
		type: 'post',
		url: "../navication/dynFindBrand",
		data: JSON.stringify(data),
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		success: function(data) {
			if(data.success == "true") {
				//window.location.reload();//刷新当前页面.
				if(data.plist != null){
					$("#chooseLinkBrandContent").html("");
					$("#chooseLinkBrand").modal("show");
					for(var i=0;i<data.plist.length;i++){
						var cacheHtml = "<img onclick='clickChooseBrand(this);' class='img-responsive ' id='"+data.plist[i].id+"' title='"+data.plist[i].brandName+"' style='cursor:pointer' src='http://localhost/SJKJ/static"+data.plist[i].brandImgUrl+"'/>";
						$("#chooseLinkBrandContent").append(cacheHtml);
					}
					if(data.plist.length<2){
						$("#chooseLinkBrandContent").append("<br><br><br><br><br>");
					}
				}
			} else {
				/*$("#showTipContent").html("<br><div class='alert alert-danger'>"+data.msg+"</div>");
				$("#showTipFrame").modal("show");*/
			}
		}
	});
	
}
function clickChooseBrand(obj){
	if($(obj).css("border").indexOf("solid")>0){
		$(obj).css("border","none");
	}else{
		$(obj).css("border","2px solid green");
		$(obj).addClass("dynChooseBrand");
	}
}
//将选择的推荐图标生成缩略图
function makeSureChoose(){
	$("#linkThumbnail").html("");
	var src = $(".dynChooseBrand").attr("src");
	var cacheHtml =null;
	if(src!= null){
		cacheHtml = "<img class='img-responsive ' id='"+$(".dynChooseBrand").attr("id")+"' title='"+$(".dynChooseBrand").attr("title")+"'  src='"+src+"'/>";
	}
	$("#linkThumbnail").append(cacheHtml);
	$("#chooseLinkBrand").modal("hide");
}
var old_brand_url = null;
function fileChange(target) {  
	$("#linkThumbnail").html("");
	var isIE = /msie/i.test(navigator.userAgent) && !window.opera; 
    var fileSize = 0;           
    if (isIE && !target.files) {       
      var filePath = target.value;       
      var fileSystem = new ActiveXObject("Scripting.FileSystemObject");          
      var file = fileSystem.GetFile (filePath);       
      fileSize = file.Size;      
    } else {      
     fileSize = target.files[0].size;       
     }     
     var size = fileSize / 1024;    
     if(size>50){    
      alert("附件不能大于50kb");  
      target.value="";  
      return  
     }  
     var name=target.value;  
     var fileName = name.substring(name.lastIndexOf(".")+1).toLocaleUpperCase();  
     if(fileName !="PNG" && fileName !="JPEG" && fileName !="GIF"){
         alert("请选择PNG、JPEG、GIF格式文件上传！");
         target.value="";
         return
     }
     
     var file = target.files[0];
		var url = null ; 
		if (window.createObjectURL!=undefined) { // basic
			url = window.createObjectURL(file) ; 
			} else if (window.URL!=undefined) { // mozilla(firefox) 
				url = window.URL.createObjectURL(file) ; 
			} else if (window.webkitURL!=undefined) { // webkit or chrome 
				url = window.webkitURL.createObjectURL(file) ; 
			}
		var cacheHtml =null;
		if(url!= null){
			cacheHtml = "<img class='img-responsive '  src='"+url+"'/>";
			old_brand_url = url;
		}
		$("#linkThumbnail").append(cacheHtml);
   }  
//保存链接及图标
function saveBrand(){
	 var data = null;
	var linkAddr =  $("#linkAddr").val();
	var linkName =  $("#linkName").val();
	//所处分类信息，分类名和分类ID
	var cateId = null;
	var categoryName = null;
	$(".navClassify").each(function(){
		if($(this).css("border-right").indexOf("none")>=0){
			categoryName = $(this).attr("cateName");
			cateId = $(this).attr("id");
		}
	 });
	//判断是否有选择上传文件
	var imgurl = $("#linkThumbnail img").attr("src");
	var brandId = null;
	if(imgurl.indexOf("blob") >= 0){
		//此时说明是自定义
		//var imgPath = $("#uploadImg").val();
		var imgPath = old_brand_url;
		//file自定义上传的图片地址
		data = {brandUrl:linkAddr,brandName:linkName,brandId:"",file:imgPath,brandCategoryName:categoryName,brandCategoryId:cateId};
	}else{
		brandId = $("#linkThumbnail img").attr("id");
		//brandUrl收藏链接地址,brandName收藏链接名,brandId使用已存在的图标id，brandCategoryName所在分类名,brandCategoryId所在分类ID
		data = {brandUrl:linkAddr,brandName:linkName,brandId:brandId,brandCategoryName:categoryName,brandCategoryId:cateId};
	}
	$.ajax({
		type: 'post',
		url: "../navication/saveBrand",
		data: JSON.stringify(data),
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		success: function(data) {
			if(data.success == "true") {
				$("#addUrlLink").modal("hide");
				window.location.reload();//刷新当前页面.
			} else {
			}
		}
	});
}