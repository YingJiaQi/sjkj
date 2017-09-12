<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!-------------------------------------------------------- HEADER ---------------------------------------------------------->
<jsp:include page="../../common/pre_header.jsp"/>
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
