<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
		<div class="ace-settings-container" id="ace-settings-container">
			<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
				<i class="icon-cog bigger-150"></i>
			</div>

			<div class="ace-settings-box" id="ace-settings-box">
				<div>
					<div class="pull-left">
						<select id="skin-colorpicker" class="hide">
							<option data-skin="default" value="#438EB9">#438EB9</option>
							<option data-skin="skin-1" value="#222A2D">#222A2D</option>
							<option data-skin="skin-2" value="#C6487E">#C6487E</option>
							<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
						</select>
					</div>
					<span>&nbsp; 选择皮肤</span>
				</div>

				<div>
					<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
					<label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
				</div>

				<div>
					<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
					<label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
				</div>

				<div>
					<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
					<label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
				</div>

				<div>
					<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
					<label class="lbl" for="ace-settings-rtl">切换到左边</label>
				</div>

				<div>
					<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
					<label class="lbl" for="ace-settings-add-container">
						切换窄屏
						<b></b>
					</label>
				</div>
			</div>
		</div><!-- /#ace-settings-container -->
	</div><!-- /.main-container-inner -->

	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
		<i class="icon-double-angle-up icon-only bigger-110"></i>
	</a>
</div><!-- /.main-container -->
<!------------------------------------------------------ 内容结束 ---------------------------------------------------------->
	<!-- basic scripts -->

	<!--[if !IE]> -->
		<script src="../static/assets\js\jquery-2.0.3.min.js"></script>
	<!-- <![endif]-->

	<!--[if IE]>
		<script src="../static/assets\js\jquery-1.10.2.min.js"></script>
	<![endif]-->

	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery || document.write("<script src='../static/assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
	</script>
	<!-- <![endif]-->

	<!--[if IE]>
		<script type="text/javascript">
			window.jQuery || document.write("<script src='../static/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
		</script>
	<![endif]-->

	<script type="text/javascript">
		if("ontouchend" in document) document.write("<script src='../static/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
	</script>
	<script src="../static/assets/js/bootstrap.min.js"></script>
	<script src="../static/assets/js/typeahead-bs2.min.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
	  <script src="../static/assets/js/excanvas.min.js"></script>
	<![endif]-->
	<!-- ace scripts -->

	<script src="../static/assets/js/ace-elements.min.js"></script>
	<script src="../static/assets/js/ace.min.js"></script>

	<script type="text/javascript">
		jQuery(function($) {
			//动态加载菜单
			$.ajax({
				type: 'post',
				url: "../user/getMenu",
				success: function(data) {
					if(data != null || data != "") {
						//先找到父结点
						for(var i=0;i<data.length;i++){
							var parhtml = "";
							if(data[i].pid ==0){
								if(data[i].page == undefined) {
									//此时是有子节点的父节点
									parhtml += '<li> <a href="javascript:void(0);" class="dropdown-toggle"><i class="'+data[i].icon+'"></i>';
									parhtml += '<span class="menu-text"> '+data[i].menuName+' </span><b class="arrow icon-angle-down"></b></a>';
									parhtml += '<ul class="submenu" id="par_' + data[i].id + '" >';
									parhtml += '</ul></li>';
								}else{
									//此时是没有子节点的父节点
									parhtml += '<li id="par_' + data[i].id + '" onclick="openTabs(this)" pageUrl="'+data[i].page+'" ifPar="1"> <a href="javascript:void(0);"> <i class="'+data[i].icon+'"></i>';
									parhtml += '<span class="menu-text"> '+data[i].menuName+' </span></a></li>';
								}
								$("#menu_list").append(parhtml);
							}
						}
						//追加子节点到父节点
						for(var i=0;i<data.length;i++){
							var childhtml = "";
							if(data[i].pid !=0){
								childhtml += '<li onclick="openTabs(this)"  pageUrl="'+data[i].page+'"  ifPar="0"> <a href="javascript:void(0);"> <i class="icon-double-angle-right"></i>';
								childhtml += data[i].menuName+'</a></li>';
								//子节点追加
								$("#par_" + data[i].pid).append(childhtml);
							}
						}
					} else {
						alert("失败")
					}
				}
			});				
		})
		function openTabs(obj){
				/* $("li").remove("active");
				$("li").remove("open");
				//ifPar为0时是有父节点的子节点，ifPar为1时,是没有子节点的父节点
				if($(obj).attr("ifPar") ==0){
					$(obj).parent().parent().addClass("active");
					$(obj).parent().parent().addClass("open");
					$(obj).addClass("active");
				}else{
					$(obj).addClass("active");
				} */
				$(".main-content").html("");//清空右侧内容
				if($(obj).attr("pageUrl") == "bs_index"){
					window.location.href="bs_index";
				}else{
					$(".main-content").load($(obj).attr("pageUrl"),function(){
						//alert(1)
					});//右侧重新加载内容
				}
			}
	</script>
</body>
</html>