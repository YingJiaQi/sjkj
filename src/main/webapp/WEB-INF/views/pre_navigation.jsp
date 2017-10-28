<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.* " %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta content="" name="description">
        <meta content="" name="keywords">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="HandheldFriendly" content="true">
        <meta content="telephone=no" name="format-detection">
        <!-- favicon -->
        <link rel="shortcut icon" type="image/png" href="favicon.png" />
        <!--[if (gt IE 9)|!(IE)]><!-->
        <!-- custom CSS -->
        <link href="${pageContext.request.contextPath }/static/css/Pre/main.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath }/static/css/Pre/navigation.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/font-awesome.min.css">
        <!-- END custom CSS -->
        <!--<![endif]-->
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>杰讯信息</title>
    </head>
    <body>
        <!-- Header -->
        <header id="header" class="header">
            <div class="header__top" style="background-color:white">
                <div class="container" >
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="wrap-logo" >
                                <a href="index.jsp" class="logo"><img class="img-responsive" alt="" src="${pageContext.request.contextPath }/static/images/Pre/common/logo.jpg"> </a>
                            </div>
                        </div>
                        <div class="col-sm-5">
                        	<!-- 音乐 -->
                        </div>
                         <div class="col-sm-2">
                        	<!-- <iframe name="weather_inc"  onmouseover="showAllWeather();" src="http://i.tianqi.com/index.php?c=code&id=7" height="86" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe> -->
                        </div>
                        <div class=" col-sm-3  hidden-xs" style="padding-top:1%;">
								<shiro:guest>  
                                	<a href="${pageContext.request.contextPath }/pre/user/pre_login" style="margin:6% 1% 8% 9%;padding:3% 10%;background-color:#eeeeee;border:none;color:black" class="btn btn-info">登录</a>
								</shiro:guest>
								<shiro:user>
									<a href="${pageContext.request.contextPath }/pre/user/pre_userCenter" target="_self"><img class="img-thumbnail img-responsive"  style="margin-bottom:3%" alt="" src="${pageContext.request.contextPath }/static/images/Pre/common/defaultPic.jpg" width="70px" height="70px"> </a> 
								    欢迎,<a href="${pageContext.request.contextPath }/pre/user/pre_userCenter" target="_self" style="color:#7BC3FF"><b><shiro:principal property="userName"/></b></a> , <a href="${pageContext.request.contextPath}/pre/loginOut" onclick="loginOut();"  style="color:#7BC3FF">退出</a>  
	                               	<%-- <a href="${pageContext.request.contextPath }/pre/PreCustomPage" class="btn-link"  target="_blank" >自定义页面</a> --%>
								</shiro:user>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wsmenucontent overlapblackbg"></div>
            <div class="wsmenuexpandermain slideRight">
                <a id="navToggle" class="animated-arrow slideLeft">
                    <span></span>
                </a>
            </div>
            <div class="header_down">
                <div class="container">
                    <div class="wrapper clearfix bigmegamenu">
                        <!--Main Menu HTML Code-->
                        <nav class="wsmenu slideLeft clearfix">
                            <ul class="mobile-sub wsmenu-list">
                                <li>
                                    <a href="${pageContext.request.contextPath }">主页</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_note">记录</a>
                                </li>
                                <li  class="active">
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_navigation"><b>导航</b></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_stackRoom">书库</a>
                                </li>
                                <li>
                                    <div class="visible-xs col-sm-offset-5 col-sm-4">
                                        <div class="col-sm-5">
                                            <shiro:guest> 
                                            	<a href="${pageContext.request.contextPath }/pre/user/pre_login" style="margin:3% 5%;padding:3% 10%;background-color:#eeeeee;border:1px solid #eeeeee;border-radius:0.5em;color:black" class="btn btn-info">登录</a> 
											</shiro:guest>
											<shiro:user>
												<a href="${pageContext.request.contextPath }/pre/user/pre_userCenter" target="_self"><img class="img-thumbnail img-responsive" style="margin-bottom:3%" alt="" src="${pageContext.request.contextPath }/static/images/Pre/common/defaultPic.jpg" width="70px" height="70px"> </a> 
											    欢迎,<a href="${pageContext.request.contextPath }/pre/user/pre_userCenter" target="_self"><b><shiro:principal property="userName"/></b></a> , <a href="${pageContext.request.contextPath}/pre/loginOut" onclick="loginOut();">退出</a>  
				                               	<%-- <a href="${pageContext.request.contextPath }/pre/PreCustomPage" class="btn-link"  target="_blank" >自定义页面</a> --%>
											</shiro:user>
                                        </div>
                                    </div>
                                </li>
                                <li class="navbar-right">
                                    <form action="http://www.baidu.com/baidu" target="_blank" class="navbar-form mob_search" role="search">
                                        <input name=tn type=hidden value=baidu>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name=word placeholder="请输入关键字">
                                        </div>
                                        <button type="submit" class="btn btn-search" style="margin-top:4em;margin-right:3.5em">
                                            <img src="http://img.baidu.com/search/img/baidulogo_clarity_80_29.gif" alt="Baidu"  border="0">
                                        </button>
                                    </form>
                                    <!-- 百度搜索框提示 -->  
			        				<script charset="gbk" src="http://www.baidu.com/js/opensug.js"></script>
                                </li>
                                
                            </ul>
                        </nav>
                        <!--Menu HTML Code-->
                    </div>
                </div>
            </div>
        </header>
        <!-- END header -->
   <!-------------------------------------------------------- CONTENT --------------------------------------------------------->
        <!-- content top -->
        <div class="container" id="contentEntity">
			<div class="row">
			<shiro:user> 
				<div class="col-md-2 col-sm-3 col-xs-4" id="navCategoryBox">
					<!--头部导航开始-->
					<ul class="nav nav-stacked" id="navCategoryList">
						<!-- <li><a class="navClassify">常用链接</a></li> -->
						<li>
							<div style="border:2px solid grey;background-color: #303D4A;padding: 2px;text-align: center;">
								<!--左右箭头开始-->
								<div class="prev " id="categoryPrev"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/arr_left.png" class="img-responsive" height="6px" width="10px"></div>
								<div class="next " id="categoryNext"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/arr_right.png" class="img-responsive" height="6px" width="10px"></div>
								<!--左右箭头结束-->
								<span  class="btn customBtn" data-toggle="modal" data-target="#addUrlCategory" onmouseover="customBtnStyle(this);" onmouseout="customOut(this)">添加</span>
								<!-- <a href="#" id="id-btn-dialog2" class="btn btn-info btn-sm customBtn">添加</a> -->
								<span  class="btn customBtn" data-toggle="modal" data-target="#updateUrlCategory" onmouseover="customBtnStyle(this);"  onmouseout="customOut(this)">修改</span>
								<!-- 按钮触发模态框 -->
								<!-- 模态框 添加（Modal） -->
								<div class="modal fade" id="addUrlCategory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								    <div class="modal-dialog">
								        <div class="modal-content">
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								                <h2 class="modal-title" id="myModalLabel">添加收藏分类</h2>
								            </div>
								            <div class="modal-body">
								            	<div class="container">
								            		<div class="row">
								            			<div class="col-xs-3 col-sm-3 col-md-3">
								            				<label for="cateName" class="control-label"><small>分类名</small></label>
								            			</div>
								            			<div class="col-xs-8 col-sm-8 col-md-8">
								            				<input type="text" class="form-control" id="cateName" placeholder="请输入收藏分类名">
								            			</div>
								            		</div>
								            		<br>
								            		<div class="row">
								            			<div class="col-xs-3 col-sm-3 col-md-3">
								            				<label for="orderList" class="control-label"><small>序列</small></label>
								            			</div>
								            			<div class="col-xs-8 col-sm-8 col-md-8">
								            				<input type="text" class="form-control" id="orderList" placeholder="请输入显示顺序号，如1">
								            				<span id="order_tip"></span>
								            			</div>
								            		</div>
								            	</div>
								            </div>
								            <div class="modal-footer">
								                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								                <button type="button" class="btn btn-primary" onclick="addCategory();">保存</button>
								            </div>
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal -->
								</div>
								<!-- 模态框 更新（Modal） -->
								<div class="modal fade" id="updateUrlCategory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								    <div class="modal-dialog">
								        <div class="modal-content">
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								                <h4 class="modal-title" id="myModalLabel">更新收藏分类</h4>
								            </div>
								            <div class="modal-body">
								            	<div class="container">
								            		<div class="row">
								            			<div class="col-xs-6 col-sm-6 col-md-6" id="updateCategoryLeft">
								            			
								            			</div>
								            			<div class="col-xs-6 col-sm-6 col-md-6" id="updateCategoryRight">
								            			
								            			</div>
								            		</div>
								            	</div>
								            </div>
								            <div class="modal-footer">
								                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								                <button type="button" class="btn btn-primary" onclick="updateCategory(1);">更新</button>
								                <button type="button" class="btn btn-primary" onclick="updateCategory(2);">删除</button>
								            </div>
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal -->
								</div>
							</div>
						</li>	
					</ul>
					<!--头部导航结束-->
				</div>
			</shiro:user>
				<div class="col-md-10 col-sm-9 col-xs-8">
					<!--logo区开始-->
					<div id="metro_box" class="a_link">
						<dl id="detailUrlList">
						</dl>
			
					</div>
					<!--logo区结束-->
					<!--收藏网址 大显示屏 左右箭头开始-->
					<%-- <div class="saveUrlStyleBottom visible-xs">
						<div class="prev"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/green_left.png"  class="img-responsive" height="15px" width="20px"></div>
						<div class="next"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/green_right.png"  class="img-responsive"  height="15px" width="20px"></div>
					</div> --%>
					<!--收藏网址 大显示屏 左右箭头 结束-->
				</div>
			</div>
		</div>
		<!--收藏网址左右箭头开始-->
		<div class="saveUrlStyle hidden-xs">
			<%-- <div class="prev"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/green_left.png"  class="img-responsive"></div><br>
			<div style="visibility:hidden;height:2%;overflow:hidden">这是个隐藏的内容</div>
			<div class="next"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/green_right.png"  class="img-responsive"></div> --%>
		</div>
		<br>
		<!--收藏网址左右箭头结束-->
        <!-- content end -->
         <!-- Footer -->
        <!--<footer class="footer slate_gray">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <p class="text-center" style="color: white;">Copyright &copy; 2017.佳奇网络</p>
                    </div>
                    <div class="col-sm-6">
                        <div class="social navbar-right">
                            <p class="social__text">We are in social networks</p>
                            <ul class="social__list">
                                <li class="social__item">
                                    <a class="facebook" href="#">
                                        <i class="icon-facebook"></i>
                                    </a>
                                </li>
                                <li class="social__item">
                                    <a class="twitter" href="#">
                                        <i class="icon-twitter"></i>
                                    </a>
                                </li>
                                <li class="social__item">
                                    <a class="gplus" href="#">
                                        <i class="icon-gplus"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer> -->
		<!-- 页面弹出提示框（Modal） -->
		<div class="modal fade" id="showTipFrame" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <br>
		                <!-- <h4 class="modal-title" id="showTipTitle"></h4> -->
		            </div>
		            <div class="modal-body">
		            	<div class="container">
		            		<div class="row">
		            			<div class="col-xs-12 col-sm-12 col-md-12" id="showTipContent" style="text-align:center">
		            			
		            			</div>
		            		</div>
		            	</div>
		            </div>
		           <!--  <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		            </div> -->
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
		<!-- 模态框 添加分类下的连接地址（Modal） -->
		<div class="modal fade" id="addUrlLink" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h2 class="modal-title" id="myModalLabel">添加链接</h2>
		            </div>
		            <div class="modal-body">
		            	<div class="container">
		            		<form id="saveBrandForm" enctype="multipart/form-data" method="post">
		            		<input type="hidden" name="isUpdate" value="0"/>
		            		<div class="row">
		            			<div class="col-xs-3 col-sm-3 col-md-3">
		            				<label for="linkAddr" class="control-label"><small>链接地址</small></label>
		            			</div>
		            			<div class="col-xs-8 col-sm-8 col-md-8">
		            				<input type="text" class="form-control" name="brandUrl" onblur="dynFindBrand(this);" id="linkAddr" placeholder="请输入链接地址">
		            			</div>
		            		</div>
		            		<br>
		            		<div class="row">
		            			<div class="col-xs-3 col-sm-3 col-md-3">
		            				<label for="linkName" class="control-label"><small>链接名</small></label>
		            			</div>
		            			<div class="col-xs-8 col-sm-8 col-md-8">
		            				<input type="text" class="form-control" name="brandName" id="linkName" placeholder="请输入链接名">
		            			</div>
		            		</div>
		            		<br>
		            		<div class="row">
		            			<div class="col-xs-1 col-sm-1 col-md-1 ">
		            			
		            			</div>
		            			<div class="col-xs-5 col-sm-5 col-md-5 linkThumbnail" >
		            			
		            			</div>
		            			<div class="col-xs-6 col-sm-6 col-md-6">
		            				<p>自定义图标</p>
									 <input id="uploadImg" type="file" class="form-control" onchange="fileChange(this);" name="file">
									 <p style="font-size:10px;margin-top:6px">图片尺寸242*122,图片大小50kb之内</p>
		            			</div>
		            		</div>
		            		</form>
		            	</div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="button" class="btn btn-primary" onclick="saveBrand();">保存</button>
		            </div>
		            <h2>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-danger"  onclick="delBrand();">删除--修改</button></h2>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
        <!-- 模态框 连接地址选择框（Modal） -->
		<div class="modal fade"  id="chooseLinkBrand" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h2 class="modal-title" id="myModalLabel">推荐使用图标 可自定义上传</h2>
		            </div>
		            <div class="modal-body" >
		            	<div class="container">
		            		<div class="row" id="chooseLinkBrandContent">
		            		</div>
		            	</div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="button" class="btn btn-primary" onclick="makeSureChoose();">确认选择</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
		
		<!-- 模态框 更新分类下的连接地址（Modal） -->
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h2 class="modal-title" id="myModalLabel">更新收藏链接</h2>
		            </div>
		            <div class="modal-body">
		            	<div class="container">
		            		<form id="updateBrandForm" enctype="multipart/form-data" method="post">
		            		<input type="hidden" id="id" name="id" value=""/>
		            		<div class="row">
		            			<div class="col-xs-3 col-sm-3 col-md-3">
		            				<label for="linkAddr" class="control-label"><small>链接地址</small></label>
		            			</div>
		            			<div class="col-xs-8 col-sm-8 col-md-8">
		            				<input type="text" class="form-control" name="brandUrl" onblur="dynFindBrand(this);" id="up_linkAddr" placeholder="请输入链接地址">
		            			</div>
		            		</div>
		            		<br>
		            		<div class="row">
		            			<div class="col-xs-3 col-sm-3 col-md-3">
		            				<label for="linkName" class="control-label"><small>链接名</small></label>
		            			</div>
		            			<div class="col-xs-8 col-sm-8 col-md-8">
		            				<input type="text" class="form-control" name="brandName" id="up_linkName" placeholder="请输入链接名">
		            			</div>
		            		</div>
		            		<br>
		            		<div class="row">
		            			<div class="col-xs-1 col-sm-1 col-md-1 ">
		            			
		            			</div>
		            			<div class="col-xs-5 col-sm-5 col-md-5 linkThumbnail">
		            			
		            			</div>
		            			<div class="col-xs-6 col-sm-6 col-md-6">
		            				<p>自定义图标</p>
									 <input id="uploadImg" type="file" class="form-control" onchange="fileChange(this);" name="file">
									 <p style="font-size:10px;margin-top:6px">图片尺寸242*122,图片大小50kb之内</p>
		            			</div>
		            		</div>
		            		</form>
		            	</div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="button" class="btn btn-primary" onclick="updateBrand_bu();">保存</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
		
        <!-- END Footer -->
        <!-- All JavaScript libraries -->
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

		<!--[if IE]>
			<script type="text/javascript">
				 window.jQuery || document.write("<script src='${pageContext.request.contextPath }/static/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
			</script>
		<![endif]-->
		<script src="${pageContext.request.contextPath }/static/assets/js/bootstrap.min.js"></script>
		<!-- Custom JavaScript -->
        <script src="${pageContext.request.contextPath }/static/js/pages/pre/main.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/pages/pre/navication.js"></script>
<!--------------------------------------------------------- FOOTER  --------------------------------------------------------->
<footer class="footer slate_gray navication_footer" style="position: absolute;clear:both;width: 100%;bottom: 0;">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <p class="text-center" style="color: white;">Copyright &copy; 2017.佳奇网络</p>
            </div>
        </div>
    </div>
</footer>
<!-- footer end-->