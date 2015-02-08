<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>





<!DOCTYPE html>

<!--[if lt IE 7 ]><html class="ie ie6" lang="zh-CN"><![endif]-->

<!--[if IE 7 ]><html class="ie ie7" lang="zh-CN"><![endif]-->

<!--[if IE 8 ]><html class="ie ie8" lang="zh-CN"><![endif]-->

<!--[if (gte IE 9)|!(IE)]><html lang="zh-CN"><![endif]-->

<html lang="zh-CN">

<head>
<base href="<%=basePath%>">
<title>文章 | 灌木丛</title>



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
<script type='text/javascript'>
	jQuery().ready(function(){
		jQuery("#submit").click(function(){
			var jQueryarticleid = jQuery("#article_id_input").val();
			var jQuerycommentcontext = jQuery("#comment").val();
			
			jQuery.ajax({
				type:"post",
				url:"AddArticleCommentServlet",
				data:{article_id:jQueryarticleid,comment_context:jQuerycommentcontext}
			});
			location.reload();
			return false;
			
		});
	});
</script>
<!--[if lt IE 9]>

  <script src="t/ui/js/modernizr.js"></script>

  <script src="t/ui/js/respond.min.js"></script>

  <script src="t/ui/js/html5shiv.js"></script>

<![endif]-->

</head>

<body class="single single-post postid-36 single-format-standard logged-in">

  
<%@ include file="t_head.jsp" %>


<section id="zan-bodyer">
	<div class="container">
		<div class="row">
			<div class="col-md-8" id="mainstay">



<article class="zan-article">

	<!-- 面包屑 -->
	<div class="breadcrumb">
    	</div>
	<!-- 面包屑结束 -->

	<!-- 大型设备文章显示 -->
	<div class="hidden-xs">
		<h1><a href="#">${article.article_title }</a></h1>
		<p class="post-big-info">
      <span class="label label-zan"><i class="fa fa-calendar"></i>&nbsp;${article.article_time }</span>
			<span class="label label-zan"><i class="fa fa-tags"></i> <a href="#" rel="category">少年</a> <a href="http://localhost/wordpress/?cat=4" rel="category">村上春树</a></span>
			<span class="label label-zan"><i class="fa fa-user"></i> <a href="GetArticleByUserServlet?article_user=${article.article_user_id}" title="由${article.article_user_name }发布" rel="author">${article.article_user_name }</a></span>
			<span class="label label-zan"><i class="fa fa-eye"></i> </span>
			 <a class="post-edit-link" href="EditArticleServlet?article_id=${article.article_id }"><span class="label label-zan"><i class="fa fa-edit"></i> 编辑</a></span>		</p>
	</div>
	<!-- 大型设备文章显示结束 -->

	<!-- 小型设备文章显示 -->
	<div class="visible-xs">
		<div class="title-article">
			<h4><a href="GetArticleByIdServlet?article_id="${article.article_id }">${article.article_title }</a></h4>
		</div>
		<p class="post-info">
			<span><i class="fa fa-calendar"></i>&nbsp;${article.article_time }</span>
			<span><i class="fa fa-eye"></i> </span>
		</p>
	</div>
	<!-- 小型设备文章显示结束 -->

  <div class="zan-single-content">${article.article_context }</div>
  <div class="zan-share clearfix">

  

    <!-- 喜欢功能 -->
    <div class="post-like pull-left">
      <a class="btn btn-zan-line-pp favorite">
       	<i class="fa fa-heart"></i>
       	<span class="count">
          1      	</span>
      </a>
	 </div>
	 <!-- 喜欢功能结束 -->

  </div>

	

  <!-- 分页 -->
  <div class="zan-page">
    <ul class="pager">
      <li class="previous"></li>
      <li class="next"><a href="#" rel="next">下一篇 <i class="fa fa-angle-right"></i></a></li>
    </ul>
  </div>
  <!-- 分页结束 -->

