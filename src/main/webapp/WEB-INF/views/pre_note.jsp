<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!-------------------------------------------------------- HEADER ---------------------------------------------------------->
<jsp:include page="../../common/pre_header.jsp"/>
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
               		<div class="col-sm-6"  id="note_content_first"></div>
               		<div class="col-sm-6">
               			<div  class="row"  id="note_content_sec" >
               			</div>
               			<div  class="row"   id="note_content_thr">
               			</div>
               		</div>
               </div>
               <div class="row" id="note_content_besideOneRow"></div>
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
<script src="${pageContext.request.contextPath }/static/js/webPagination.js"></script><!-- 分页插件 -->
<script src="${pageContext.request.contextPath }/static/js/pages/pre/pre_note.js"></script><!-- 日记JS -->
<script src="${pageContext.request.contextPath }/static/bootstrap/bootstrap.js"></script>
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