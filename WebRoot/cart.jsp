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
    
    <title>cart</title>
    
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/head.css">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/head.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
	<link href="css/cart.css" rel="stylesheet" type="text/css">
	
  </head>
  
  <body>
    
<%@ include file="head.jsp" %>
    
	<br>
	<br>
    
<main>    
    <div class="container">
	<div class="row">
    	<div class="col-md-8 col-md-offset-2">
    	 <c:forEach items="${cart}" var="cartStore">
        	<table class="table table-bordered">
				<tr class="info title_line">
                	<td colspan="5">
                		<a href="GetStoreByIdServlet?store_id=${cartStore.cart_store_id }">${cartStore.cart_store_name }</a></td>
                    
                </tr>
            
                <tr class="title_line">
                	<td>商品图片</td>
                    <td>商品名称</td>
                    <td>商品价格</td>
                    <td>商品数量</td>
                    <td>商品操作</td>
                </tr>
                  <c:forEach items="${cartStore.cart_goods_list}" var="cartGoods">  
                <tr>
                	<td>
                		<a href="GetGoodsByIdServlet?goods_id=${cartGoods.goods_id}">
                    		<img src="${cartGoods.goods_head}" style="width:75px">
                    	</a>
                    </td>
                    <td>
                    	<a href="GetGoodsByIdServlet?goods_id=${cartGoods.goods_id}">${cartGoods.goods_name}</a></td>
                    <td>${cartGoods.goods_price}</td>
           
                     <td class="td_count">
                    	<div class="count_warpper">
                    		<span class="minus_plus minus glyphicon glyphicon-minus-sign"></span>
                   	 		<input class="cart_goods_count" name="cart_goods_count" value="${cartGoods.cart_goods_count}">
                            <input class="cart_user" name="cart_user" value="${cartGoods.cart_user}" hidden="true">
                            <input class="goods_id" name="goods_id" value="${cartGoods.goods_id}" hidden="true">
                            <input class="goods_store" name="goods_store" value="${cartGoods.store_id}" hidden="true">
                    		<span class="minus_plus plus glyphicon glyphicon-plus-sign"></span>
                        </div>
                  </td>
                    <td>
                    	<input type="submit" class="modify" value="修改">
                    	<input type="submit" class="delete" value="删除">
                    </td>
                </tr>
			</c:forEach>
			</table>
			</c:forEach>
			
			
			<table class="table table-bordered">
				<tr class="title_line">
					<td>总 价：</td>
                	<td>${cart_amount}</td>
                	<td>
						<a href="CreateOrderServlet">结 算</a>
					</td>        
                </tr>
               
			</table>
        </div>
    </div>
</div>
 <div class="tip">
        	<span class="tip_goods_name">修改成功</span>
            <br>
            <span class="add_success">点击确定刷新购物车</span>
       	  <a href="UpdateCartServlet?user_id=${user.user_id }" class="tip_confirm">确 定</a>
 </div>
</main>
  </body>
</html>
