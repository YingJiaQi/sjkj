var availHeight = null;//屏幕可见区域高
var availWidth = null;//屏幕可见区域宽
$(function() {
    $(document).mousemove(function(e) {
        if (!!this.move) {
            var posix = !document.move_target ? {'x': 0, 'y': 0} : document.move_target.posix,
                callback = document.call_down || function() {
                    $(this.move_target).css({
                        'top': e.pageY - posix.y,
                        'left': e.pageX - posix.x
                    });
                };

            callback.call(this, e, posix);
        }
    }).mouseup(function(e) {
        if (!!this.move) {
            var callback = document.call_up || function(){};
            callback.call(this, e);
            $.extend(this, {
                'move': false,
                'move_target': null,
                'call_down': false,
                'call_up': false
            });
        }
    });
    availHeight = window.screen.availHeight;
    availWidth = document.body.clientWidth ;
    $("#bottomBox").css("height",availHeight);
    //调用插件
    var playLocation = $("#domScrollPanel");
    domCircleDisplay(plugArr, playLocation);
    //下拉
	$(".openDrage").dragging({
		move : 'y',
		randomPosition : true
	});
	$(".openDrage").css("left","0").css("top","-140px");

	$(".openDrage").mouseup(function(e){
		if($(".openDrage img").attr("src").indexOf("close") >0 ){
			
			//关闭插件panel
			$("#nav_head").css("display","none");
			$("#hiddenDom").css("display","none");
			$(".openDrage img").attr("src","../static/images/Pre/customPage/open.png");
			$(".openDrage").css("top","-320px");
			$("#savePageButton").css("display","none");
			//将页面所有元素position属性高度减200px;
			$("*").each(function(index){
				//外面框架一定不要加title
				if($(this).hasClass("positionStyle")){
					$(this).css("top",$(this).offset().top-210);
				}
			});
		}else{
			//复位
			$(this).css("left","0").css("top","-140px");
			$("#nav_head").css("display","block");
			$("#hiddenDom").css("display","block");
			$("#savePageButton").css("display","block");
			$(".openDrage img").attr("src","../static/images/Pre/customPage/close.png");
			//将页面所有元素position属性高度加200px;
			$("*").each(function(index){
				//外面框架一定不要加title
				if($(this).hasClass("positionStyle")){
					$(this).css("top",$(this).offset().top+210);
				}
			});
		}
	});
});
function activeBox(obj){

    $(".activeBox .activeBox_title").removeClass("activeBox_title");
    $(".activeBox").removeClass("activeBox");
    
    var moveBox =  null;
    $(obj).mousedown(function(e) {
    	//加上180是因为插件的宽度
        //if(($("#bottomBox").offset().top+180 - $(this).offset().top) > 0){
    	//alert($(this).parent().css("position"))
    	if($(this).parent().css("position") == "static"){
            moveBox = $(this).parent().clone();
            $("body").append(moveBox);
            var moveBox_title = $(moveBox).children("div").get(0);
            $(moveBox_title).addClass("activeBox_title");
            $(moveBox_title).parent().addClass("activeBox");
            $(moveBox_title).parent().addClass("positionStyle");
            $(moveBox_title).parent().css("top",$(this).offset().top);
            $(moveBox_title).parent().css("left",$(this).offset().left);
        }else{
            moveBox = $(this).parent();
            $(this).addClass("activeBox_title");
            $(this).parent().addClass("activeBox");
        }
       
       
        
        var $p = moveBox;
        var $pp = $p[0];
        var offset = $p.offset();
        $pp.posix = {'x': e.pageX - offset.left, 'y': e.pageY - offset.top};
        $.extend(document, {'move': true, 'move_target':$pp });

        //超出边框删除box
        

        $(".activeBox").bind(
            {'mousemove':function(e){
                $(this).css({cursor: "default"});
                var offset = $(this).offset(), resize=true;
                var x = e.clientX, y = e.clientY, t = offset.top, l = offset.left, w = $(this).width(), h = $(this).height(), ww = $('.boxTopDrage').height(), b = 10;
            	//自已添加的qq变量，只有这样当滚动条下拉时，改变盒子形状功能才能使用，只在y上加qq，因为滚动条位置改变只对该变量有影响
                var qq = $(document).scrollTop();//查询滚动条当前位置（距离顶部）
              
                //alert(y+"---"+t)
                if(x<(l+b) && y+qq > (t+ww) && y+qq < (t+h-b)){
                    //左边
                    //alert('左边')
                    $(this).css({cursor: "w-resize"});
                    $(this).unbind("mousedown").bind({"mousedown":function(e){
                        var $p = $(this);
                        var posix = {
                                'w': $p.width(), 
                                'h': $p.height(), 
                                'x': e.pageX, 
                                'y': e.pageY
                            };
                        
                        $.extend(document, {'move': true, 'call_down': function(e) {
                            $p.css({
                                'width': Math.max(30,  posix.x-e.pageX + posix.w),
                                'left': Math.max(30,  e.pageX)
                            });
                        }});
                    }});
                }else if(x<(l+w) && x>(l+w-b) &&  y+qq > (t+ww) && y+qq < (t+h-b)){
                    //右边
                	// alert('右边')
                    $(this).css({cursor: "e-resize"});
                    $(this).unbind("mousedown").bind({"mousedown":function(e){
                        var $p = $(this);
                        var posix = {
                                'w': $p.width(), 
                                'x': e.pageX
                            };
                        resizeBox($p, posix, e);
                    }});
                }else if(y+qq<(t+h) && y+qq>(t+h-b) && x>(l+b) && x<(l+w-b)){
                    //下边拖拽
                	//alert('下边拖拽')
                    $(this).css({cursor: "s-resize"});
                    $(this).unbind("mousedown").bind({"mousedown":function(e){
                            var $p = $(this);
                            var posix = {
                                    'h': $p.height(), 
                                    'y': e.pageY
                                };
                            resizeBox($p, posix, e);
                        }
                    });
                }else if(x<(l+b) && y+qq>(t+h-b) && y+qq<(t+h)){
                    //左斜角
                	//alert('左斜角')
                    $(this).css({cursor: "sw-resize"});
                    $(this).unbind("mousedown").bind({"mousedown":function(e){
                        var $p = $(this);
                        var posix = {
                                'w': $p.width(), 
                                'h': $p.height(), 
                                'x': e.pageX, 
                                'y': e.pageY
                            };
                        
                        $.extend(document, {'move': true, 'call_down': function(e) {
                            $p.css({
                                'width': Math.max(30,  posix.x-e.pageX + posix.w),
                                'height': Math.max(30, e.pageY - posix.y + posix.h),
                                'left': Math.max(30,  e.pageX)
                            });
                        }});
                    }});
                }else if(y+qq<(t+h) && y+qq>(t+h-b) && x<(l+w) && x>(l+w-b)){
                    //右斜角
                	//alert('右斜角')
                    $(this).css({cursor: "se-resize"});
                    $(this).unbind("mousedown").bind({"mousedown":function(e){
                        var $p = $(this);
                        var posix = {
                            'w': $p.width(), 
                            'h': $p.height(), 
                            'x': e.pageX, 
                            'y': e.pageY
                        };
                        $.extend(document, {'move': true, 'call_down': function(e) {
                            $p.css({
                                'width': Math.max(30, e.pageX - posix.x + posix.w),
                                'height': Math.max(30, e.pageY - posix.y + posix.h)
                            });
                        }});
                    }
                    });
                }else if(y+qq<(t+ww) && x>l && x<(l+w)){
                    //拖拽区域
                    $(this).css({cursor: "move"});
                    $(this).unbind("mousedown");
                }
            },
            "mouseup":function(){
                //鼠标放下
                $(this).unbind("mousedown");
            }
        });
        function resizeBox($p,posix,e){
            $.extend(document, {'move': true, 'call_down': function(e) {
                $p.css({
                    'width': Math.max(30, e.pageX - posix.x + posix.w),
                    'height': Math.max(30, e.pageY - posix.y + posix.h)
                });
            }});
        }
    }).mouseup(function(e) {
    	$(".positionStyle").each(function(){
    		//超过bottomBox左侧   删除
            if(($("#bottomBox").offset().left - $(this).offset().left) > 0){
            	$(this).remove();
            }
        	//超过bottomBox顶部  删除
            if(($("#bottomBox").offset().top - $(this).offset().top) > 0){
            	$(this).remove();
        	}
            //超过bottomBox右边框 删除
            if((($(this).offset().left+$(this).get(0).offsetWidth) - $("#bottomBox").innerWidth()) > 0){
            	$(this).remove();
            }
            //超过bottomBox下边框 删除
            if($(this).offset().top - ($("#bottomBox").get(0).offsetHeight+210) > 0){
            	$(this).remove();
            }
    	});
    });
    
}
//保存修改的页面
function savePage(obj){
	//将页面所有元素position属性高度减200px;
	$("*").each(function(index){
		//外面框架一定不要加title
		if($(this).hasClass("positionStyle")){
			$(this).css("top",$(this).offset().top-210);
			$(this).children(".boxTopDrage").remove();
		}
	});
	$("#nav_head").remove();
	$("#hiddenDom").remove();
	$(".openDrage").remove();
	$("#savePageButton").remove();
	$("#bottomBox").remove();
	$("#jqueryUrl").remove();
	$("#customJs").remove();
	$("table").remove();
	var head = document.getElementsByTagName('head')[0].innerHTML;
	var body = document.getElementsByTagName('body')[0].innerHTML;
	var dataVo = {head:head,body:body};
	$.ajax({
		type : 'post',
		url : '../pre/saveCustomHtmls',
		data : JSON.stringify(dataVo),
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		success : function(data) {
			if (data.success == "true") {
				$.messager.alert('提示',data.msg,"info");
			} else {
				$.messager.alert('提示',	data.msg);
			}
		}
	});
}

