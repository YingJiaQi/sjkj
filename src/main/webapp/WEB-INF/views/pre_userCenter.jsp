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
        <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath }/static/css/Pre/main.css" rel="stylesheet" type="text/css" />
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
                            <div class="col-xs-6 col-sm-7" style="padding:6%;color:white">
								<shiro:guest>  
                                	<a href="${pageContext.request.contextPath }/pre/user/pre_login" class="btn btn-lg btn-info">登录</a>
								</shiro:guest>
								<shiro:user>  
								    欢迎,<a href="#"><b><shiro:principal property="userName"/></b></a> , <a href="${pageContext.request.contextPath}/pre/loginOut" onclick="loginOut();">退出</a>  
	                               	<a href="${pageContext.request.contextPath }/pre/PreCustomPage" class="btn-link"  target="_blank" >自定义页面</a>
								</shiro:user>
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

                                <li class="active">
                                    <span class="wsmenu-click"></span>
                                    <a href="#">主页</a>
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
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_userCenter"><b>个人中心</b></a>
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
                              <!--   <li class="navbar-right hidden-xs">
                                    <form class="navbar-form" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search">
                                        </div>
                                        <button type="submit" class="btn btn-search">
                                            <i class="icon-search"></i>
                                            <br/>Search
                                        </button>
                                    </form>
                                </li> -->
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
        <!-- END header slider -->
       <div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="caption">
						<ul class="list-unstyled classification">
							<li><h2 class="btn btn-default active"><a href="#" onclick="aboutUsFunction('1');">个人信息</a></h2></li>
							<li><h2 class="btn btn-default"><a href="#" onclick="aboutUsFunction('2');">信息修改</a></h2></li>
						</ul>
					</div>
				</div>
				<div class="col-md-9"  style="padding-right:0px;">
					<!-- <div class="caption">
						<div class="row" style="height:3px;background-color:#1a54b1;margin-top:10px;margin-left:1px">
						</div>
						<div style="height:32px;background-color:#dce4f3;padding:0px;">
							<span class="btn pull-left" id="moduleTitle"></span>
						</div>
					</div> -->
					<div class="row" id="showDataPanal" style="padding:20px">
						<table class="table text-center" >
						  <thead>
						  </thead>
						  <tbody>
						    <tr >
						      <td style="border:none"><label for="account" class="control-label">账号</label></td>
						      <td style="border:none"><input type="text" class="form-control" id="account" readonly></td>
						    </tr>
						    <tr>
						      <td style="border:none"> <label for="sex" class="control-label">性别</label></td>
						      <td style="border:none"> <input type="text" class="form-control" id="sex" readonly></td>
						    </tr>
						    <tr>
						      <td style="border:none"><label for="phonenum" class="control-label">手机号</label></td>
						      <td style="border:none"> <input type="text" class="form-control" id="phonenum" readonly></td>
						    </tr>
						    <tr>
						      <td style="border:none"><label for="email" class="control-label">邮箱</label></td>
						      <td style="border:none"> <input type="text" class="form-control" id="email" readonly></td>
						    </tr>
						    <tr>
						      <td style="border:none"><label for="birthday" class="control-label">生日</label></td>
						      <td style="border:none"> <input type="text" class="form-control" id="birthday" readonly></td>
						    </tr>
						    <tr>
						      <td style="border:none"><label for="privilege" class="control-label">会员等级</label></td>
						      <td style="border:none"> <input type="text" class="form-control" id="privilege" readonly></td>
						    </tr>
						    <tr>
						      <td style="border:none"><label for="lastLoginTime" class="control-label">最后登录时间</label></td>
						      <td style="border:none"> <input type="text" class="form-control" id="lastLoginTime" readonly></td>
						    </tr>
						    <tr>
						      <td style="border:none"><label for="LoginTimes" class="control-label">登录次数</label></td>
						      <td style="border:none"> <input type="text" class="form-control" id="LoginTimes" readonly></td>
						    </tr>
						    <tr>
						      <td style="border:none"><label for="registerTime" class="control-label">注册时间</label></td>
						      <td style="border:none"> <input type="text" class="form-control" id="registerTime" readonly></td>
						    </tr>
						  </tbody>
						</table>
					</div>
			</div>
		</div>
       </div>
       
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
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<!--[if IE]>
			<script type="text/javascript">
				 window.jQuery || document.write("<script src='${pageContext.request.contextPath }/static/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
			</script>
		<![endif]-->
		<script src="${pageContext.request.contextPath }/static/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/js/pages/pre/pre_userCenter.js"></script>
    </body>
</html>
