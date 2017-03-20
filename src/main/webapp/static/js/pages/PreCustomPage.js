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
});
function activeBox(obj){

    $(".activeBox .activeBox_title").removeClass("activeBox_title");
    $(".activeBox").removeClass("activeBox");


    $(obj).mousedown(function(e) {
        var moveBox =  null;
        if(($("#rightBox").offset().left - $(obj).offset().left) > 0){
            moveBox = $(this).parent().clone();
            $("body").append(moveBox);
             var moveBox_title = $(moveBox).children("div").get(0);
            $(moveBox_title).addClass("activeBox_title");
            $(moveBox_title).parent().addClass("activeBox");
            boxTitle = $(obj).attr("title");
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
                var x = e.clientX, y = e.clientY, t = offset.top, l = offset.left, w = $(this).width(), h = $(this).height(), ww = $('.main_tabletop').height(), b = 10;
                if(x<(l+b) && y > (t+ww) && y < (t+h-b)){
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
                }else if(x<(l+w) && x>(l+w-b) &&  y > (t+ww) && y < (t+h-b)){
                    //右边
                    //alert('右边')
                    $(this).css({cursor: "e-resize"});
                    $(this).unbind("mousedown").bind({"mousedown":function(e){
                        var $p = $(this);
                        var posix = {
                                'w': $p.width(), 
                                'x': e.pageX
                            };
                        resizeBox($p, posix, e);
                    }});
                }else if(y<(t+h) && y>(t+h-b) && x>(l+b) && x<(l+w-b)){
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
                }else if(x<(l+b) && y>(t+h-b) && y<(t+h)){
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
                }else if(y<(t+h) && y>(t+h-b) && x<(l+w) && x>(l+w-b)){
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
                }else if(y<(t+ww) && x>l && x<(l+w)){
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
    	//不在rightBox中的bOx删除
        if(($("#rightBox").offset().left - $(this).offset().left) > 0){
        	$(this).parent().remove();
        }
    });
    
}
function savePage(obj){
	$("*").each(function(index){
		//外面框架一定不要加title
		if(($("#rightBox").offset().left - $(this).offset().left) > 0 && $(this).attr("title") != null){
			$(this).parent().remove();
		}
	});
	$("#leftBox").remove();
	$("#rightBox").remove();
	$(obj).remove();
	$("#jqueryUrl").remove();
	$("#customJs").remove();
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