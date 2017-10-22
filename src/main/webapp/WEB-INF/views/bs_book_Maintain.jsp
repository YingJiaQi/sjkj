<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!--------------------------------- top	start ------------------------------------------------------------------------------------>
	<!-- <div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
		</script>
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon"></i><a href="#">首页</a>
			</li>
			<li class="active">书籍管理</li>
		</ul>
	</div> -->
<!--------------------------------- top	end ------------------------------------------------------------------------------------>
	<div class="page-content">
		<div class="page-header">
			<h1>
			内容管理
			<small>
				<i class="icon-double-angle-right"></i>
				书籍管理
			</small>
		</h1>
		</div><!-- /.page-header -->

		<!--------------------------------- body start------------------------------------>
		<div class="row">
			<div class="col-xs-12">
				<table id="grid-table"></table>
				<div id="grid-pager"></div>
				<script type="text/javascript">
					var $path_base = "/";//this will be used in gritter alerts containing images
				</script>
			</div>
		<!--------------------------------- body end-------------------------------------->
		</div><!-- /.row -->
	</div><!-- /.page-content -->
	<!-- 模态框 添加分类下的连接地址（Modal） -->
		<div class="modal fade" id="fileUpload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		            </div>
		            <div class="modal-body">
		            	<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<div class="alert alert-info">
									<i class="icon-hand-right"></i>

									文件上传
									<button class="close" data-dismiss="alert">
										<i class="icon-remove"></i>
									</button>
								</div>

								<div id="dropzone">
									<form id="fileForm" action="../file/upload" class="dropzone">
										<div class="fallback">
											<input name="file" type="file" multiple="" />
										</div>
									</form>
								</div><!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
		            </div>
		           <!--  <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="button" class="btn btn-default" onclick="uploadFile();">保存</button>
		            </div> -->
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
<!--------------------------------- 引入js start-------------------------------------->
<!--------------------------------- 引入js start-------------------------------------->
<script src="../static/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="../static/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="../static/assets/js/jqGrid/i18n/grid.locale-en.js"></script>
<script src="../static/assets/js/dropzone.min.js"></script>
<!--------------------------------- 引入js end-------------------------------------->
<script type="text/javascript">
	var fileId="1";
	var fileType="2";
	$(function($) {
		//文件上传
		try {
			$(".dropzone").dropzone({
			    paramName: "file", // The name that will be used to transfer the file
			    maxFilesize: 10, // MB
				addRemoveLinks : true,
				 init: function () {
					 this.on("sending", function(file, xhr, data) {
	                        data.append("fileType", fileType);
	                        data.append("fileId", fileId);//上传文件时的额外参数
	                    });
					 this.on("success", function(file,imageInfo) {
						 $("#grid-table").trigger("reloadGrid");//成功后刷新数据
                       });
				 },
				dictDefaultMessage :
				'<span class="bigger-150 bolder"><i class="icon-caret-right red"></i> Drop files</span> to upload '+
				'<span class="smaller-80 grey">(or click)</span> <br /> '+
				'<i class="upload-icon icon-cloud-upload blue icon-3x"></i>',
				dictResponseError: 'Error while uploading file!',
				//change the previewTemplate to use Bootstrap progress bars
				previewTemplate: "<div class=\"dz-preview dz-file-preview\">\n  <div class=\"dz-details\">\n    <div class=\"dz-filename\"><span data-dz-name></span></div>\n    <div class=\"dz-size\" data-dz-size></div>\n    <img data-dz-thumbnail />\n  </div>\n  <div class=\"progress progress-small progress-striped active\"><div class=\"progress-bar progress-bar-success\" data-dz-uploadprogress></div></div>\n  <div class=\"dz-success-mark\"><span></span></div>\n  <div class=\"dz-error-mark\"><span></span></div>\n  <div class=\"dz-error-message\"><span data-dz-errormessage></span></div>\n</div>"
			  });
		} catch(e) {
			 alert('Dropzone.js does not support older browsers!');
		}
			
		
		
		var grid_selector = "#grid-table";
		var pager_selector = "#grid-pager";
		var wh = $(window).height();
		wh = wh-220;
		jQuery(grid_selector).jqGrid({
			//direction: "rtl",
			
			//data: grid_data,
			url:'../back/bookMaintain/getBookList',
			datatype: "json",
			height: wh,
			mtype: 'POST',
			colNames:['操作', '','书名','作者','所属类目', '得分', '阅读次数','点赞次数','反对次数','收藏次数','购买次数','书籍大小','所需积分','图片封面','书籍地址','是否完结','是否共享','创建日期'],
			colModel:[
				{name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
					formatter:'actions', 
					formatoptions:{ 
						keys:true,
						delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
					}
				},
				{name:'id',index:'id', hidden:true},
				{name:'bookName',index:'bookName', width:90, editable:true},
				{name:'bookAuthor',index:'bookAuthor',width:60, editable:true,editoptions:{size:"20",maxlength:"50"}},
				{name:'belongCategory',index:'belongCategory', width:50, editable: true,edittype: 'select', editoptions: { dataUrl: '../data/dic/getMapByDocCode'}},
				{name:'sore',index:'sore', width:30, editable: true},
				{name:'readTimes',index:'readTimes', width:30, editable: true, sorttype:"int"},
				{name:'agreeTimes',index:'agreeTimes',width:30, editable:true, sorttype:"int"},
				{name:'againstTimes',index:'againstTimes',width:30, editable:true, sorttype:"int"},
				{name:'collectTimes',index:'collectTimes',width:30, editable:true, sorttype:"int"},
				{name:'buyTimes',index:'buyTimes', width:30, editable:true,sorttype:"int"},
				{name:'bookSizes',index:'bookSizes', width:30, editable:false},
				{name:'price',index:'price', width:30, editable:true,sorttype:"int"},
				{name:'picUrl',index:'picUrl',formatter:showPicture, width:80, editable:false},
				{name:'bookUrl',index:'bookUrl',width:80, editable:false,formatter:showFile},
				{name:'isDone',index:'isDone', width:30, editable:true,edittype:"select",editoptions:{value:"1:已完结;0:待完结"}},
				{name:'isShare',index:'isShare', width:30, editable:true,edittype:"checkbox",editoptions: {value:"Yes:No"},unformat: aceSwitch,formatter:reverseActive},
				{name:'createTime',index:'createTime', width:100, editable:false, sorttype:"date"},
				], 
			viewrecords : true,
			rowNum:10,
			rowList:[10,20,30],
			pager : pager_selector,
			altRows: true,
			multiselect: true,
			//multikey: "ctrlKey",
	        multiboxonly: true,
	
			loadComplete : function() {
				var table = this;
				setTimeout(function(){
					styleCheckbox(table);
					
					updateActionIcons(table);
					updatePagerIcons(table);
					enableTooltips(table);
				}, 0);
			},
			editurl: "../back/bookMaintain/operateBook",//nothing is saved
			autowidth: true
			
		});
		//显示书籍封面
		function showPicture(cellvalue, options, rowObject){
			 return "<a href='javascript:void(0)' id='"+rowObject.id+"' style='color:#f60' onclick='ImgUpload(this)' >Edit</a>&nbsp;&nbsp;<img src='" +cellvalue  + "' height='50' width='50' />";
		}
		//显示书籍信息
		function showFile(cellvalue, options, rowObject){
			if(cellvalue != undefined){
				return  "<a href='javascript:void(0)' id='"+rowObject.id+"' style='color:#f60' onclick='BookUpload(this)' >Edit</a>&nbsp;&nbsp;"+cellvalue;
			}else{
				return "&nbsp;&nbsp;<a href='javascript:void(0)' id='"+rowObject.id+"' style='color:#f60' onclick='BookUpload(this)' >Edit</a>";
			}
		}
		//switch element when editing inline
		function aceSwitch( cellvalue, options, cell ) {
			setTimeout(function(){
				$(cell) .find('input[type=checkbox]')
						.wrap('<label class="inline" />')
					.addClass('ace ace-switch ace-switch-5')
					.after('<span class="lbl"></span>');
			}, 0);
		}
		function sexSwitch(cellvalue, options, cell){
			setTimeout(function(){
				$(cell) .find('input[type=checkbox]')
						.wrap('<label class="inline" />')
					.addClass('ace ace-switch ace-switch-5')
					.after('<span class="lbl">12</span>');
			}, 0);
		}
		//enable datepicker
		function pickDate( cellvalue, options, cell ) {
			setTimeout(function(){
				$(cell) .find('input[type=text]')
						.datepicker({format:'yyyy-mm-dd ' , autoclose:true}); 
			}, 0);
		}
		function reverseGender(cellvalue, options, cell){
			if(cellvalue == 0){
				return "女";
			}else{
				return "男";
			}
		}
		function reverseActive(cellvalue, options, cell){
			if(cellvalue == 0){
				return "NO";
			}else{
				return "YES";
			}
		}
		//navButtons
		jQuery(grid_selector).jqGrid('navGrid',pager_selector,
			{ 	//navbar options
				edit: true,
				editicon : 'icon-pencil blue',
				add: true,
				addicon : 'icon-plus-sign purple',
				del: true,
				delicon : 'icon-trash red',
				search: true,
				searchicon : 'icon-search orange',
				refresh: true,
				refreshicon : 'icon-refresh green',
				view: true,
				viewicon : 'icon-zoom-in grey',
			},
			{
				//edit record form
				//closeAfterEdit: true,
				recreateForm: true,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			},
			{
				//new record form
				closeAfterAdd: true,
				recreateForm: true,
				viewPagerButtons: false,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			},
			{
				//delete record form
				recreateForm: true,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				},
				onClick : function(e) {
					alert(1);
				}
			},
			{
				//search form
				recreateForm: true,
				afterShowSearch: function(e){
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
					style_search_form(form);
				},
				afterRedraw: function(){
					style_search_filters($(this));
				}
				,
				multipleSearch: true,
				/**
				multipleGroup:true,
				showQuery: true
				*/
			},
			{
				//view record form
				recreateForm: true,
				beforeShowForm: function(e){
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
				}
			}
		)
	
	
		
		function style_edit_form(form) {
			//enable datepicker on "sdate" field and switches for "stock" field
			form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
				.end().find('input[name=stock]')
					  .addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
	
			//update buttons classes
			var buttons = form.next().find('.EditButton .fm-button');
			buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
			buttons.eq(0).addClass('btn-primary').prepend('<i class="icon-ok"></i>');
			buttons.eq(1).prepend('<i class="icon-remove"></i>')
			
			buttons = form.next().find('.navButton a');
			buttons.find('.ui-icon').remove();
			buttons.eq(0).append('<i class="icon-chevron-left"></i>');
			buttons.eq(1).append('<i class="icon-chevron-right"></i>');		
		}
	
		function style_delete_form(form) {
			var buttons = form.next().find('.EditButton .fm-button');
			buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
			buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
			buttons.eq(1).prepend('<i class="icon-remove"></i>')
		}
		
		function style_search_filters(form) {
			form.find('.delete-rule').val('X');
			form.find('.add-rule').addClass('btn btn-xs btn-primary');
			form.find('.add-group').addClass('btn btn-xs btn-success');
			form.find('.delete-group').addClass('btn btn-xs btn-danger');
		}
		function style_search_form(form) {
			var dialog = form.closest('.ui-jqdialog');
			var buttons = dialog.find('.EditTable')
			buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'icon-retweet');
			buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'icon-comment-alt');
			buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'icon-search');
		}
		
		function beforeDeleteCallback(e) {
			var form = $(e[0]);
			if(form.data('styled')) return false;
			
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
			style_delete_form(form);
			
			form.data('styled', true);
		}
		
		function beforeEditCallback(e) {
			var form = $(e[0]);
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
			style_edit_form(form);
		}
	
	
	
		//it causes some flicker when reloading or navigating grid
		//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
		//or go back to default browser checkbox styles for the grid
		function styleCheckbox(table) {
		/**
			$(table).find('input:checkbox').addClass('ace')
			.wrap('<label />')
			.after('<span class="lbl align-top" />')
	
	
			$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
			.find('input.cbox[type=checkbox]').addClass('ace')
			.wrap('<label />').after('<span class="lbl align-top" />');
		*/
		}
		
	
		//unlike navButtons icons, action icons in rows seem to be hard-coded
		//you can change them like this in here if you want
		function updateActionIcons(table) {
			/**
			var replacement = 
			{
				'ui-icon-pencil' : 'icon-pencil blue',
				'ui-icon-trash' : 'icon-trash red',
				'ui-icon-disk' : 'icon-ok green',
				'ui-icon-cancel' : 'icon-remove red'
			};
			$(table).find('.ui-pg-div span.ui-icon').each(function(){
				var icon = $(this);
				var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
				if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
			})
			*/
		}
		
		//replace icons with FontAwesome icons like above
		function updatePagerIcons(table) {
			var replacement = 
			{
				'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
				'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
				'ui-icon-seek-next' : 'icon-angle-right bigger-140',
				'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
			};
			$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
				var icon = $(this);
				var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
				
				if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
			})
		}
	
		function enableTooltips(table) {
			$('.navtable .ui-pg-button').tooltip({container:'body'});
			$(table).find('.ui-pg-div').tooltip({container:'body'});
		}
	});
	function ImgUpload(obj) {
		$("#fileUpload").modal("show");
		fileId = $(obj).attr("id");
		fileType="pic";
	}
	function BookUpload(obj){
		$("#fileUpload").modal("show");
		fileId = $(obj).attr("id");
		fileType="book";
	}
</script>

<!--------------------------------- content	end ------------------------------------------------------------------------------------>
