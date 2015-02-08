<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>众彩行</title>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="css/head.css">
    <link rel="stylesheet" href="css/store.css">
   
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
 
	<script type="text/javascript" src="js/head.js" charset="utf-8"></script>

  </head>
  
  <body>
  <%@ include file="head.jsp" %>
      <main>
	    <ul class="goods_list">
	    	<c:forEach items="${goodslist}" var="goods">
	    	<li class="goods_item">
	        	<a href="GetGoodsByIdServlet?goods_id=${goods.goods_id}">
	            	<img class="goods_head" src="${goods.goods_head}">
	            </a>
	            <span class="goods-name goods_item_span">${goods.goods_name}</span>
                
	        </li>
	        </c:forEach>
	    </ul>
    </main>
    
  </body>
</html>
