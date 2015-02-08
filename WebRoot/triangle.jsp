<%@ page language="java" import="java.util.*,org.springframework.web.context.*,com.zcx.bean.Article,org.springframework.web.context.support.*,com.zcx.service.*" pageEncoding="UTF-8"%>
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
<script type='text/javascript' src='js/jquery-1.11.1.min.js'></script>
<script type='text/javascript' src='js/jquery-migrate.min.js'></script>
<!--[if lt IE 9]>

  <script src="js/modernizr.js"></script>

  <script src="js/respond.min.js"></script>

  <script src="js/html5shiv.js"></script>

<![endif]-->

</head>
<c:if test="${empty articlelist }">
	<%
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		ArticleService as = (ArticleService)wac.getBean("articleService");
		
		List<Article> articlelist = as.getRandomArticle();
		request.getSession().setAttribute("articlelist", articlelist);
	%>
</c:if>
<body class="home page page-id-8 page-template-default logged-in">

	<%@ include file="t_head.jsp"%>
	
	<section id="zan-bodyer">
		<div class="container">
			<div class="row">
				<%@ include file="t_articles.jsp"%>
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