$.fn.extend({
		//---元素拖动插件
    dragging:function(data){ 
		var $this = $(this);
		if($($this).offset().top )
		var xPage;
		var yPage;
		var X;//
		var Y;//
		var xRand = 0;//
		var yRand = 0;//
		var father = $this.parent();
		var defaults = {
			move : 'both',
			randomPosition : true ,
			hander:1
		}
		var opt = $.extend({},defaults,data);
		var movePosition = opt.move;
		var random = opt.randomPosition;
		
		var hander = opt.hander;
		
		if(hander == 1){
			hander = $this; 
		}else{
			hander = $this.find(opt.hander);
		}
		
			
		//---初始化
		if($(this).attr("class") != "openDrage"){
			father.css({"position":"relative","overflow":"hidden"});
		}
		$this.css({"position":"absolute"});
		hander.css({"cursor":"move"});

		var faWidth = father.width();
		var faHeight = father.height();
		var thisWidth = $this.width()+parseInt($this.css('padding-left'))+parseInt($this.css('padding-right'));
		var thisHeight = $this.height()+parseInt($this.css('padding-top'))+parseInt($this.css('padding-bottom'));
		
		var mDown = false;//
		var positionX;
		var positionY;
		var moveX ;
		var moveY ;
		
		if(random){
			$thisRandom();
		}
		function $thisRandom(){ //随机函数
			$this.each(function(index){
				var randY = parseInt(Math.random()*(faHeight-thisHeight));///
				var randX = parseInt(Math.random()*(faWidth-thisWidth));///
				if(movePosition.toLowerCase() == 'x'){
					$(this).css({
						left:randX
					});
				}else if(movePosition.toLowerCase() == 'y'){
					$(this).css({
						top:randY
					});
				}else if(movePosition.toLowerCase() == 'both'){
					$(this).css({
						top:randY,
						left:randX
					});
				}
				
			});	
		}
		
		hander.mousedown(function(e){
			if($(this).attr("class") != "openDrage"){
				father.children().css({"zIndex":"0"});
				$this.css({"zIndex":"1"});
			}
			
			mDown = true;
			X = e.pageX;
			Y = e.pageY;
			positionX = $this.position().left;
			positionY = $this.position().top;
			return false;
		});
			
		$(document).mouseup(function(e){
			mDown = false;
		});
			
		$(document).mousemove(function(e){
			xPage = e.pageX;//--
			moveX = positionX+xPage-X;
			
			yPage = e.pageY;//--
			moveY = positionY+yPage-Y;
			
			function thisXMove(){ //x轴移动
				if(mDown == true){
					$this.css({"left":moveX});
				}else{
					return;
				}
				if(moveX < 0){
					$this.css({"left":"0"});
				}
				if(moveX > (faWidth-thisWidth)){
					$this.css({"left":faWidth-thisWidth});
				}
				return moveX;
			}
			
			function thisYMove(){ //y轴移动
				if(mDown == true){
					$this.css({"top":moveY});
				}else{
					return;
				}
				if(moveY < 0){
					$this.css({"top":"0"});
				}
				if(moveY > (faHeight-thisHeight)){
					$this.css({"top":faHeight-thisHeight});
				}
				return moveY;
			}

			function thisAllMove(){ //全部移动
				if(mDown == true){
					$this.css({"left":moveX,"top":moveY});
				}else{
					return;
				}
				if(moveX < 0){
					$this.css({"left":"0"});
				}
				if(moveX > (faWidth-thisWidth)){
					$this.css({"left":faWidth-thisWidth});
				}

				if(moveY < 0){
					$this.css({"top":"0"});
				}
				if(moveY > (faHeight-thisHeight)){
					$this.css({"top":faHeight-thisHeight});
				}
			}
			if(movePosition.toLowerCase() == "x"){
				thisXMove();
			}else if(movePosition.toLowerCase() == "y"){
				thisYMove();
			}else if(movePosition.toLowerCase() == 'both'){
				thisAllMove();
			}
		});
    }
}); 