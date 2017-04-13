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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
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
								    欢迎, <shiro:principal property="userName"/>, <a href="${pageContext.request.contextPath}/pre/loginOut" onclick="loginOut();">退出</a>  
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

                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }">主页</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_node">生活点滴</a>
                                </li>
                                <li  class="active">
                                    <span class="wsmenu-click"></span>
                                    <a href="${pageContext.request.contextPath }/pre/user/pre_navigation"><b style="color:green">导航</b></a>
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
                                    <form action="http://www.baidu.com/baidu" target="_blank" class="navbar-form" role="search">
                                        <input name=tn type=hidden value=baidu>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name=word placeholder="请输入关键字">
                                        </div>
                                        <button type="submit" class="btn btn-search">
                                            <img src="http://img.baidu.com/search/img/baidulogo_clarity_80_29.gif" alt="Baidu"  border="0">
                                            <br/>百度搜索
                                        </button>
                                    </form>
                                    <!-- 百度搜索框提示 -->  
			        				<script charset="gbk" src="http://www.baidu.com/js/opensug.js"></script>
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
        <!-- content top -->
        <div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-3 col-xs-4" id="navCategoryBox">
					<!--头部导航开始-->
					<ul class="nav nav-pills nav-stacked" id="navCategoryList">
						<li><a class="navClassify">常用链接</a></li>
						<li><a class="navClassify">视频音乐</a></li>
						<li><a class="navClassify">新闻资讯</a></li>
						<li><a class="navClassify">购物淘宝</a></li>
						<li><a class="navClassify">游戏娱乐</a></li>
						<li><a class="navClassify">实用工具</a></li>
						<li><a class="navClassify">影视资源</a></li>
						<li>
							<div style="border:2px solid grey;background-color: #303D4A;padding: 2px;text-align: center;">
								<!--左右箭头开始-->
								<div class="prev"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/arr_left.png" width="15" height="20"></div>
								<div class="next"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/arr_right.png" width="15" height="20"></div>
								<!--左右箭头结束-->
								<span id="addCategory" onclick="">添加</span>
								<span id="updateCategory" onclick="">修改</span>
							</div>
						</li>						
					</ul>
					<!--头部导航结束-->
				</div>
				<div class="col-md-10 col-sm-9 col-xs-8">
					<!--logo区开始-->
					<div id="metro_box" class="a_link">
						<dl>
							<dd style="display:bolck;">
							<div class="row">
								<!--名站导航-->
									<div class="col-md-3 col-sm-4 col-xs-6 one" id="logo_001">
										<a href="http://google.hk" class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_001.png"  alt="google"></a><span><a href="#" >谷歌</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6" id="logo_002">
										<a href="http://www.bizhiyun.com" class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_004d.png"  alt=""></a><span><a href="#">壁纸</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6" id="logo_003">
										<a href="http://www.youku.com" class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_003.png"  alt=""></a><span><a href="#">优酷</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6" id="logo_004">
										<a href="http://www.weibo.com" class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_004.png"  alt=""></a><span><a href="#">新浪微博</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6 one" id="logo_005">
										<a href="http://www.taobao.com/go/chn/tbk_channel/channelcode.php?pid=mm_33201743_3168968_10472364&eventid=101329"  class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_005.png" alt=""></a><span><a href="#">淘宝网</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6" id="logo_006">
										<a href="http://www.360buy.com" class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_006.png" alt=""></a><span><a href="#">京东商城</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6" id="logo_007">
										<a href="http://www.amazon.cn/?_encoding=UTF8&camp=536&creative=3200&linkCode=ur2&tag=528888-23" class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_007.png" alt=""></a><span><a href="#">亚马逊</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6" id="logo_008">
										<a href="http://www.dangdang.com/?_ddclickunion=P-315673|ad_type=10|sys_id=1#dd_refer=http%3A%2F%2Fmyler.cn%2F" class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_008.png" alt=""></a><span><a href="#">当当网</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6 one" id="logo_009">
										<a href="http://qiyi.com"  class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_009.png"  alt=""></a><span><a href="#">奇艺网</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6" id="logo_010">
										<a href="http://www.tudou.com"  class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_010.png" alt=""></a><span><a href="#">土豆网</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6" id="logo_011">
										<a href="http://www.renren.com" class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_011.png" alt=""></a><span><a href="#">人人网</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6 four" id="logo_012">
										<a href="http://s.click.taobao.com/t_11?e=%2BtSC5ziSlQIKXTum23VHLUx2Mi9BvFxTCg7CN9kKD8HJdox0eUoImgi5Ng%3D%3D&p=mm_33201743_3168968_10561464"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_012.png" alt=""></a><span><a href="#">凡客诚品</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6 one" id="logo_013">
										<a href="http://www.people.com.cn" class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_013.png"  alt=""></a><span><a href="#">人民网</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6" id="logo_014">
										<a href="http://www.cntv.cn" class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_014.png" alt=""></a><span><a href="#">中国电视台</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6" id="logo_015">
										<a href="http://sohu.com" class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_015.png"  alt=""></a><span><a href="#">搜狐网</a></span>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6 four" id="logo_016">
										<a href="http://www.aspjzy.com" class="img-responsive"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_016.png" alt=""></a><span><a href="#">ASP集中营</a></span>
									</div>
							</div>
							</dd>
							<dd style="display:none;">
								<!--视频音乐-->
								<ul>
									<li class="one" id="logo_001">
										<a href="http://youku.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_001b.png" width="240" height="120" alt="youku"></a><span><a href="#">优酷视频</a></span></li>
									<li id="logo_002">
										<a href="http://www.qiyi.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_002b.png" width="240" height="120" alt="qiyi"></a><span><a href="#">奇艺视频</a></span></li>
									<li id="logo_003">
										<a href="http://www.tudou.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_003b.png" width="240" height="120" alt=""></a><span><a href="#">土豆视频</a></span></li>
									<li class="four" id="logo_004">
										<a href="http://www.cntv.cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_004b.png" width="240" height="120" alt=""></a><span><a href="#">中国网络电视台</a></span></li>
									<li class="one" id="logo_005">
										<a href="http://tv.sohu.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_005b.png" width="240" height="120" alt=""></a><span><a href="#">搜狐高清</a></span></li>
									<li id="logo_006">
										<a href="http://www.ku6.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_006b.png" width="240" height="120" alt=""></a><span><a href="#">酷六视频</a></span></li>
									<li id="logo_007">
										<a href="http://56.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_007b.png" width="240" height="120" alt=""></a><span><a href="#">56视频</a></span></li>
									<li class="four" id="logo_008">
										<a href="http://v.qq.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_008b.png" width="240" height="120" alt=""></a><span><a href="#">腾讯视频</a></span></li>
									<li class="one" id="logo_009">
										<a href="http://xunlei.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_009b.png" width="240" height="120" alt=""></a><span><a href="#">迅雷看看</a></span></li>
									<li id="logo_010">
										<a href="http://www.pptv.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_010b.png" width="240" height="120" alt=""></a><span><a href="#">PPTV</a></span></li>
									<li id="logo_011">
										<a href="http://v.ifeng.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_011b.png" width="240" height="120" alt=""></a><span><a href="#">凤凰视频</a></span></li>
									<li class="four" id="logo_012">
										<a href="http://video.sina.com.cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_012b.png" width="240" height="120" alt=""></a><span><a href="#">新浪视频</a></span></li>
									<li class="one" id="logo_013">
										<a href="http://www.baofeng.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_013b.png" width="240" height="120" alt=""></a><span><a href="#">暴风影音</a></span></li>
									<li id="logo_014">
										<a href="http://www.kugou.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_014b.png" width="240" height="120" alt=""></a><span><a href="#">酷狗音乐</a></span></li>
									<li id="logo_015">
										<a href="http://www.funshion.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_015b.png" width="240" height="120" alt=""></a><span><a href="#">风行电影</a></span></li>
									<li class="four" id="logo_016">
										<a href="http://www.letv.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_016b.png" width="240" height="120" alt=""></a><span><a href="#">乐视网</a></span></li>
								</ul>
							</dd>
							<dd style="display:none;">
								<!--新闻资讯-->
								<ul>
									<li class="one" id="logo_001">
										<a href="http://news.baidu.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_001c.png" width="240" height="120" alt="baidu"></a><span><a href="#">百度新闻</a></span></li>
									<li id="logo_002">
										<a href="http://news.sohu.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_002c.png" width="240" height="120" alt="sohu"></a><span><a href="#">搜狐新闻</a></span></li>
									<li id="logo_003">
										<a href="http://www.people.com.cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_003c.png" width="240" height="120" alt=""></a><span><a href="#">人民网</a></span></li>
									<li class="four" id="logo_004">
										<a href="http://www.cntv.cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_004c.png" width="240" height="120" alt=""></a><span><a href="#">中国网络电视台</a></span></li>
									<li class="one" id="logo_005">
										<a href="http://www.yahoo.com.cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_005c.png" width="240" height="120" alt=""></a><span><a href="#">雅虎中国</a></span></li>
									<li id="logo_006">
										<a href="http://www.ku6.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_006c.png" width="240" height="120" alt=""></a><span><a href="#">酷六新闻</a></span></li>
									<li id="logo_007">
										<a href="http://huanqiu.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_007c.png" width="240" height="120" alt=""></a><span><a href="#">环球网</a></span></li>
									<li class="four" id="logo_008">
										<a href="http://qq.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_008c.png" width="240" height="120" alt=""></a><span><a href="#">腾讯网</a></span></li>
									<li class="one" id="logo_009">
										<a href="http://21cn.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_009c.png" width="240" height="120" alt=""></a><span><a href="#">21cn</a></span></li>
									<li id="logo_010">
										<a href="http://www.hsb.cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_010c.png" width="240" height="120" alt=""></a><span><a href="#">华商报</a></span></li>
									<li id="logo_011">
										<a href="http://www.bjnews.com.cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_011c.png" width="240" height="120" alt=""></a><span><a href="#">新京报网</a></span></li>
									<li class="four" id="logo_012">
										<a href="http://news.sina.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_012c.png" width="240" height="120" alt=""></a><span><a href="#">新浪新闻</a></span></li>
									<li class="one" id="logo_014a">
										<a href="http://www.nddaily.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_013c.png" width="240" height="120" alt=""></a><span><a href="#">南方周末</a></span></li>
									<li id="logo_014">
										<a href="http://www.xinhuanet.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_014c.png" width="240" height="120" alt=""></a><span><a href="#">新华网</a></span></li>
									<li id="logo_015">
										<a href="http://81.cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_015c.png" width="240" height="120" alt=""></a><span><a href="#">中国军网</a></span></li>
									<li class="four" id="logo_016">
										<a href="http://www.hexun.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_016c.png" width="240" height="120" alt=""></a><span><a href="#">和讯网</a></span></li>
								</ul>
							</dd>
							
							<dd style="display:none;">
								<!--购物淘宝-->
								<ul>
									<li class="one" id="logo_001">
										<a href="http://www.taobao.com/go/chn/tbk_channel/channelcode.php?pid=mm_33201743_3168968_10472364&eventid=101329
			"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_001a.png" width="240" height="120" alt="taobao"></a><span><a href="#">淘宝网</a></span></li>
									<li id="logo_002">
										<a href="http://www.360buy.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_002a.png" width="240" height="120" alt="京东商城"></a><span><a href="#">京东商城</a></span></li>
									<li id="logo_003">
										<a href="http://s.click.taobao.com/t_11?e=%2BtSC5ziSlQIKXTum23VHLUx2Mi9BvFxTCg7CN9kKD8HJdox0eUoImgi5Ng%3D%3D&p=mm_33201743_3168968_10540104
			"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_003a.png" width="240" height="120" alt=""></a><span><a href="#">凡客诚品</a></span></li>
									<li class="four" id="logo_004">
										<a href="http://www.yihaodian.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_004a.png" width="240" height="120" alt=""></a><span><a href="#">1号店</a></span></li>
									<li class="one" id="logo_005">
										<a href="http://www.amazon.cn/?_encoding=UTF8&camp=536&creative=3200&linkCode=ur2&tag=528888-23"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_005a.png" width="240" height="120" alt=""></a><span><a href="#">亚马逊</a></span></li>
									<li id="logo_006">
										<a href="http://www.newegg.com.cn/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_006a.png" width="240" height="120" alt=""></a><span><a href="#">新蛋商城</a></span></li>
									<li id="logo_007">
										<a href="http://m18.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_007a.png" width="240" height="120" alt=""></a><span><a href="#">麦考林</a></span></li>
									<li class="four" id="logo_008">
										<a href="http://union.dangdang.com/transfer.php?from=P-315673|ad_type=10&sys_id=1&backurl=http%3A%2F%2Fwww.dangdang.com%2F"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_008a.png" width="240" height="120" alt=""></a><span><a href="#">当当网</a></span></li>
									<li class="one" id="logo_009">
										<a href="http://suning.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_009a.png" width="240" height="120" alt=""></a><span><a href="#">苏宁易购</a></span></li>
									<li id="logo_010">
										<a href="http://xazwb.taobao.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_010a.png" width="240" height="120" alt=""></a><span><a href="#">亚森户外</a></span></li>
									<li id="logo_011">
										<a href="http://act.ju.taobao.com/go/chn/tbk_channel/jkwt.php?pid=mm_33201743_3168968_10472144&eventid=102405"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_011a.png" width="240" height="120" alt=""></a><span><a href="#">淘宝聚划算</a></span></li>
									<li class="four" id="logo_012">
										<a href="http://gome.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_012a.png" width="240" height="120" alt=""></a><span><a href="#">国美电器</a></span></li>
									<li class="one" id="logo_013a">
										<a href="http://www.meituan.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_013a.png" width="240" height="120" alt=""></a><span><a href="#">美团</a></span></li>
									<li id="logo_014a">
										<a href="http://s.click.taobao.com/t_11?e=%2BtSC5ziSlQIL8RMJ9xxFGJU4nnKDz4RcF28xF3%2BFriUzkoMHR4gQbNgd&p=mm_33201743_3168968_10561293
			"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_014a.png" width="240" height="120" alt=""></a><span><a href="#">库吧网（国美）</a></span></li>
									<li id="logo_015a">
										<a href="http://126.am/nSWjq3"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_015a.png" width="240" height="120" alt=""></a><span><a href="#">淘宝商城</a></span></li>
									<li class="four" id="logo_016">
										<a href="http://www.alipay.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_016a.png" width="240" height="120" alt=""></a><span><a href="#">支付宝</a></span></li>
								</ul>
							</dd>
							<dd style="display:none;">
								<!--游戏娱乐-->
								<ul>
									<li class="one" id="logo_001">
										<a href="http://www.4399.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_001d.png" width="240" height="120" alt="4399小游戏"></a><span><a href="#">4399小游戏</a></span></li>
									<li id="logo_002">
										<a href="http://www.cuttherope.ie/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_002d.png" width="240" height="120" alt="割绳子"></a><span><a href="#">割绳子网页版</a></span></li>
									<li id="logo_003">
										<a href="http://www.17173.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_003d.png" width="240" height="120" alt=""></a><span><a href="#">17173游戏</a></span></li>
									<li class="four" id="logo_004">
										<a href="http://www.bizhiyun.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_004d.png" width="240" height="120" alt=""></a><span><a href="#">壁纸云高清壁纸</a></span></li>
									<li class="one" id="logo_005">
										<a href="http://mole2.61.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_005d.png" width="240" height="120" alt=""></a><span><a href="#">摩尔庄园</a></span></li>
									<li id="logo_006">
										<a href="http://www.shandagames.com/web/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_006d.png" width="240" height="120" alt=""></a><span><a href="#">盛大游戏</a></span></li>
									<li id="logo_007">
										<a href="http://game.qq.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_007d.png" width="240" height="120" alt=""></a><span><a href="#">腾讯游戏</a></span></li>
									<li class="four" id="logo_008">
										<a href="http://nie.163.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_008d.png" width="240" height="120" alt=""></a><span><a href="#">网易游戏</a></span></li>
									<li class="one" id="logo_009">
										<a href="http://yinyuetai.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_009d.png" width="240" height="120" alt=""></a><span><a href="#">音悦台mtv</a></span></li>
									<li id="logo_010">
										<a href="http://www.huaban.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_010d.png" width="240" height="120" alt=""></a><span><a href="#">花瓣网</a></span></li>
									<li id="logo_011">
										<a href="http://www.vmovier.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_011d.png" width="240" height="120" alt=""></a><span><a href="#">V电影</a></span></li>
									<li class="four" id="logo_012">
										<a href="http://mtime.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_012d.png" width="240" height="120" alt=""></a><span><a href="#">时光网</a></span></li>
									<li class="one" id="logo_013">
										<a href="http://www.readnovel.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_013d.png" width="240" height="120" alt=""></a><span><a href="#">小说阅读网</a></span></li>
									<li id="logo_014">
										<a href="http://www.zongheng.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_014d.png" width="240" height="120" alt=""></a><span><a href="#">纵横中文网</a></span></li>
									<li id="logo_015">
										<a href="http://douban.fm/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_015d.png" width="240" height="120" alt=""></a><span><a href="#">豆瓣FM</a></span></li>
									<li class="four" id="logo_016">
										<a href="http://www.qidian.com/Default.aspx"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_016d.png" width="240" height="120" alt=""></a><span><a href="#">起点中文网</a></span></li>
								</ul>
							</dd>
							<dd style="display:none;">
								<!--实用工具-->
								<ul>
									<li class="one" id="logo_001">
										<a href="http://www.bizhiyun.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_004d.png" width="240" height="120" alt=""></a><span><a href="#">壁纸云高清壁纸</a></span></li>
									<li id="logo_002">
										<a href="http://www.115.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_002e.png" width="240" height="120" alt="115网盘"></a><span><a href="#">115网盘</a></span></li>
									<li id="logo_003">
										<a href="http://translate.google.com.hk/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_003e.png" width="240" height="120" alt=""></a><span><a href="">谷歌翻译</a></span></li>
									<li class="four" id="logo_004">
										<a href="http://flash.weather.com.cn/wmaps/index.swf?url1=http:%2F%2Fwww.weather.com.cn%2Fweather%2F&url2=.shtml&from=cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_001e.png" width="240" height="120" alt="天气预报"></a><span><a href="#">天气预报</a></span></li>
									<li class="one" id="logo_005">
										<a href="http://www.webps.cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_005e.png" width="240" height="120" alt=""></a><span><a href="#">Web Photoshop</a></span></li>
									<li id="logo_006">
										<a href="http://web.qq.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_006e.png" width="240" height="120" alt=""></a><span><a href="#">Web QQ</a></span></li>
									<li id="logo_007">
										<a href="http://mail.163.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_007e.png" width="240" height="120" alt=""></a><span><a href="#">网易邮箱</a></span></li>
									<li class="four" id="logo_008">
										<a href="http://www.10010.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_008e.png" width="240" height="120" alt=""></a><span><a href="#">中国联通网上营业厅</a></span></li>
									<li class="one" id="logo_009">
										<a href="http://www.12306.cn/mormhweb/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_009e.png" width="240" height="120" alt=""></a><span><a href="#">中国铁路客户服务中心</a></span></li>
									<li id="logo_010">
										<a href="http://map.baidu.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_010e.png" width="240" height="120" alt=""></a><span><a href="#">百度地图</a></span></li>
									<li id="logo_011">
										<a href="http://10086.cn/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_011e.png" width="240" height="120" alt=""></a><span><a href="#">中国移动网上营业厅</a></span></li>
									<li class="four" id="logo_012">
										<a href="http://www.189.cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_012e.png" width="240" height="120" alt=""></a><span><a href="#">中国电信网上营业厅</a></span></li>
									<li class="one" id="logo_013">
										<a href="http://www.360.cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_013e.png" width="240" height="120" alt=""></a><span><a href="#">360安全卫视</a></span></li>
									<li id="logo_014">
										<a href="http://www.8684.cn"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_014e.png" width="240" height="120" alt=""></a><span><a href="#">公交火车查询</a></span></li>
									<li id="logo_015">
										<a href="http://map.google.hk"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_015e.png" width="240" height="120" alt=""></a><span><a href="#">谷歌地图</a></span></li>
									<li class="four" id="logo_016">
										<a href="http://app.baidu.com/app/enter?appid=114629"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_016e.png" width="240" height="120" alt=""></a><span><a href="#">万年历</a></span></li>
								</ul>
							</dd>
							<dd style="display:none;">
								<!--影视资源-->
								<ul>
									<li class="one" id="logo_014a">
										<a href="http://www.bizhiyun.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_016f.png" width="240" height="120" alt=""></a><span><a href="#">壁纸云高清壁纸</a></span></li>
									<li id="logo_002">
										<a href="http://www.verycd.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_002f.png" width="240" height="120" alt="电驴"></a><span><a href="#">电驴资源</a></span></li>
									<li id="logo_003">
										<a href="http://ishare.iask.sina.com.cn/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_003f.png" width="240" height="120" alt=""></a><span><a href="#">新浪共享资料</a></span></li>
									<li class="four" id="logo_004">
										<a href="http://www.piaohua.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_004f.png" width="240" height="120" alt=""></a><span><a href="#">飘花资源网</a></span></li>
									<li class="one" id="logo_005">
										<a href="http://www.dy2018.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_005f.png" width="240" height="120" alt=""></a><span><a href="#">天堂电影</a></span></li>
									<li id="logo_006">
										<a href="http://daquan.xunlei.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_006f.png" width="240" height="120" alt=""></a><span><a href="#">迅雷大全</a></span></li>
									<li id="logo_007">
										<a href="http://dy131.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_007f.png" width="240" height="120" alt=""></a><span><a href="#">6V电影网</a></span></li>
									<li class="four" id="logo_008">
										<a href="http://ffdy.cc"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_008f.png" width="240" height="120" alt=""></a><span><a href="#">放放电影</a></span></li>
									<li class="one" id="logo_009">
										<a href="http://skycn.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_009f.png" width="240" height="120" alt=""></a><span><a href="#">天空下载</a></span></li>
									<li id="logo_010">
										<a href="http://www.newhua.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_010f.png" width="240" height="120" alt=""></a><span><a href="#">华军软件园</a></span></li>
									<li id="logo_011">
										<a href="http://www.xiazaiba.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_011f.png" width="240" height="120" alt=""></a><span><a href="#">下载吧</a></span></li>
									<li class="four" id="logo_012">
										<a href="http://7060.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_012f.png" width="240" height="120" alt=""></a><span><a href="#">7060手机电影</a></span></li>
									<li class="one" id="logo_013">
										<a href="http://www.a67.com"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_013f.png" width="240" height="120" alt=""></a><span>a67手机电影网</span></li>
									<li id="logo_014">
										<a href="http://www.y80s.net/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_014f.png" width="240" height="120" alt=""></a><span><a href="#">80s手机电影网</a></span></li>
									<li id="logo_015">
										<a href="http://www.txt99.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_015f.png" width="240" height="120" alt=""></a><span><a href="#">久久小说下载</a></span></li>
									<li class="four" id="logo_016">
										<a href="http://www.ziyuanhai.com/"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/logo_001f.png" width="240" height="120" alt="google"></a><span><a href="#">唐老虎</a></span></li>
								</ul>
							</dd>
						</dl>
			
					</div>
					<!--logo区结束-->
					<!--左右箭头开始-->
					<div class="prev"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/arr_left.png" width="31" height="67"></div>
					<div class="next"><img src="${pageContext.request.contextPath }/static/images/Pre/brand/arr_right.png" width="31" height="67"></div>
					<!--左右箭头结束-->
				</div>
			</div>
		</div>
        <!-- content end -->
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
			$(document).ready(function() {
				$("#metro_box").css("margin-top", "10px");
				//链接在新窗口打开
				$(".a_link dd a").attr("target", "_blank");
				$(".a_link ul li>a").hover(function() {
					var a_href = $(this).attr("href");
					$(this).siblings().find("a").attr("href", a_href);
				});
				
				$(".navClassify").css("border","1px solid grey");
				$(".navClassify:eq(0)").css("border","2px solid #F38844");
				$(".navClassify:eq(0)").css("border-right","none");
				$(".navClassify:eq(0)").css("background-color", "#EEEEEE");
				
				
				$(".navClassify").mouseover(function(e){
					$(".navClassify").css("border","1px solid grey");
					$(".navClassify").css("background-color", "white");
					$(this).css("border","2px solid #F38844");
					$(this).css("border-right","none");
					$(this).css("background-color", "#EEEEEE");
					var liList = $("#navCategoryList li");
					for(var i=0;i<liList.length;i++){
						if($(liList[i]).text() ==$(this).text()){
							var dd = $("#metro_box dl dd")[i];
							$(dd).siblings().css("display", "none");
							$(dd).css("display", "block");
						}
					}
				}).mouseout(function(e){
					//$(this).css("border","1px solid grey");
					//$(this).css("border-right","1px solid grey");
				})
			})
		</script>
    </body>
</html>
