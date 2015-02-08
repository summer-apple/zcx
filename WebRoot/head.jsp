<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<header>
    	<a href="index.jsp"><img class="logo" src="img/logo_red.png"></a>
        
        <div class="store_name"><a href="GetGoodsByStoreServlet?goods_store=${store.store_id}">${store.store_name}</a></div>
        <div class="nav">
        	<ul>
            	<li class="nav_item"><a class="item_active" href="#">店首</a></li>
                <li class="nav_item"><a href="GetGoodsByStoreServlet?goods_store=${store.store_id	}">新品</a></li>
                <li class="nav_item"><a href="#">分类</a></li>
                <li class="nav_item"><a href="#">独白</a></li>
                <li class="nav_item search">
                	<form action="SearchServlet" method="post">
                        <input type="search" name="search_key" placeholder="商家、商品">
						<input type="submit" hidden="true">
                    </form>
                </li>
                
                <c:if test="${empty user}">
               	 <li class="nav_item">
               	 	<a href="login.jsp" class="a_last">
               	 		<img class="user_head img-circle" src="img/head/default.png" title="点击登录">
               	 	</a>
               	 </li>
               	</c:if><!--if user exist-->
               	
               	
               	
               	
               	<c:if test="${!empty user}">
               	 <li class="nav_item">
               	 	<a class="a_last">
               	 		<img class="user_head img-circle" src="${user.user_head}" title="${user.user_name}">
               		</a>
               	</li>
              
                <ul class="user_opreation">
                	<li class="operation_item"><a href="#">收藏夹</a></li>
                    <li class="operation_item cart">
                    	<a href="GetCartByUserServlet?user_id=${user.user_id}">购物车</a>
                    </li>
                    	
                    <li class="operation_item"><a href="GetOrderByUserServlet">订&nbsp;&nbsp;&nbsp;单</a></li>
                    <c:if test="${user.user_store>0}">
                    	 <li class="operation_item"><a href="GetOrderByStoreServlet">出售订单</a></li>
                    	 <li class="operation_item"><a href="upload_goods_head.jsp">添加商品</a></li>
                    	 <li class="operation_item"><a href="GetGoodsByStoreServlet?goods_store=${store.store_id}">本店商品</a></li>
                    </c:if>
                    <c:if test="${user.user_store==0}">
                    	 <li class="operation_item"><a href="register_store.jsp">注册商店</a></li>
                    </c:if>
                    
                    
                    
                    
                    	<li class="operation_item"><a href="add_user_info.jsp">资&nbsp;&nbsp;&nbsp;料</a></li>
                   
                    <li class="operation_item"><a href="LogoutServlet">退&nbsp;&nbsp;&nbsp;出</a></li>
                </ul>
                </c:if><!--if user exist-->
            </ul>
        </div>
    </header>