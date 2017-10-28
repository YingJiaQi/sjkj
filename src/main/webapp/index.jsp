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
        <link href="${pageContext.request.contextPath }/static/css/Pre/index.css" rel="stylesheet" type="text/css" />
        <link href="../static/assets/css/font-awesome.min.css" rel="stylesheet">
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
                       		<!-- <iframe allowtransparency="true" frameborder="0" width="180" height="36" scrolling="no" src="//tianqi.2345.com/plugin/widget/index.htm?s=3&z=2&t=0&v=0&d=3&bd=0&k=&f=&ltf=009944&htf=cc0000&q=1&e=1&a=1&c=54511&w=180&h=36&align=center"></iframe> -->
                        </div>
                        <div class=" col-sm-3  hidden-xs" style="padding-top:1%;">
								<shiro:guest>  
                                	<a href="${pageContext.request.contextPath }/pre/user/pre_login" style="margin:6% 1% 8% 9%;opacity:0.8;padding:3% 10%;background-color:#eeeeee;border:none;color:black" class="btn btn-info">登录</a>
								</shiro:guest>
								<shiro:user>
									<a href="${pageContext.request.contextPath }/pre/user/pre_userCenter" target="_self"><img class="img-thumbnail img-responsive" style="margin-bottom:3%" alt="" src="${pageContext.request.contextPath }/static/images/Pre/common/defaultPic.jpg" width="70px" height="70px"> </a> 
								    欢迎,<a href="${pageContext.request.contextPath }/pre/user/pre_userCenter" target="_self"><b><shiro:principal property="userName"/></b></a> , <a href="${pageContext.request.contextPath}/pre/loginOut" onclick="loginOut();">退出</a>  
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
                                <li class="visible-xs">
                                    <form class="navbar-form mob_search" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search">
                                        </div>
                                        <button type="submit" class="btn btn-search">
                                            <i class="icon-search"></i>
                                        </button>
                                    </form>
                                </li>

                                <li class="active">
                                    <span class="wsmenu-click"></span>
                                    <a href="#"><b>主页</b></a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_note">记录</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_navigation">导航</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_stackRoom">书库</a>
                                </li>
                                <li>
                                    <div class="visible-xs col-sm-offset-5 col-sm-4">
                                        <div class="col-sm-5">
                                            <shiro:guest>  
			                                	<a href="${pageContext.request.contextPath }/pre/user/pre_login" style="margin:6% 1% 8% 9%;opacity:0.8;" class="btn btn-info">登录</a>
											</shiro:guest>
											<shiro:user>
												<a href="${pageContext.request.contextPath }/pre/user/pre_userCenter" target="_self"><img class="img-thumbnail img-responsive" style="margin-bottom:3%" alt="" src="${pageContext.request.contextPath }/static/images/Pre/common/defaultPic.jpg" width="70px" height="70px"> </a> 
											    欢迎,<a href="${pageContext.request.contextPath }/pre/user/pre_userCenter" target="_self"><b><shiro:principal property="userName"/></b></a> , <a href="${pageContext.request.contextPath}/pre/loginOut" onclick="loginOut();">退出</a>  
				                               	<%-- <a href="${pageContext.request.contextPath }/pre/PreCustomPage" class="btn-link"  target="_blank" >自定义页面</a> --%>
											</shiro:user>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                        <!--Menu HTML Code-->
                    </div>
                </div>
            </div>
        </header>
        <br>
        <!-- END header -->
        <!-- 天气 -->
        <section>
        <div class="container">
        	<div class="row">
        		<div class="col-xs-12 col-md-8">
        			<h4>实时热点新闻</h4>
        		</div>
        		<div class="col-xs-12 col-md-3">
		        	<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=55" style="" width="255" height="294" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
        		</div>
        	</div>
        </div>
        </section>
        <!-- top news-->
        <section>
	        <!-- top news -->
            <!-- title -->
            <div class="wrap wrap_white">
                <div class="container title">
                    <h1 class="title__h1 underscore">便利查询</h1><br/>
                    <div class="row">
                    	<div class="col-xs-12 col-sm-6 col-md-3" style="border:1px solid #eeeeee">
                    		<h4>手机归属地查询</h4>
                    		
                    	</div>
                    	<div class="col-xs-12 col-sm-6 col-md-3" style="border:1px solid #eeeeee">
                    		<h4>物流查询</h4>
                    	</div>
                    	<div class="col-xs-12 col-sm-6 col-md-3" style="border:1px solid #eeeeee">
                    		
                    	</div>
                    	<div class="col-xs-12 col-sm-6 col-md-3" style="border:1px solid #eeeeee">
                    	
                    	</div>
                    </div>
                </div>
            </div>
            <!-- END title -->
        </section>
        <!-- /top news -->
        <section>
            <!-- top news -->
            <!-- title -->
            <div class="wrap wrap_white hidden-xs">
                <div class="container title">
                    <h1 class="title__h1 underscore">照片墙</h1>
                </div>
            </div>
            <!-- END title -->
        </section>
         <section class="wrap wrap_gray pt20 hidden-xs">
	        <div class="container">
	        	<div class="row">
	        		<div class="col-md-3 col-sm-6 versePic">
				        <div class="brand horizontal horizontals">
							<a target="_blank" href="#"><img alt="" src="${pageContext.request.contextPath }/static/images/Pre/mywall/001.png" class="img-responsive img-rounded"/><div class="info">图1</div></a>
						</div>
	        		</div>
	        		<div class="col-md-3 col-sm-6 versePic">
				        <div class="brand horizontal horizontals">
							<a target="_blank" href="#"><img alt="" src="${pageContext.request.contextPath }/static/images/Pre/mywall/002.png" class="img-responsive img-rounded"/><div class="info">图1</div></a>
						</div>
	        		</div>
	        		<div class="col-md-3 col-sm-6 versePic">
				        <div class="brand horizontal horizontals">
							<a target="_blank" href="#"><img alt="" src="${pageContext.request.contextPath }/static/images/Pre/mywall/003.png" class="img-responsive img-rounded"/><div class="info">图1</div></a>
						</div>
	        		</div>
	        		<div class="col-md-3 col-sm-6 versePic">
				        <div  class="brand horizontal horizontals">
							<a target="_blank" href="#"><img alt="" src="${pageContext.request.contextPath }/static/images/Pre/mywall/004.png" class="img-responsive img-rounded"/><div class="info">图1</div></a>
						</div>
	        		</div>
	        	</div>
	        	<div class="row" style="margin-top: 3%;">
	        		<div class="col-md-3 col-sm-6 versePic">
				        <div class="brand horizontal horizontals">
							<a target="_blank" href="#"><img alt="" src="${pageContext.request.contextPath }/static/images/Pre/mywall/005.png" class="img-responsive img-rounded"/><div class="info">图1</div></a>
						</div>
	        		</div>
	        		<div class="col-md-3 col-sm-6 versePic">
				        <div class="brand horizontal horizontals">
							<a target="_blank" href="#"><img alt="" src="${pageContext.request.contextPath }/static/images/Pre/mywall/006.png" class="img-responsive img-rounded"/><div class="info">图1</div></a>
						</div>
	        		</div>
	        		<div class="col-md-3 col-sm-6 versePic">
				        <div class="brand horizontal horizontals">
							<a target="_blank" href="#"><img alt="" src="${pageContext.request.contextPath }/static/images/Pre/mywall/007.png" class="img-responsive img-rounded"/><div class="info">图1</div></a>
						</div>
	        		</div>
	        		<div class="col-md-3 col-sm-6 versePic">
				        <div  class="brand horizontal horizontals">
							<a target="_blank" href="#"><img alt="" src="${pageContext.request.contextPath }/static/images/Pre/mywall/008.png" class="img-responsive img-rounded"/><div class="info">图1</div></a>
						</div>
	        		</div>
	        	</div>
	        </div>
        </section>
       
       <%--  <section class="wrap wrap_gray">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 projects">
                        <div class="projects__title">
                            <h2 class="block-title__h2">广告位</h2>
                        </div>
                        <!-- banner -->
                        <div class="banner">
                            <img src="${pageContext.request.contextPath }/static/images/Pre/content/banner.jpg" height="221" width="850" alt="image" class="banner__img">
                            <div class="banner__box">
                                <p class="banner__text first-text">Advertising</p>
                                <p class="banner__text second-text">Here</p>
                                <a href="#" class="banner__link">Get Now</a>
                            </div>
                        </div>
                        <!-- END banner -->
                    </div>
                </div>
            </div>
        </section> --%>
        <!-- 页面弹出提示框（Modal） -->
		<div class="modal fade" id="showWeatherDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <br>
		                <!-- <h4 class="modal-title" id="showTipTitle"></h4> -->
		            </div>
		            <div class="modal-body">
		            	<div class="container">
		            		<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=82" width="250" height="440" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
		            	</div>
		            </div>
		           <div class="modal-footer">
		                <!-- <button type="button" class="btn btn-default showCateSure" data-dismiss="modal">确定</button> -->
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
        
        
        <!-- Footer -->
        <footer class="footer slate_gray">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <p class="text-center" style="color: white;">Copyright &copy; 2017.佳奇网络</p>
                    </div>
                    <!--<div class="col-sm-6">
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
                    </div>-->
                </div>
            </div>
        </footer>
        <!-- END Footer -->
        <!-- All JavaScript libraries -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath }/static/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
			<script type="text/javascript">
				 window.jQuery || document.write("<script src='${pageContext.request.contextPath }/static/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
			</script>
		<![endif]-->
		<script src="${pageContext.request.contextPath }/static/assets/js/bootstrap.min.js"></script>
		<!-- Custom JavaScript -->
        <script src="${pageContext.request.contextPath }/static/js/pages/pre/main.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/pages/pre/index.js"></script>

         <script type="text/javascript">
			//品牌翻转
		var turn = function(target,time,opts){
			target.find('a').hover(function(){
					$(this).find('img').stop().animate(opts[0],time,function(){
					$(this).hide().next().show();
					$(this).next().animate(opts[1],time);
				});
			},function(){
					$(this).find('.info').animate(opts[0],time,function(){
					$(this).hide().prev().show();
					$(this).prev().animate(opts[1],time);
				});
			});
		}
		var horizontalOpts = [{'height':0,'top':'200px'},{'width':'280px','top':0,'height':'400px'}];
		turn($('.horizontals'),100,horizontalOpts);
		</script>
    </body>
</html>
