<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<div class="col-md-8" id="mainstay">
        
        <!-- 面包屑 -->
        <div class="breadcrumb" id="zan-breadcrumb">
                  </div>
        <!-- 面包屑结束 -->

        <!-- 内容主体 -->
        <div id="article-list">
       
  
		  	<c:forEach items="${articlelist}" var="article">
		 <article class="zan-post clearfix">
			<!-- 大型设备文章显示 -->
			<section class="visible-md visible-lg">
		    <div class="category-cloud"><a href="#" rel="category">少年</a> <a href="#" rel="category">村上春树</a></div>
				<h3>
					<a href="GetArticleByIdServlet?article_id=${article.article_id }">${article.article_title }</a>
				</h3>
				<hr>
		                  <div class="row">
		          <div class="col-md-5">
		            <figure class="thumbnail zan-thumb"><a href="GetArticleByIdServlet?article_id=${article.article_id }"><img width="240" height="240" src="img/grey.gif" data-original="${article.article_head }" class="lazy attachment-medium wp-post-image" alt="${article.article_title }" /><noscript><img width="240" height="240" src="${article.article_head }" class="attachment-medium wp-post-image" alt="12794478242267" /></noscript></a></figure>  
		          </div>            
		          <div class="col-md-7 visible-lg zan-outline">${article.article_context }</div>
		        </div>
		       
		        <hr>
				<div class="pull-right post-info">
					<span><i class="fa fa-calendar"></i>${article.article_time }</span>
					<span><i class="fa fa-user"></i> <a href="GetArticleByUserServlet?article_id=${article.article_user_id }" title="${article.article_user_name }" rel="author">${article.article_user_name }</a></span>
					<span><i class="fa fa-eye"></i> </span>
		      		<span><i class="fa fa-comment"></i> <a href="#">0</a></span>
		       		<c:if test="${article.article_user_id==user.user_id }"><a class="post-edit-link" href="EditArticleServlet?article_id=${article.article_id }"><span><i class="fa fa-edit"></i> 编辑</a></span></c:if>		
		       </div>
			</section>
		
			<!-- 大型设备文章显示结束 -->
		
			<!-- 小型设备文章显示 -->
			<section class="visible-xs  visible-sm">
				<div class="title-article">
					<h4><a href="GetArticleByIdServlet?article_id=${article.article_id }">任何人的归宿都是自己</a></h4>
				</div>
				<p class="post-info">
					<span><i class="fa fa-calendar"></i> 12月23日, 2014</span>
					<span><i class="fa fa-eye"></i> </span>
				</p>
				<div class="content-article">
			      <figure class="thumbnail">
			      	<a href="GetArticleByIdServlet?article_id=${article.article_id }"><img width="450" height="450" src="img/grey.gif" data-original="${article.article_head }" class="lazy attachment-large wp-post-image" alt="${article.article_title }" /><noscript><img width="450" height="450" src="${article.article_head }" class="attachment-large wp-post-image" alt="12794478242267" /></noscript></a>
			      </figure>		
					<div class="well">${article.article_context }</div>
				</div>
				<a class="btn btn-zan-line-pp btn-block" href="GetArticleByIdServlet?article_id=${article.article_id }"  title="详细阅读 任何人的归宿都是自己">阅读全文</a>
			</section>
			
			<!-- 小型设备文章显示结束 -->
		</article>	
			</c:forEach>
                                          

</div>
        <!-- 内容主体结束 -->

        <!-- 分页 -->
        <div id="zan-page" class="clearfix">
	<ul class="pagination pagination-zan pull-right">
	  <li></li><li></li>	</ul>
</div>
        <!-- 分页结束 -->

      </div>