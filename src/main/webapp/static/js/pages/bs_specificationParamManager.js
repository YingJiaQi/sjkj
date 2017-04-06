$(function(){
	$('#tree').tree({
        url:'../category/getTreeMenu',
        animate:true,
        dnd:true,
        onClick:function(node){
      	 /* //将选择的节点传送到右侧docList中
      	  getSelectedNodeData();
      	  
      	  //获取该节点所有父节点
  		  var parentAll = node.text;
  		  var flag = ">>";
  		  parentAll = flag.concat(parentAll);
	        	  var parent = $('#tree').tree('getParent', node.target);
	        	  if(parent != null  && parentOne != ''){
	        			parentAll = (parent.text).concat(parentAll);
	        		  	var parentOne = $('#tree').tree('getParent', parent.target);
	        		  	if(parentOne != null && parentOne != ''){
	        				parentAll = flag.concat(parentAll);
	        		  		parentAll = (parentOne.text).concat(parentAll);
	        				var parentTwo = $('#tree').tree('getParent', parentOne.target)
	        			 	if(parentTwo != null  && parentTwo != ''){
	        		 			parentAll = flag.concat(parentAll);
	        			 		parentAll = (parentTwo.text).concat(parentAll);
	        			 	}
	        		  	}
	        	  }
            $("#path").text(parentAll+"");
          //调用子页面的方法，实时更新路径
    		myFrame.window.updatePathImmediately(parentAll+"");
      	  
      	  var leaf = $('#tree').tree('isLeaf', node.target);
      	  var current = node.id;
      	  if(!leaf){
      		  //将该节点的大于等于第二层子节点的状态改为关闭
      		  var nodeName = node.text;
      		  if(nodeName == '根'){
      			  $('#tree').tree('collapseAll');
      		  }
      	  	$(this).tree('toggle', node.target);
      	  	$("#articalList").removeClass("commonNode").addClass("chooseNode");
      		$("#asscoiatList").removeClass("chooseNode").addClass("commonNode");
      		$("#associatedList").css("display","none");
      		$("#documentList").css("display","block");
      		 pre = current;
      		 return;
      	  }else{
      		  //用于控制重复点击叶子节点
      		  if(current != pre){
	        		  //用于控制对应关联库的显示
	        		  var dataVo = {id : node.id};
	          			 $.ajax({
	          					type : 'post',
	          					url : '${pageContext.request.contextPath}/document/toAssociatedListById',
	          					data : JSON.stringify(dataVo),
	          					dataType : 'json',
	          					contentType : "application/json; charset=utf-8",
	          					success : function(data) {
	        						if (data.flag) {
	        							$("#showAssociatedList").empty();
	        							if(data.docList != null && data.docList != ""){
	        								$("#showTip").css("display","none");
	        								$("#showAssociatedList").css("display","block");
		        							for(var i = 0; i< data.docList.length ;i++){
		        								docIds[i] = String(data.docList[i].id);
		        								var optionHtml = "<li title='"+data.docList[i].documentTitle+"' style='width:95px;height:149px;float:left;border:1px solid green;list-style-type:none;margin:5px 10px;padding:2px;overflow:hidden;font-size:10px;line-height:1.3;letter-spacing:2px;position:relative'><img src='"+hostIpAddress+"icon/"+data.docList[i].id+"/icon.png"+"' width='95px' height='90px'/><br/><div style='height:60px; overflow:auto;'>"+data.docList[i].documentTitle+"</div><a onclick='deleteAssociated("+i+");' href='javascript:void(0);' style='position:absolute;top:0px;left:0px;text-decoration:none'><b>删</b></a></li>"
		        								$("#showAssociatedList").append(optionHtml);
		        							}
	        							}else{
	        								$("#showTip").css("display","block");
	        								$("#showAssociatedList").empty();
	        							}
	        						} else {
	        							$.messager.alert('更新失败',data.msg,"error");
	        						}
	        					}
	          				});
	          			$("#asscoiatList").removeClass("commonNode").addClass("chooseNode");
	        			$("#articalList").removeClass("chooseNode").addClass("commonNode");
	        			$("#documentList").css("display","none");
	        			$("#associatedList").css("display","block");
      		  }
                pre = current;
      			  return;
      	  }*/
        },
        onDblClick:function(node){
      	  $(this).tree('beginEdit', node.target);
        },
        onAfterEdit:operationNode,
        onContextMenu: function(e, node){  
                      e.preventDefault();  
                      $('#parentLeafNode').menu('show', {  
                          left: e.pageX,  
                          top: e.pageY  
                      });
                  }  
      });
})
function operationNode(node){
	 if(node.text == "" || node.text == null){
		 $.messager.alert("警告","<p class='text-danger text-center'>节点名不能为空</p>","warn");
		 $('#tree').tree('reload');
		 return;
	 }
	 if(node.text.length > 20){
		 $.messager.alert("警告","<p class='text-danger text-center'>节点名不能大于20个字符</p>","warn");
		 $('#tree').tree('reload');
		 return;
	 }
	 var parentId = $('#tree').tree('getParent', node.target);
	 if(parentId == null){
		 parentIds = 0;
	 }else{
		 parentIds = parentId.id;
	 }
	 var dataVo = {
				text : node.text,
				id : node.id,
				parentId : parentIds,
				foldType : node.attributes
			};
			$.ajax({
				type : 'post',
				url : '../category/operateNodes',
				data : JSON.stringify(dataVo),
				dataType : 'json',
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					if (data.flag) {
						 $('#tree').tree('reload');
 							/* var rootNode1 = $("#tree").tree("getParent", node.target);
 							if(rootNode1){
 								alert(rootNode1)
 								var rootNode2 = $("#tree").tree("getParent", rootNode1.target);
 								if(rootNode2){
 									alert(rootNode2.id)
 	 									$("#tree").tree("expand", rootNode2.target);
 		 								$("#tree").tree("select", rootNode2.target); //定位当前节点
 	 								}else{
 	 								}
	 								$("#tree").tree("expand", rootNode1.target);
	 								$("#tree").tree("select", rootNode1.target); //定位当前节点
 							}else{
 							} */
 						/* 	var node1 = $('#tt').tree('find', data.id);  
 							while ($("#tree").tree("getParent", node1.target) != null && $("#tree").tree("getParent", node1.target) != "") {         
 								alert(node1.text)
 								$('#tree').tree('expand', node1.target);  
 								node1 = $("#tree").tree("getParent", node1.target);
 		     					}   */
 		     					$("#tree").tree('collapse',node.target);
						/*  var node = $('#tt').tree('find', data.id);  
						 $('#tree').tree('expand', node.target);  */ 
						 $("#path").text(""); 
						$("#articalList").removeClass("commonNode").addClass("chooseNode");
						$("#asscoiatList").removeClass("chooseNode").addClass("commonNode");
						$("#associatedList").css("display","none");
						$("#documentList").css("display","block");
						$.messager.alert("成功",data.msg,"info");
						
					} else {
							 //$('#tree').tree('reload');
							 $('#tree').tree('expand',node.target);  
							$.messager.alert('失败', data.msg,"error");
						}
					}
				});
 }
/**
 * 添加节点
 */
function addNode(){
	var node = $('#tree').tree('getSelected');
	$('#tree').tree('append',{
		parent: (node?node.target:null),
		data:
		[
		   {
			text:"newNode",//修改之后才会保存该节点
			attributes:"add",
			state: 'open',
			checked:true
			} 
		]
   });
}
function removeNoded(){
    var nodes = $('#tree').tree('getChecked');
    var ids = '';
    for(var i=0; i<nodes.length; i++){
           if (ids != '') ids += ',';
           ids += nodes[i].id;
            //$('#tree').tree('remove',nodes[i].target);
    }
    if(ids != null && ids != ""){
   	 
    var dataVo = {
			ids : ids
		};
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/category/removeNode',
			data : JSON.stringify(dataVo),
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				if (data.flag) {
					 $('#tree').tree('reload');
					$.messager.alert("删除成功",data.msg,"info");
					} else {
						$.messager.alert('删除失败', data.msg,"error");
					}
				}
			});
    }else{
   	 $.messager.alert("警告","请点选叶子结点前的复选框，可以选择多个","warn");
    }
}
