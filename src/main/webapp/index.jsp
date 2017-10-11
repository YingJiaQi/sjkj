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
                                	<a href="${pageContext.request.contextPath }/pre/user/pre_login" style="margin:6% 1% 8% 9%;opacity:0.8;" class="btn btn-info">登录</a>
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
                                <!--<li>
                                    <span class="wsmenu-click"></span>
                                    <a href="category.html">家</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="category.html">People</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="category.html">Main</a>
                                </li>-->
                                <!--<li>
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
                                    <form class="navbar-form" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search">
                                        </div>
                                        <button type="submit" class="btn btn-search">
                                            <i class="icon-search"></i>
                                            <br/>站内搜索
                                        </button>
                                    </form>
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
        <!-- header slider -->
        <div class="slate_gray">
            <div class="container">
                <div class="row header_news_panel">
                    <!-- Tab panes -->
                    <div class="col-sm-8 tab-content tab-content_mob-p0">
                        <div role="tabpanel" class="tab-pane fade in active" id="home">
                            <img src="${pageContext.request.contextPath }/static/images/Pre/content/slide1.jpg" alt="main img" class="tab-pane__img">
                            <div class="header_news_text tab-pane__block">
                                <p class="tab-pane__category yel_line">People</p>
                                <a class="tab-pane__title">The Visions's Rainbow</a>
                                <p class="tab-pane__text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="profile">
                            <img src="${pageContext.request.contextPath }/static/images/Pre/content/slide2.jpg" alt="main img" class="tab-pane__img">
                            <div class="header_news_text tab-pane__block">
                                <p class="tab-pane__category yel_line">People</p>
                                <a class="tab-pane__title">The Visions's Rainbow</a>
                                <p class="tab-pane__text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="messages">
                            <img src="${pageContext.request.contextPath }/static/images/Pre/content/slide1.jpg" alt="main img" class="tab-pane__img">
                            <div class="header_news_text tab-pane__block">
                                <p class="tab-pane__category yel_line">People</p>
                                <a class="tab-pane__title">The Visions's Rainbow</a>
                                <p class="tab-pane__text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="settings">
                            <img src="${pageContext.request.contextPath }/static/images/Pre/content/slide2.jpg" alt="main img" class="tab-pane__img">
                            <div class="header_news_text tab-pane__block">
                                <p class="tab-pane__category yel_line">People</p>
                                <a class="tab-pane__title">The Visions's Rainbow</a>
                                <p class="tab-pane__text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                    </div>
                    <!-- END Tab panes -->
                    <!-- Nav tabs -->
                    <div class="col-sm-4 news-tabs">
                        <p class="news-tabs__title h2">Last news</p>
                        <ul class="news-tabs__nav nav nav-tabs shadow_text" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#home" role="tab" data-toggle="tab">
                                    <span class="time">today, 10:11</span>
                                    Volkswagen hit by multiple probes in US Volkswagen hit by multiple probes in US
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#profile" role="tab" data-toggle="tab">
                                    <span class="time">today, 11:22</span>
                                    Volkswagen hit by multiple probes in US Volkswagen hit by multiple probes in US
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#messages" role="tab" data-toggle="tab">
                                    <span class="time">today, 12:33</span>
                                    Volkswagen hit by multiple probes in US Volkswagen hit by multiple probes in US
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#settings" role="tab" data-toggle="tab">
                                    <span class="time">today, 14:44</span>
                                    Volkswagen hit by multiple probes in US Volkswagen hit by multiple probes in US
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- END Nav tabs -->
                </div>
            </div>
        </div>
        <!-- END header slider -->
        <!-- top news-->
        <section>
            <!-- top news -->
            <!-- title -->
            <div class="wrap wrap_white">
                <div class="container title">
                    <h1 class="title__h1 underscore">快捷入口</h1>
                </div>
            </div>
            <!-- END title -->
            <div class="wrap wrap_gray pt20">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="thumbnail thumbnail_big">
                                <img src="${pageContext.request.contextPath }/static/images/Pre/content/news1.jpg" height="350" width="560" alt="News">
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <p class="news__category yellow-line">Economy</p>
                                        <a href="#" class="news__head">The dollar has broken all records of positive change in the world and in the galaxy</a>
                                        <p class="news__desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">today, 16:37</span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i>29
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i>2.3k
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="thumbnail thumbnail_small">
                                <a href="news.html" class="thumbnail__link">
                                    <img src="${pageContext.request.contextPath }/static/images/Pre/content/news2.jpg" height="153" width="270" alt="News">
                                </a>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <p class="news__category yellow-line">Economy</p>
                                        <a href="news.html" class="news__link">
                                            <p class="news__text">Еhe world's economy is improving and good times</p>
                                        </a>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">today, 12:11</span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i>11
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i>1.1k
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="thumbnail thumbnail_small">
                                <a href="news.html" class="thumbnail__link">
                                    <img src="${pageContext.request.contextPath }/static/images/Pre/content/news3.jpg" height="153" width="270" alt="News">
                                </a>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <p class="news__category yellow-line">Economy</p>
                                        <a href="news.html" class="news__link">
                                            <p class="news__text">The euro needs to everyone in a large amount</p>
                                        </a>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">today, 19:30</span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i>294
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i>2.9k
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="thumbnail thumbnail_small">
                                <a href="news.html" class="thumbnail__link">
                                    <img src="${pageContext.request.contextPath }/static/images/Pre/content/news4.jpg" height="153" width="270" alt="News">
                                </a>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <i class="icon-play"></i>
                                        <p class="news__category yellow-line">People</p>
                                        <a href="news.html" class="news__link">
                                            <p class="news__text">NEWS: People began to love each other in large numbers online (Video)</p>
                                        </a>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">today, 2:39</span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i>9
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i>1.3k
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="thumbnail thumbnail_small">
                                <a href="news.html" class="thumbnail__link">
                                    <img src="${pageContext.request.contextPath }/static/images/Pre/content/news5.jpg" height="153" width="270" alt="News">
                                </a>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <p class="news__category yellow-line">Sport</p>
                                        <a href="news.html" class="news__link">
                                            <p class="news__text">Athletes are confident of victory in all competitions</p>
                                        </a>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">today, 14:34</span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i>58
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i>8.8k
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="thumbnail thumbnail_small">
                                <a href="news.html" class="thumbnail__link">
                                    <img src="${pageContext.request.contextPath }/static/images/Pre/content/news6.jpg" height="153" width="270" alt="News">
                                </a>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <i class="icon-play"></i>
                                        <p class="news__category yellow-line">People</p>
                                        <a href="news.html" class="news__link">
                                            <p class="news__text">All the people of the world love each other and say hello</p>
                                        </a>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">today, 12:37</span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i>20
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i>1.2k
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="thumbnail thumbnail_small">
                                <a href="news.html" class="thumbnail__link">
                                    <img src="${pageContext.request.contextPath }/static/images/Pre/content/news7.jpg" height="153" width="270" alt="News">
                                </a>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <p class="news__category yellow-line">Economy</p>
                                        <a href="news.html" class="news__link">
                                            <p class="news__text">Attention: The poor become rich, rich richer</p>
                                        </a>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">today, 11:30</span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i>21
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i>1.9k
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="thumbnail thumbnail_small">
                                <a href="news.html" class="thumbnail__link">
                                    <img src="${pageContext.request.contextPath }/static/images/Pre/content/news8.jpg" height="153" width="270" alt="News">
                                </a>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <i class="icon-play"></i>
                                        <p class="news__category yellow-line">Sport</p>
                                        <a href="news.html" class="news__link">
                                            <p class="news__text">The winners of sports games already online (Video)</p>
                                        </a>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">today, 10:36</span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i>17
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i>2.0k
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="thumbnail thumbnail_small">
                                <a href="news.html" class="thumbnail__link">
                                    <img src="${pageContext.request.contextPath }/static/images/Pre/content/news9.jpg" height="153" width="270" alt="News">
                                </a>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <p class="news__category yellow-line">Business</p>
                                        <a href="news.html" class="news__link">
                                            <p class="news__text">The best exchange rates and motivation for you</p>
                                        </a>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">today, 12:30</span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i>29
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i>2.3k
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- btn load-->
                <div class="ajax_load">
                    <i class="icon-arrows-cw"></i>Load more
                    <svg width="128" height="40" viewBox="0 0 128 40" xmlns="http://www.w3.org/2000/svg">
                        <rect x='0' y='0' fill='none' width='128' height='40'></rect>
                    </svg>
                </div>
                <!-- END btn load-->
            </div>
            <!-- /container-->
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
       
        <section class="wrap wrap_gray">
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
        </section>
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
