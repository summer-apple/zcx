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
	<link href="css/store_order.css" rel="stylesheet" type="text/css">
	
	
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/head.js"></script>
	<script type="text/javascript">
		$().ready(function(){
		
		$(".order_operate span").click(function(){
			
			$("table,header").addClass("blur");
			
			var $tip = $(".tip");
			var top = ($(window).height() - $tip.height())/2;  
        	var left = ($(window).width() - $tip.width())/2;  
       		var scrollTop = $(document).scrollTop();   
        	var scrollLeft = $(document).scrollLeft();   
			
        	$tip.css( { position : 'absolute', 'top' : top + scrollTop, left : left + scrollLeft } );
			
			$tip.fadeIn(750);
			
			var $order_id=$(this).parents("table").find(".order_id").html();
			var $order_state=$(this).parents("table").find(".order_state").html();
			
			$.ajax({
				type:"post",
				url:"OrderOperateServlet",
				data:{order_id:$order_id,order_state:$order_state}
			});
			
			
			
			
			});
		
		$(".tip_confirm").click(function(){
			var $tip = $(".tip");
			$tip.fadeOut(500);
			$("table,header").removeClass("blur");
			location.href="GetOrderByStore";
		});
			
			
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
        	
        	
       <c:forEach items="${order_list }" var="order"> 	
        	<table class="table table-bordered">
				<tr class="info title_line">
                	<td>${order.order_store_name }</td>
                    <td>订单编号：<span class="order_id">${order.order_id}</span></td>
                    <td>${order.order_time}</td>
                    <td>状态:<span class="order_state">${order.order_state}</span></td>
                </tr>
                <tr class="info title_line">
                	<td>${order.order_user_name}</td>
                    <td colspan="2">${order.order_address_context}</td>
                     <td class="order_operate">
                    	
							<c:if test="${order.order_state=='待确认'}"><span><button>确认订单</button></span></c:if>
							<c:if test="${order.order_state=='已付款'}"><span><button>确认发货</button></span></c:if>
							<c:if test="${order.order_state=='已确认'}">等待支付</c:if>
							<c:if test="${order.order_state=='已发货'}">等待收货</c:if>
							<c:if test="${order.order_state=='已收货'}">订单完成</c:if>
                    </td>
                </tr>
               
                <tr class="title_line">
                	<td>商品图片</td>
                    <td>商品名称</td>
                    <td>商品价格</td>
                    <td>商品数量</td>
                    
                   
                </tr>
            <c:forEach items="${order.order_goods_list}" var="orderGoods">   
                <tr>
                	<td>
                    	<img src="${orderGoods.goods_head}" style="width:75px">
                    </td>
                    <td>${orderGoods.goods_name}</td>
                    <td>${orderGoods.goods_price}</td>
                    <td>${orderGoods.order_goods_count}</td>
                    
                </tr>
			</c:forEach>	
                <tr>
                	<td colspan="4">总价：${order.order_amount}</td>
                </tr>
				

                
			</table>
			<br>
			<br>
	</c:forEach>
        </div>
    </div>
</div>
<div class="tip">
        	<span class="tip_goods_name">修改成功</span>
            <br>
            <span class="add_success">点击确定刷新购物车</span>
       	  <a href="GetOrderByStoreServlet" class="tip_confirm">确 定</a>
 </div>
</body>
</html>
