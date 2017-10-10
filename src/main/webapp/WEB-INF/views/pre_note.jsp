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
                                <li  class="active">
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_note"><b>记录</b></a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_navigation">导航</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_stackRoom">书库</a>
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



<!-------------------------------------------------------- CONTENT --------------------------------------------------------->
<section>
    <!-- top news -->
       <div class="container" id="note_content_list">
           <div class="row hide" id="note_content_header">
           		<div class="col-sm-12 col-md-9 col-lg-10">
	               <h2 class="title__h1 underscore ">经过火的洗礼，泥巴才会有坚强的体魄！</h2>
           		</div>
           		<div class="col-sm-12 col-md-3 col-lg-2" style="padding-top:0.6%">
           			<shiro:user>  
		               <button onclick="writeNode();" type="button" class="btn btn-info pull-right"><span class="glyphicon glyphicon-pencil"></span>&nbsp;记录</button>
					</shiro:user>
           		</div>
           </div>
       </div>
       <div class="wrap wrap_gray pt20">
           <div class="container" id="note_content">
               <div class="row">
               		<div class="col-sm-6"  id="note_content_first" ></div>
               		<div class="col-sm-6">
               			<div  class="row"  id="note_content_sec" >
               			</div>
               			<div  class="row"   id="note_content_thr">
               			</div>
               		</div>
               </div>
               <div class="row" id="note_content_besideOneRow"></div>
	            <div class="row text-center" style="width:100%">
						<ul id="pagination_bar"></ul>
				</div>
           </div>
       </div>
       <!-- /container-->
</section>
<!-- 页面弹出提示框（Modal） -->
<div class="modal fade" id="showNoteDetail"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog hidden-xs" style="width:80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <br>
                <h2 class="modal-title hidden-xs hidden-lg"></h2>
                <h4 class="modal-title visible-xs"></h4>
                <h1 class="modal-title visible-lg"></h1>
            </div>
            <div class="modal-body _noteContent">
            </div>
           <!-- <div class="modal-footer">
                <button type="button" class="btn btn-default showCateSure" data-dismiss="modal">确定</button>
            </div> -->
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
    <div class="modal-dialog visible-xs">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <br>
                <h2 class="modal-title hidden-xs hidden-lg"></h2>
                <h4 class="modal-title visible-xs"></h4>
                <h1 class="modal-title visible-lg"></h1>
            </div>
            <div class="modal-body _noteContent">
            </div>
           <!-- <div class="modal-footer">
                <button type="button" class="btn btn-default showCateSure" data-dismiss="modal">确定</button>
            </div> -->
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<!-- /top news -->
<!-- <section class="wrap wrap_gray">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9 projects">
                        banner
                        <div class="banner">
                            <img src="img/content/banner.jpg" height="221" width="850" alt="image" class="banner__img">
                            <div class="banner__box">
                                <p class="banner__text first-text">Advertising</p>
                                <p class="banner__text second-text">Here</p>
                                <a href="#" class="banner__link">Get Now</a>
                            </div>
                        </div>
                        END banner
                    </div>
                    <div class="col-sm-3">
                        <div class="twitter">
                            <div class="twitter__header">
                                <p class="twitter__header__name">@barclee</p>
                                <p class="twitter__header__text">Hello, world</p>
                            </div>
                            <div class="twitter__body">
                                <div class="message">
                                    <p class="message__time">about 5 hours ago</p>
                                    <p class="message__text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                    <a href="#" class="message__link">
                                        <i class="icon-reply"></i>Reply
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section> -->

<!--------------------------------------------------------- JS ------------------------------------------------------------->
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/static/bootstrap/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/static/js/extendPagination.js"></script><!-- 分页插件 -->
<script src="${pageContext.request.contextPath }/static/js/pages/pre/pre_note.js"></script><!-- 日记JS -->
<!--------------------------------------------------------- FOOTER  --------------------------------------------------------->
<footer class="footer slate_gray note_main" style="position: absolute;clear:both;width: 100%;bottom: 0;">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <p class="text-center" style="color: white;">Copyright &copy; 2017.佳奇网络</p>
            </div>
        </div>
    </div>
</footer>
<!-- footer end-->