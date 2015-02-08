<%@page import="javax.security.auth.login.LoginContext"%>
<%@ page language="java" import="java.util.*,com.zcx.bean.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>



<!DOCTYPE html>

<!--[if lt IE 7 ]><html class="ie ie6" lang="zh-CN"><![endif]-->

<!--[if IE 7 ]><html class="ie ie7" lang="zh-CN"><![endif]-->

<!--[if IE 8 ]><html class="ie ie8" lang="zh-CN"><![endif]-->

<!--[if (gte IE 9)|!(IE)]><html lang="zh-CN"><![endif]-->

<html lang="zh-CN">

<head>
<base href="<%=basePath%>">
<title>灌木丛 - 是谁来自山川湖海却囿于昼夜，厨房与爱。</title>



<meta name="keywords" content="" />

<meta name="description" content="" />

<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<link rel="icon" type="image/x-icon" href="t/favicon.ico">

<link rel="alternate" type="application/rss+xml" title="灌木丛 &raquo; 未名评论Feed" href="http://localhost/wordpress/?feed=rss2&#038;page_id=8" />
<link rel='stylesheet' id='open-sans-css' href='//fonts.useso.com/css?family=Open+Sans%3A300italic%2C400italic%2C600italic%2C300%2C400%2C600&#038;ver=4.0.1' type='text/css' media='all' />
<link rel='stylesheet' id='bootstrap-css' href='bootstrap/css/bootstrap.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='fontawesome-css' href='css/font-awesome.css' type='text/css' media='all' />
<link rel='stylesheet' id='flexslider-css' href='css/flexslider.css' type='text/css' media='all' />
<link rel='stylesheet' id='zan-css' href='css/zan.css' type='text/css' media='all' />
<link rel='stylesheet' id='custom-css' href='css/custom.css' type='text/css' media='all' />
<script type='text/javascript' src='js/jquery-1.11.1.min.js'></script>
<script type='text/javascript' src='js/jquery-migrate.min.js'></script>
<script type="text/javascript">
	jQuery().ready(function(){
	
	
		var a={};
		
		a.follow = function(){
			
			var jQueryfollowid = jQuery(this).next(".follow-id").val();
			//alert(jQueryfollowid);
			jQuery.ajax({
				type:"POST",
				url:"FollowServlet",
				data:{follow_id:jQueryfollowid}
				});
			jQuery(this).unbind({click:a.follow}).bind({click:a.disfollow});
			jQuery(this).val("取 消");
			
			};
			
		a.disfollow = function(){
			
			var jQueryfollowid = jQuery(this).next(".follow-id").val();
			//alert(jQueryfollowid);
			jQuery.ajax({
				type:"POST",
				url:"DisFollowServlet",
				data:{follow_id:jQueryfollowid}
				});
			jQuery(this).unbind({click:a.disfollow}).bind({click:a.follow});
			jQuery(this).val("关 注");
			
			};	
			
			
	
		jQuery(".follow").bind({click:a.follow});
		jQuery(".disfollow").bind({click:a.disfollow});
	
	
	/* 
		 var a={};
		
		a.follow = function(){
			
			var jQueryfollowid = jQuery(this).next(".follow-id").val();
			alert(jQueryfollowid);
			jQuery.ajax({
				type:"POST",
				url:"FollowServlet",
				data:{follow_id:jQueryfollowid}
				});
			jQuery(this).unbind({click:a.follow}).bind({click:a.disfollow});
			jQuery(this).val("取 消");
			
			}
			
		a.disfollow = function(){
			var jQueryfollowid = jQuery(this).next(".follow-id").val();
			alert(jQueryfollowid);
			jQuery.ajax({
				type:"POST",
				url:"DisFollowServlet",
				data:{follow_id:jQueryfollowid}
				});
			jQuery(this).unbind({click:a.disfollow}).bind({click:a.follow});
			jQuery(this).val("关 注");
			}
		
		if(jQuery(".follow-bt").val()=="关 注"){
			jQuery(this).bind({click:a.follow});
			}else{
				jQuery(this).bind({click:a.disfollow});
				} 
		 */
	});
