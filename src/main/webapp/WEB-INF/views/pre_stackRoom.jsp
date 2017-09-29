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
		<link href="${pageContext.request.contextPath}/static/bootstrap/font-awesome.css" rel="stylesheet">
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
                                <a href="index.jsp" class="logo"><img class="img-responsive" alt="" src="${pageContext.request.contextPath }/static/images/Pre/common/logo.png"> </a>
                            </div>
                        </div>
                        <div class="col-sm-5">
                        	<!-- 音乐 -->
                        </div>
                         <div class="col-sm-2">
                        	<!-- <iframe name="weather_inc"  onmouseover="showAllWeather();" src="http://i.tianqi.com/index.php?c=code&id=7" height="86" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe> -->
                       		<iframe allowtransparency="true" frameborder="0" width="180" height="36" scrolling="no" src="//tianqi.2345.com/plugin/widget/index.htm?s=3&z=2&t=0&v=0&d=3&bd=0&k=&f=&ltf=009944&htf=cc0000&q=1&e=1&a=1&c=54511&w=180&h=36&align=center"></iframe>
                        </div>
                        <div class=" col-sm-3  hidden-xs" style="padding-top:1%;">
								<shiro:guest>  
                                	<a href="${pageContext.request.contextPath }/pre/user/pre_login" style="margin:6% 1% 8% 9%" class="btn btn-info">登录</a>
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
                              <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }">主页</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_note">记录</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_navigation">导航</a>
                                </li>
                                <li   class="active">
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_stackRoom"><b>书库</b></a>
                                </li>
                               <!-- <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="category.html">People</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="category.html">Main</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="">Other
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
                                </li>-->
                                <li class="navbar-right hidden-xs">
                                    <form action="http://www.baidu.com/baidu" target="_blank" class="navbar-form" role="search">
                                        <input name=tn type=hidden value=baidu>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name=word placeholder="请输入关键字">
                                        </div>
                                        <button type="submit" class="btn btn-search" style="padding-top:12px">
                                            <img src="http://img.baidu.com/search/img/baidulogo_clarity_80_29.gif" alt="Baidu"  border="0">
                                        </button>
                                    </form>
                                    <!-- 百度搜索框提示 -->  
			        				<!-- <script charset="gbk" src="http://www.baidu.com/js/opensug.js"></script> -->
                                </li>
                                <li>
                                    <div class="visible-xs col-sm-offset-5 col-sm-4">
                                        <div class="col-sm-5">
                                            <div class="weather">
                                                <div class="weather__temperature">
                                                    <span class="icon-sun"></span>
                                                    <em>+8 C</em>
                                                </div>
                                                <div class="weather__city">
                                                    <em>London</em>
                                                    <div class="weather__city__list">
                                                        <ul>
                                                            <li class="active">
                                                                <a href="#">London</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">Moscow</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">Kiev</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-7">
                                            <div class="exchange">
                                                <p class="exchange__name">Central Bank Rate</p>
                                                <p class="exchange__course">
                                                    $<span>32.32</span>&#8364;<span>28.23</span>
                                                </p>
                                            </div>
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
<!-- END header -->

        <!-- END header -->
        <!-- header slider -->
        <section style="height: 500px;">
            <!-- top news -->
            <div class="container">
            	<!-- 书籍分类、大图强推、（个人中心、搜索） -->
     			<div class="row">
     				<div class="col-xs-12 col-sm-6 col-md-4">
     				<!-- 书籍分类 -->
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                    <!-- 大图强推-->
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                    	<!-- 个人中心  -->
                    	<div class="row">
                    	</div>
                    	<!-- 搜索   -->
                    	<div class="row">
                    	</div>
                    </div>
     			</div>
     			<!-- 新上架  -->
     			<div class="row">
     				
     			</div>
     			<!-- 畅销榜 -->
     			<div class="row">
     				
     			</div>
     			<!-- 搜索榜 -->
     			<div class="row">
     				
     			</div>
     			<!-- 推荐榜 -->
     			<div class="row">
     				
     			</div>
     		</div>
        </section>
<!--------------------------------------------------------- JS ------------------------------------------------------------->
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/webPagination.js"></script><!-- 分页插件 -->
<!--------------------------------------------------------- FOOTER  --------------------------------------------------------->
<jsp:include page="../../common/pre_footer.jsp"/>
<!-- footer end-->
