<%@ page language="java" import="java.util.*,com.zcx.bean.*,com.zcx.service.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>order</title>
    
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/head.css">
	<link rel="stylesheet" href="css/order.css" type="text/css">
	
	
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/head.js"></script>
	
	
	<script type="text/javascript">
		$().ready(function(){
			
	
		
			
		});
	</script>
	
  </head>
<body>
<%@ include file="head.jsp" %>
    
	<br>
	<br>
	
<div class="container">
	<div class="row">
    	<div class="col-md-8 col-md-offset-2">
        	
        	
       	
        	<table class="table table-bordered">
				<tr class="info title_line">
                	<td>${order.order_store_name }</td>
                    <td>订单编号：${order.order_id}</td>
                    <td>${order.order_time}</td>
                    <td>${order.order_state}</td>
                </tr>
                <tr class="info title_line">
                	<td>${order.order_user_name}</td>
                    <td colspan="2">${order.order_address_context}</td>
                     <td class="order_operate">
                    	<c:if test="${user.user_store==order.order_store_id}">
							<c:if test="${order.order_state=='wait_confirm'}"><a href="OrderOperateServlet?order_id=${order.order_id}&order_state=${order.order_state}">确认订单</a></c:if>
							<c:if test="${order.order_state=='paid'}"><a href="OrderOperateServlet?order_id=${order.order_id}&order_state=${order.order_state}">确认发货</a></c:if>
							<c:if test="${order.order_state=='confirmed'}">等待支付</c:if>
							<c:if test="${order.order_state=='outed'}">等待收货</c:if>
							<c:if test="${order.order_state=='accepted'}">订单完成</c:if>
						</c:if>
						
						<c:if test="${user.user_store!=order.order_store_id}">
							<c:if test="${order.order_state=='confirmed'}"><a href="OrderOperateServlet?order_id=${order.order_id}&order_state=${order.order_state}">支付订单</a></c:if>
							<c:if test="${order.order_state=='outed'}"><a href="OrderOperateServlet?order_id=${order.order_id}&order_state=${order.order_state}">确认收货</a></c:if>
							<c:if test="${order.order_state=='wait_confirm'}">等待确认</c:if>
							<c:if test="${order.order_state=='paid'}">等待发货</c:if>
							<c:if test="${order.order_state=='accepted'}">订单完成</c:if>
						</c:if>
                    </td>
                </tr>
               
                <tr class="title_line">
                	<td>商品图片</td>
                    <td>商品名称</td>
                    <td>商品价格</td>
                    <td>商品数量</td>
                    
                   
                </tr>
           
                <tr>
                	<td>
                    	<img src="${orderGoods.goods_head}" style="width:75px">
                    </td>
                    <td>${orderGoods.goods_name}</td>
                    <td>${orderGoods.goods_price}</td>
                    <td>${orderGoods.order_goods_count}</td>
                    
                </tr>
			
                <tr>
                	<td colspan="4">总价：${order.order_amount}</td>
                </tr>
				

                
			</table>
			<br>
			<br>
	
        </div>
    </div>
</div>


</body>
</html>
