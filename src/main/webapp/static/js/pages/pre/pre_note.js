var noteContentList = {};//
var _limit = 13;//每页大小
var currPage = 1;//当前页
var _showCount = 3;//当前页左右显示的页码
var _totalCount= "";
$(function (){
	noteContentList = {};//加载页面清空数据
	//页面加载，获取记录、笔记信息
	getNoteContentList(currPage,_limit,"");
	setTimeout(pagenations,100);//调用分页
});
function writeNode(){
	window.open("../pre_write_node");//打开新窗口，写记录
}
//给每个记录添加单击事件
function showsNoteDetail(obj){
	var markid = $(obj).attr("markid");
	$(".modal-dialog").css("left","0.5%");
	$(".modal-title").html($(obj).text());
	$("._noteContent").html(noteContentList[markid]);
	$("#showNoteDetail").modal("show");
}
function getNoteContentList(_curr, _limits, _totalCounts){
	$("#note_content_first").html("");//加载页面清空数据
	$("#note_content_sec").html("");//加载页面清空数据
	$("#note_content_thr").html("");//加载页面清空数据
	$("#note_content_besideOneRow").html("");//加载页面清空数据
	$.ajax({
		url:'../noteManage/getNoteContentList?pageSize='+_limits+'&currPage='+_curr,
		success:function(data){
			if(data.success == "true"){
				var arr = new Array();
				arr = data.data;
				for(var i=0;i<arr.length;i++){
					if(i==0){
					var html ="<div class='thumbnail thumbnail_big' style='margin-left:-0.6em'><a href='javascript:void(0)' class='thumbnail__link' style='height:510px'><img src='"+arr[0].navPicAddr+"' height='349' width='560' alt='News'>"+
								"</a>"+
                         "<div class='caption thumbnail__caption'>"+
                             "<div class='news caption__news'>"+
                                 "<p class='news__category yellow-line'>"+arr[0].cateName+"</p>"+
                                 "<a href='javascript:void(0);' class='news__head' markid='"+arr[0].id+"' onclick='showsNoteDetail(this);'>"+arr[0].noteTitle+"</a>"+
                                 "<p class='news__desc'>内容简介</p>"+
                             "</div>"+
                             "<div class='posted'>"+
                                 "<span class='posted__date'>"+arr[0].createTime+"</span>"+
                                 "<ul class='posted__icon'>"+
                                     "<li>"+
                                         "<span>"+
                                         "<i class='icon-comment-empty'></i>"+arr[0].commentTimes+
                                     "</span>"+
                                     "</li>"+
                                     "<li>"+
                                         "<span>"+
                                         "<i class='icon-eye'></i>"+arr[0].readTimes+
                                     "</span>"+
                                     "</li>"+
                                 "</ul>"+
                             "</div>"+
                         "</div></div>";
						$("#note_content_first").append(html);
						var recordid = arr[0].id;
						noteContentList[recordid] = arr[0].nodeContent;//id作为key，内容为value
					}else{
						var html_small = "<div class='row'>"+
	                       "<div class='thumbnail thumbnail_small'>"+
	                           "<a href='javascript:void(0)' class='thumbnail__link' style='height:200px'> "+
	                               "<img src='"+arr[i].navPicAddr+"' alt='News'>"+
	                           "</a>"+
	                           "<div class='caption thumbnail__caption'>"+
	                               "<div class='news caption__news'>"+
	                                   "<p class='news__category yellow-line'>"+arr[i].cateName+"</p>"+
	                                   "<a href='javascript:void(0)' class='news__link'  markid='"+arr[i].id+"' onclick='showsNoteDetail(this);'>"+
	                                       "<p class='news__text'>"+arr[i].noteTitle+"</p>"+
	                                   "</a>"+
	                               "</div>"+
	                               "<div class='posted'>"+
	                                   "<span class='posted__date'>"+arr[i].createTime+"</span>"+
	                                   "<ul class='posted__icon'>"+
	                                       "<li>"+
	                                           "<span>"+
	                                           "<i class='icon-comment-empty'></i>"+arr[i].commentTimes+
	                                       "</span>"+
	                                       "</li>"+
	                                       "<li>"+
	                                           "<span>"+
	                                           "<i class='icon-eye'></i>"+arr[i].readTimes+
	                                       "</span>"+
	                                       "</li>"+
	                                   "</ul>"+
	                               "</div>"+
	                           "</div>"+
	                        "</div>";
						if(i<= 4){
							if(i==1 || i==2){
								//此时添加一行
								$("#note_content_sec").append("<div class='col-sm-6'>"+html_small+"</div>");
							}else{
								$("#note_content_thr").append("<div class='col-sm-6'>"+html_small+"</div>");
							}
						}else{
							$("#note_content_besideOneRow").append("<div class='col-sm-3'>"+html_small+"</div>");
						}
						var recordids = arr[i].id;
						noteContentList[recordids] = arr[i].nodeContent;//id作为key，内容为value
					}
				}
				$(".note_main").css("position","relative");
				$("#note_content_header").removeClass("hide");
				//////////////////////////////////////////////////////////////////////////////////////////////
				//分页
				_totalCount = Number(data.total);
				
			}else if(data.success == "false"){
				$("#note_content_list").html("").html("<h1 style='position:absolute;top:48%;left:48%'> 请登录</h1>");
			}
		}
		
	});
}
function pagenations(){
	
	$('#pagination_bar').extendPagination({
        totalCount: _totalCount,
        showCount: _showCount,
        limit: _limit,
        callback: function (curr, limit, totalCount) {
        	getNoteContentList(curr, limit, totalCount);
        }
    });
}