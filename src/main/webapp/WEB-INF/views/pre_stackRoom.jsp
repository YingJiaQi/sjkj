<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta content="" name="description">
        <meta content="" name="keywords">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="HandheldFriendly" content="true">
        <meta content="telephone=no" name="format-detection">
        <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/font-awesome.min.css">
        <!--[if (gt IE 9)|!(IE)]><!-->
        <!-- custom CSS -->
        <link href="${pageContext.request.contextPath }/static/css/Pre/main.css" rel="stylesheet" type="text/css" />
        <!-- END custom CSS -->
        <!--<![endif]-->
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title></title>
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
                                <li>
                                    <a href="">书籍分类
        								<span class="arrow"></span>
                                	</a>
                                    <ul class="wsmenu-submenu">
                                        <li>
                                            <a href="404.html">404 page</a>
                                        </li>
                                        <li>
                                            <a href="category.html">Category page</a>
                                        </li>
                                        <li>
                                            <a href="news.html">News page</a>
                                        </li>
                                        <li>
                                            <a href="search-result.html">Search result</a>
                                        </li>
                                        <li>
                                            <a href="full-width.html">Full width</a>
                                        </li>
                                    </ul>
                                </li>
                              	<li>
                                    <a href="${pageContext.request.contextPath }">主页</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_note">记录</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_navigation">导航</a>
                                </li>
                                <li   class="active">
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_stackRoom"><b>书库</b></a>
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

        <!-- END header -->
        <!-- header slider -->
            <!-- top news -->
            <div class="container">
            	<!-- 书籍分类、大图强推、（个人中心、搜索） -->
     			<div class="row">
     				<div class="col-xs-12 col-sm-8 col-md-9"  style="margin-top:1em">
     				<!-- 书籍分类 -->
						<div id="myCarousel" class="carousel slide">
							<!-- 轮播（Carousel）指标 -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>   
							<!-- 轮播（Carousel）项目 -->
							<div class="carousel-inner">
								<div class="item active" >
									<img src="${pageContext.request.contextPath }/static/images/Pre/content/slide1.png" alt="First slide">
								</div>
								<div class="item" >
									<img src="${pageContext.request.contextPath }/static/images/Pre/content/slide2.png" alt="Second slide">
								</div>
								<div class="item">
									<img src="${pageContext.request.contextPath }/static/images/Pre/content/slide3.png" alt="Third slide">
								</div>
							</div>
							<!-- 轮播（Carousel）导航 -->
							<a class="carousel-control left" href="#myCarousel" 
							   data-slide="prev">&lsaquo;</a>
							<a class="carousel-control right" href="#myCarousel" 
							   data-slide="next">&rsaquo;</a>
						</div> 
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3"  style="margin-top:1em">
                    	<!-- 推广1  -->
                    	<div class="row">
                    		<img src="${pageContext.request.contextPath }/static/images/Pre/content/adv1.png">
                    	</div>
                    	<!-- 推广2   -->
                    	<div class="row">
                    		<img src="${pageContext.request.contextPath }/static/images/Pre/content/adv2.png">
                    	</div>
                    	<!-- 推广3   -->
                    	<div class="row" style="margin-top:0.2em">
                    		<img src="${pageContext.request.contextPath }/static/images/Pre/content/adv3.png">
                    	</div>
                    	<!-- 推广4   -->
                    	<div class="row"  style="margin-top:0.1em">
                    		<img src="${pageContext.request.contextPath }/static/images/Pre/content/adv3.png">
                    	</div>
                    </div>
     			</div>
     			<!-- 新上架  -->
     			<div class="row" id="newBooksList">
     				<br/>
     				<h3>&nbsp;&nbsp;<b style="color:#487A6F;font-size:1.2em;">新</b>书上架 &nbsp;&nbsp;<small>New books on shelves</small><a style="margin-right:2em;cursor:pointer;" class="pull-right">&gt;&gt;</a></h3>
     				<br/>
     			</div>
     			<!-- 畅销榜 -->
     			<div class="row" id="cxBooksList">
     				<br/>
     				<h3>&nbsp;&nbsp;<b style="color:#487A6F;font-size:1.2em">畅</b>销榜 &nbsp;&nbsp;<small>Bestseller list</small><a style="margin-right:2em;cursor:pointer;" class="pull-right">&gt;&gt;</a></h3>
     				<br/>
     			</div>
     			<!-- 好评榜 -->
     			<div class="row" id="hpBooksList">
     				<br/>
     				<h3>&nbsp;&nbsp;<b style="color:#487A6F;font-size:1.2em">好</b>评榜 &nbsp;&nbsp; <small>Praise list</small><a style="margin-right:2em;cursor:pointer;" class="pull-right">&gt;&gt;</a></h3>
     				<br/>
     			</div>
     			<!-- 收藏榜 -->
     			<div class="row" id="scBooksList">
     				<br/>
     				<h3>&nbsp;&nbsp;<b style="color:#487A6F;font-size:1.2em">收</b>藏榜&nbsp;&nbsp; <small>Collection list</small><a style="margin-right:2em;cursor:pointer;" class="pull-right">&gt;&gt;</a></h3>
     				<br/>
     			</div>
     		</div>
<!--------------------------------------------------------- JS ------------------------------------------------------------->
<script src="${pageContext.request.contextPath }/static/js/pages/pre/pre_stackRoom.js"></script>
<!--------------------------------------------------------- FOOTER  --------------------------------------------------------->
 <!-- Footer -->
        <footer class="footer slate_gray">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <p class="text-center" style="color: white;">Copyright &copy; 2017.佳奇信息</p>
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
    </body>
</html>