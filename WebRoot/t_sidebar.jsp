<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<aside class="col-md-4" id="sidebar">
	<c:if test="${!empty user }">
        <aside id="zan_login-3">        
        	<div class="panel panel-zan">
      			<div class="panel-heading">Hello Yo</div>
     			<div class="login-panel text-center">
          			<img alt='' src='${user.user_head }' class='avatar avatar-60 photo' height='60' width='60' />          
          			<a class="user-name" href="#">${user.user_name}</a>
          			<a class="btn btn-zan-solid-pw" href="LogoutServlet" title="退出登录">退出登录</a>
      			</div>
    		</div>
        </aside>
     </c:if>   
        
     <c:if test="${empty user }">   
        <aside id="zan_login-3">        
        	<div class="panel panel-zan">
			      <div class="panel-heading">请登录</div>
			      <form class="login-form clearfix" action="LoginServlet" method="post">
			        <div class="form-group">
			          <div class="input-group">
			            <div class="input-group-addon"><i class="fa fa-user"></i></div>
			            <input class="form-control" type="text" name="user_name" id="log" value="" size="20" />
			          </div>
			        </div>
			        <div class="form-group">
			          <div class="input-group">
			            <div class="input-group-addon"><i class="fa fa-lock"></i></div>
			            <input class="form-control" type="password" name="user_pass" id="pwd" size="20" />
			          </div>
			        </div>
			        <button class="btn btn-zan-solid-ip pull-left" type="submit" name="submit">登录</button>
			        <a href="register.jsp" class="btn btn-zan-solid-ip pull-right">注册</a>
			      </form>
			    </div>
        </aside>
      </c:if>  
        
     <c:if test="${!empty user}">	   
        <aside id="zan_operate-3">      
        	<div class="panel panel-zan">
        		<div class="panel-heading">做点什么</div>
        		<div class="zan_operate_warpper">
        			<button class="btn btn-zan-solid-pw" id="write" title="写文章">书 写</button>
        			<a class="btn btn-zan-solid-pw" href="GetArticleByUserServlet?article_user=${user.user_id }" title="看文章">阅 读</a>
        			<a class="btn btn-zan-solid-pw" href="GetUserByFollowServlet?self_id=${user.user_id}" title="朋友们">朋 友</a>
        			<a class="btn btn-zan-solid-pw" href="index.jsp" title="逛商城">商 城</a>
        			
        			
        		</div>
        	</div>
    	</aside>
    </c:if>
    
    
    <c:if test="${empty user}">	   
        <aside id="zan_operate-3">      
        	<div class="panel panel-zan">
        		<div class="panel-heading">做点什么</div>
        		<div class="zan_operate_warpper">
        			<button class="btn btn-zan-solid-pw" title="写文章">书 写</button>
        			<a class="btn btn-zan-solid-pw" href="GetArticleListServlet" title="看文章">阅 读</a>
        			<a class="btn btn-zan-solid-pw" href="GetUserListServlet" title="朋友们">朋 友</a>
        			<a class="btn btn-zan-solid-pw" href="index.jsp" title="逛商城">商 城</a>
        			
        			
        		</div>
        	</div>
    	</aside>
    </c:if>
    
    	
        
        <aside id="zan_search-3">      
        	<form method="post" id="searchform" class="form-inline clearfix" action="SearchArticleServlet">
        		<input class="form-control" type="text" name="key_word" id="key_word" placeholder="搜索文章..." />
        		<button class="btn btn-zan-solid-pi btn-small" type="submit"><i class="fa fa-search"></i> 查找</button>
      	 	</form>
    	</aside>
    
    
    
    
    <aside id="zan_posts_category-3">      
    	<div class="panel panel-zan hidden-xs">
	        <div class="panel-heading">文章分类</div>
	        <div class="list-group zan-category">
	          	<a href="GetArticleByTypeServlet?article_type=Diary" >日 记</a><br />
				<a href="GetArticleByTypeServlet?article_type=Idea" >创 意</a><br />
				<a href="GetArticleByTypeServlet?article_type=List" >清 单</a><br />
				<a href="GetArticleByTypeServlet?article_type=Remember" >记 录</a><br />
				<a href="GetArticleByTypeServlet?article_type=Travel" >旅 行</a><br />
				<a href="GetArticleByTypeServlet?article_type=Reading" >阅 读</a><br />
	        </div>
      	</div>
    </aside>
    
    
    
    
    <aside id="zan_latest_comments-3">      <div class="panel panel-zan hidden-xs">
        <div class="panel-heading">最新评论</div>
        <div class="panel-body">
          <ul class="list-group">
                          <li class="zan-list clearfix">
                <div class="sidebar-avatar">
                  <img alt='' src='img/head/3.jpg' class='avatar avatar-75 photo' height='75' width='75' />                </div>
                 <h6>
                  发表于：<a href="http://localhost/wordpress/?p=36">恰到好处,活着就好</a>
                 </h6>
                <div class="sidebar-comment">
                  <a href="http://localhost/wordpress/?p=36#comment-3">
                    asdfsafasdf                  </a>
                </div>
              </li>
                          <li class="zan-list clearfix">
                <div class="sidebar-avatar">
                  <img alt='' src='img/head/3.jpg' class='avatar avatar-75 photo' height='75' width='75' />                </div>
                 <h6>
                  发表于：<a href="http://localhost/wordpress/?p=36">恰到好处,活着就好</a>
                 </h6>
                <div class="sidebar-comment">
                  <a href="http://localhost/wordpress/?p=36#comment-2">
                    lalallalala                  </a>
                </div>
              </li>
                      </ul>
        </div>
      </div>
</aside>




<aside id="zan_hotest_posts-3">      <div class="panel panel-zan hidden-xs">
        <div class="panel-heading">最热文章</div>
        <div class="panel-body">
          <ul class="list-group">
                          <li class="zan-list clearfix">
                <figure class="thumbnail zan-thumb">
                  <img width="75" height="75" src="img/grey.gif" data-original="uploads/2014/12/IMG_0196-75x75.jpg" class="lazy attachment-75x75 wp-post-image" alt="IMG_0196" /><noscript><img width="75" height="75" src="uploads/2014/12/IMG_0196-75x75.jpg" class="attachment-75x75 wp-post-image" alt="IMG_0196" /></noscript>                </figure>
                <a href="http://localhost/wordpress/?p=36">
                 <h5>恰到好处,活着就好</h5>
                </a>
                <div class="sidebar-info">
                  <span><i class="fa fa-calendar"></i> 12月23日, 2014</span>
                  <span><i class="fa fa-comment"></i> <a href="http://localhost/wordpress/?p=36#comments">2</a></span>
                </div>
              </li>
                          <li class="zan-list clearfix">
                <figure class="thumbnail zan-thumb">
                  <img width="75" height="75" src="img/grey.gif" data-original="uploads/2014/12/12794478242267-75x75.jpg" class="lazy attachment-75x75 wp-post-image" alt="12794478242267" /><noscript><img width="75" height="75" src="uploads/2014/12/12794478242267-75x75.jpg" class="attachment-75x75 wp-post-image" alt="12794478242267" /></noscript>                </figure>
                <a href="http://localhost/wordpress/?p=40">
                 <h5>任何人的归宿都是自己</h5>
                </a>
                <div class="sidebar-info">
                  <span><i class="fa fa-calendar"></i> 12月23日, 2014</span>
                  <span><i class="fa fa-comment"></i> <a href="http://localhost/wordpress/?p=40#comments">0</a></span>
                </div>
              </li>
                      </ul>
        </div>
      </div>
    </aside>
    
    
    </aside>