</script>
<style type="text/css">
.follow-form{
	/* background-color:#C96C6D; */
	float:right;
}
input:focus{
	outline:none;
}
</style>
<!--[if lt IE 9]>

  <script src="js/modernizr.js"></script>

  <script src="js/respond.min.js"></script>

  <script src="js/html5shiv.js"></script>

<![endif]-->

</head>

<body class="home page page-id-8 page-template-default logged-in">

	<%@ include file="t_head.jsp"%>
	
	<section id="zan-bodyer">
		<div class="container">
			<div class="row">
				<div class="col-md-8" id="mainstay">
        			
        			
        			
        			<div class="panel panel-zan hidden-xs">
				        <div class="panel-heading">用户列表</div>
				        <div class="panel-body">
				          <ul class="list-group">
				          <c:forEach items="${userlist}" var="user">
				             <li class="zan-list clearfix">
				             
				                <figure class="thumbnail zan-thumb">
				                  <img width="75" height="75" src="img/grey.gif" data-original="${user.user_head}" class="lazy attachment-75x75 wp-post-image" alt="${user.user_name}" /><noscript><img width="75" height="75" src="${user.user_head}" class="attachment-75x75 wp-post-image" alt="IMG_0196" /></noscript>                
				                </figure>
				                
				                <div class="follow-mid row">
				                	<div class="col-md-8">
						                <a href="GoToFriendServlet?friend_id=${user.user_id}">
						                 <h5>${user.user_name}</h5>
						                </a>
					                </div>
					                
					                <div class="sidebar-info col-md-8">
					                  <span><i class="fa fa-calendar"></i>&nbsp;${user.user_birth}</span>
					                  <span><i class="fa fa-male"></i>&nbsp;${user.user_sex}</span>
					                </div>
					                
					                 <div class="follow-form col-md-2">
						               <form>
						               		
						               		
					                		<c:if test="${!empty sessionScope.user}">
					                			<c:if test="${user.is_follow == 'yes'}"><input type="button" class="btn btn-primary btn-sm btn-block follow-bt disfollow" value="取 消"></c:if>
					                			<c:if test="${user.is_follow == 'no'}"><input type="button" class="btn btn-primary btn-sm btn-block follow-bt follow" value="关 注"></c:if>
					                		</c:if>
					                		
					                		<c:if test="${empty sessionScope.user}">
					                			<a href="login.jsp" class="btn btn-primary btn-sm btn-block">关 注</a>
					                		</c:if>
					                		
					                		<input type="number" name="follow-id" class="follow-id" value="${user.user_id}" hidden="ture">
					                		
						              	</form>
					                		
						            </div>
					                
				                </div>
				                
				               
				              </li>
				           </c:forEach>             
				           </ul>
				        </div>
				      </div>
        			
        			
        			
        			
        			
        			
			        <!-- 面包屑 -->
			        <div class="breadcrumb" id="zan-breadcrumb"></div>
			        <!-- 面包屑结束 -->
		        </div>
        
				<%@ include file="t_sidebar.jsp"%>
			</div>
		</div>
	</section>


	<%@ include file="t_foot.jsp"%>

	<div id="zan-gotop">
		<div class="gotop visible-lg">
			<i class="fa fa-chevron-up"></i>
		</div>
	</div>

	<script type='text/javascript' src='bootstrap/js/bootstrap.min.js'></script>
	<script type='text/javascript' src='js/jquery.flexslider.js'></script>
	<script type='text/javascript' src='js/jquery.validate.min.js'></script>
	<script type='text/javascript' src='js/audio.min.js'></script>
	<script type='text/javascript' src='js/shine.min.js'></script>
	<script type='text/javascript' src='js/jquery.lazyload.min.js'></script>
	<script type='text/javascript' src='js/zan.js'></script>
	<script type='text/javascript' src='js/custom.js'></script>
</body>
</html>