</article>




			
					<div class="panel panel-zan hidden-xs">
				        <div class="panel-heading">评论列表</div>
				        <div class="panel-body">
				          <ul class="list-group">
				         <c:forEach items="${article.article_comment_list }" var="comment">
				             <li class="zan-list clearfix">
				             
				                <figure class="thumbnail zan-thumb">
				                  <img width="75" height="75" src="img/grey.gif" data-original="${comment.comment_user_head}" class="lazy attachment-75x75 wp-post-image"/><noscript><img width="75" height="75" src="${comment.comment_user_head}" class="attachment-75x75 wp-post-image" alt="IMG_0196" /></noscript>                
				                </figure>
				                
				                <div class="follow-mid row">
				                	<div class="col-md-8">
						                <a href="GoToFriendServlet?friend_id=$${comment.comment_user_id}">
						                 <h5>${comment.comment_user_name}</h5>
						                </a>
					                </div>
					                
					                <div class="sidebar-info col-md-3">
					                  <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-calendar"></i>&nbsp;${comment.comment_time}</span>
					                 
					                </div>
					                
					                 <div class="comment-context col-md-7">${comment.comment_context}</div>
					                 
					                
				                </div>
				                
				               
				              </li>
				           </c:forEach>             
				           </ul>
				        </div>
				      </div>
			








								
<c:if test="${!empty user }">				
<div id="comments-template">
  <div class="comments-wrap">
    	<div id="respond" class="comment-respond">
			<h3 id="reply-title" class="comment-reply-title"><i class="fa fa-pencil"></i> 欢迎留言 <small><a rel="nofollow" id="cancel-comment-reply-link" href="/wordpress/?p=36#respond" style="display:none;">取消回复</a></small></h3>
			<form action="#" method="post" id="commentform" class="comment-form">																										
					<textarea id="comment" placeholder="赶快发表你的见解吧！" name="comment_context" cols="45" rows="8" required></textarea>												
					<input id="article_id_input" type="text" name="article_id" value="${article.article_id}" hidden="true">
					<p class="form-submit">
						<input name="submit" type="submit" id="submit" value="发表评论" />
					
					</p>
		
			</form>
		</div><!-- #respond -->
				    
  </div>
</div>
</c:if>



<c:if test="${empty user }">				
<div id="comments-template">
  <div class="comments-wrap">
    	<div id="respond" class="comment-respond">
			<h3 id="reply-title" class="comment-reply-title"><i class="fa fa-pencil"></i> 欢迎留言 <small><a rel="nofollow" id="cancel-comment-reply-link" href="/wordpress/?p=36#respond" style="display:none;">取消回复</a></small></h3>
			<form action="#" method="post" id="commentform" class="comment-form">																										
					<textarea id="comment" placeholder="登陆后方可评论！" name="comment" cols="45" rows="8" aria-required="true"></textarea>												
					<p class="form-submit">
						<a href="login.jsp" class="btn btn-primary btn-lg btn-block">发表评论</a>
						<input type='hidden' name='comment_post_ID' value='36' id='comment_post_ID' />
						<input type='hidden' name='comment_parent' id='comment_parent' value='0' />
					</p>
					<input type="hidden" id="_wp_unfiltered_html_comment_disabled" name="_wp_unfiltered_html_comment_disabled" value="51a9c753a0" />
					<script>(function(){if(window===window.parent){document.getElementById('_wp_unfiltered_html_comment_disabled').name='_wp_unfiltered_html_comment';}})();</script>
			</form>
		</div><!-- #respond -->
				    
  </div>
</div>
</c:if>


<script type="text/javascript" language="javascript">
/* <![CDATA[ */
  var smiley  = jQuery( "#smilelink" );
      clone   = smiley.clone();
      comment = jQuery( "#comment" );

  smiley.remove();
  comment.before( smiley );

  function grin(tag) {
    var myField;
    tag = ' ' + tag + ' ';
      if ( document.getElementById( 'comment' ) && document.getElementById( 'comment' ).type == 'textarea' ) {
      myField = document.getElementById( 'comment' );
    } else {
      return false;
    }
    if (document.selection) {
      myField.focus();
      sel = document.selection.createRange();
      sel.text = tag;
      myField.focus();
    }
    else if ( myField.selectionStart || myField.selectionStart == '0' ) {
      var startPos = myField.selectionStart;
      var endPos = myField.selectionEnd;
      var cursorPos = endPos;
      myField.value = myField.value.substring(0, startPos)
              + tag
              + myField.value.substring( endPos, myField.value.length );
      cursorPos += tag.length;
      myField.focus();
      myField.selectionStart = cursorPos;
      myField.selectionEnd = cursorPos;
    }
    else {
      myField.value += tag;
      myField.focus();
    }
  }
/* ]]> */
</script>								
			</div>
			

<%@ include file="t_sidebar.jsp" %>		
	</div>
	</div>
</section>


<%@ include file="t_foot.jsp" %>

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