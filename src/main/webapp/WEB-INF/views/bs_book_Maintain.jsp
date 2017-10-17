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
<!--------------------------------- 引入js start-------------------------------------->
<!--[if !IE]> -->
<script src="../static/assets/js/bootstrap.min.js"></script>
<script src="../static/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="../static/assets/js/jqGrid/i18n/grid.locale-en.js"></script>
<!--------------------------------- 引入js end-------------------------------------->
<script type="text/javascript">
	jQuery(function($) {
		var grid_selector = "#grid-table";
		var pager_selector = "#grid-pager";
		var wh = $(window).height();
		wh = wh-186;
		jQuery(grid_selector).jqGrid({
			//direction: "rtl",
			
			//data: grid_data,
			url:'../back/bookMaintain/getBookList',
			datatype: "json",
			height: wh,
			mtype: 'POST',
			colNames:['操作', '','书名','作者','所属类目', '得分', '阅读次数','点赞次数','反对次数','收藏次数','购买次数','书籍大小','所需积分','图片封面','是否完结','是否共享','创建日期'],
			colModel:[
				{name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
					formatter:'actions', 
					formatoptions:{ 
						keys:true,
						
						delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
						//editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
					}
				},
				{name:'id',index:'id', hidden:true},
				{name:'bookName',index:'bookName', width:120, editable:true},
				{name:'bookAuthor',index:'bookAuthor',width:80, editable:true,editoptions:{size:"20",maxlength:"50"}},
				{name:'belongCategory',index:'belongCategory', width:50, editable: true,edittype:"select",editoptions:{value:"1:已完结;0:待完结"}},
				{name:'sore',index:'sore', width:30, editable: true},
				{name:'readTimes',index:'readTimes', width:30, editable: true, sorttype:"int"},
				{name:'agreeTimes',index:'agreeTimes',width:30, editable:true, sorttype:"int"},
				{name:'againstTimes',index:'againstTimes',width:30, editable:true, sorttype:"int"},
				{name:'collectTimes',index:'collectTimes',width:30, editable:true, sorttype:"int"},
				{name:'buyTimes',index:'buyTimes', width:30, editable:true,sorttype:"int"},
				{name:'bookSizes',index:'bookSizes', width:30, editable:false},
				{name:'price',index:'price', width:30, editable:true,sorttype:"int"},
				{name:'picUrl',index:'picUrl',formatter:showPicture, width:40, editable:true, edittype:'file',editoptions:{enctype:"multipart/form-data"}},
				{name:'isDone',index:'isDone', width:30, editable:true,edittype:"select",editoptions:{value:"1:已完结;0:待完结"}},
				{name:'isShare',index:'isShare', width:30, editable:true,edittype:"checkbox",editoptions: {value:"Yes:No"},unformat: aceSwitch,formatter:reverseActive},
				{name:'createTime',index:'createTime', width:100, editable:false, sorttype:"date"},
			], 
	
			viewrecords : true,
			rowNum:10,
			rowList:[10,20,30],
			pager : pager_selector,
			altRows: true,
			//toppager: true,
			
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
			/*caption: "jqGrid with inline editing",*/
			autowidth: true
	
		});
	
		//switch element when editing inline
		function aceSwitch( cellvalue, options, cell ) {
			setTimeout(function(){
				$(cell).find('input[type=checkbox]').wrap('<label class="inline" />').addClass('ace ace-switch ace-switch-5')
					.after('<span class="lbl"></span>');
				}, 0);
		}
		//enable datepicker
		function pickDate( cellvalue, options, cell ) {
			setTimeout(function(){
				$(cell) .find('input[type=text]')
						.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
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
		function getBookCategoryList(){
			$.ajax({
				url: "../data/dic/getMapByDocCode",
				success: function(data) {
					return data;
				}
			})
		}
		//显示书籍封面
		function showPicture(cellvalue, options, rowObject){
			 return "<div><img src='" +cellvalue  + "' height='50' width='50' /><div style='position:absolute;font-size:1.5'>上传</div></div>";
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
	
		//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
	
	
	});
</script>