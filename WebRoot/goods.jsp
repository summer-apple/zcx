<%@ page language="java" import="java.util.*,com.zcx.bean.*,com.zcx.service.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>goods</title>
   
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/head.css">
    <link rel="stylesheet" href="css/store.css">
    <link rel="stylesheet" href="css/goods.css">
     
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/head.js"></script>
	<script type="text/javascript" src="js/goods.js"></script>
  </head>
  
  <body>
  <%@ include file="head.jsp" %>
  <main><span class="goods_name"> ${goods.goods_name}</span>
  <div class="goods_option">
    	<ul class="">
        	<li class="goods_option_item goods_option_active">图 片</li>
            <li class="goods_option_item">详 情</li>
            <li class="goods_option_item">评 价</li>
        </ul>
    </div>
    <div class="goods_content">
        <div class="img_box">	
              <img class="goods_main_img" src="${goods.goods_head}">
        </div>
        <div class="buy_box">
           <div class="buy_item goods_describe"> ${goods.goods_describe}</div>
           <div class="buy_item goods_price">￥<span> ${goods.goods_price}</span></div>
            
            
          <c:if test="${!empty user}"> 
           <div class="buy_item cart_box">
                   <input type="number" class="goods_max_count" hidden="true" value="99">
                    <input type="number" class="cart_user" name="cart_user" hidden="true" value="${user.user_id}">
                    <input type="number" class="goods_id" name="goods_id" hidden="true" value="${goods.goods_id}">
                     <input type="number" class="goods_count" hidden="true" value="${goods.goods_count}">
                    <input type="number" class="goods_store" name="goods_store" hidden="true" value="${goods.goods_store}">
                    <input type="number" class="goods_count_input number_view" name="cart_goods_count" value="1">
                  	<c:if test="${user.user_address==0}">
                    	<a href="upload_user_head.jsp" class="add_to_cart_bt">加入购物车</a>
                    </c:if>
                    <c:if test="${user.user_address!=0}">
                    	<input type="button" class="add_to_cart_bt" value="加入购物车">
                    </c:if>
           </div>
           
           <div class="buy_item buy_now">
           		<c:if test="${user.user_address==0}">
                    <a href="upload_user_head.jsp" class="buy_now_bt">立即购买</a>
                </c:if>
                <c:if test="${user.user_address!=0}">
                   <input type="button" class="buy_now_bt" value="立即购买">
                </c:if>
           		
           </div>
           </c:if>
           
           
           
           
           
           
           
           
           <c:if test="${empty user}"> 
          <div class="buy_item cart_box">
          	
                    <input type="number" class="goods_count_input number_view" name="cart_goods_count" value="1">
                    <input type="button" class="add_to_cart_bt_nouser" value="加入购物车">
           </div>
           
           <div class="buy_item buy_now">
           			<a href="login.jsp" class="buy_now_bt">立即购买</a>
           </div>
           </c:if>
           
           
           
        </div>
        </div>
        
         
</main>
    <div class="tip">
        	<span class="tip_goods_name">${goods.goods_name}</span>
            <br>
            <span class="add_success">已加入
            	<a href="UpdateCartServlet?user_id=${user.user_id}"">购物车</a>
            </span>
       	   <input type="button" class="tip_confirm" value="确 定">
       	  <!-- <a href="UpdateCartServlet?user_id=${user.user_id}" class="tip_confirm">确 定</a> -->
        </div>
    

  </body>
</html>
