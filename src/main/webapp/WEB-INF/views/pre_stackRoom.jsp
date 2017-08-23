﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
        <!-- favicon -->
        <link rel="shortcut icon" type="image/png" href="favicon.png" />
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
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="wrap-logo">
                                <a href="index.html" class="logo"></a>
                            </div>
                        </div>
                        <div class="col-sm-offset-2 col-md-offset-5 col-sm-6 col-md-4 hidden-xs">
                            <div class="col-xs-4 col-sm-5">
                                <div class="weather">
                                    <div class="weather__temperature">
                                        <span class="icon-sun"></span>
                                        <em class="active">+8 C</em>
                                        <em>+2 C</em>
                                        <em>+3 C</em>
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
                            <div class="col-xs-6 col-sm-7">
                                <div class="exchange">
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_login" class="btn btn-lg btn-info">登录</a>
                               		<a href="${pageContext.request.contextPath }/pre/PreCustomPage" class="btn-link"  target="_blank" >自定义页面</a>
                                </div>
                            </div>
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
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_node">生活点滴</a>
                                </li>
                                <li >
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_navigation">导航</a>
                                </li>
                                <li  class="active">
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_stackRoom">书库</a>
                                </li>
                                <!--<li>
                                    <span class="wsmenu-click"></span>
                                    <a href="category.html">Religion</a>
                                </li>
                                <li>
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
                                    <form class="navbar-form " role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search">
                                        </div>
                                        <button type="submit" class="btn btn-search">
                                            <i class="icon-search"></i>
                                            <br>Search
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
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<!-- Custom JavaScript -->
        <script src="js/main.js"></script>
    </body>
</html>

