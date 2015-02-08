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
    <link rel="stylesheet" href="css/head.css">
    <link href="css/add_goods.css" rel="stylesheet" type="text/css">
    
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/messages_zh.js"></script>
    <script type="text/javascript" src="js/head.js"></script> 
	<script type="text/javascript">
	</script>

  </head>
  
  <body>
	<%@ include file="head.jsp" %>	

 
   
   
   
   
   <div class="container">
   	
	<div class="row">
    	<div class="col-md-5">
        	<img class="head_img" src="${goods_head_url}"><br>
        </div>
        <div class="col-md-6">
    	<form role="form" action="AddGoodsServlet" method="post" class="user_info_form"><br>
        	<div class="input-group col-md-3">
                <input class="goods_name form-control"type="text" name="goods_name" placeholder="商品名称">
            </div><br>
            <div class="input-group col-md-3">
          	 	<input class="goods_price form-control" type="text" name="goods_price" placeholder="价 格">
            </div><br>
            
            <div class="input-group date col-md-3">
            		<input class="goods_count form-control" type="number" name="goods_count" placeholder="数 量">
            </div><br>
            
            <div class="input-group col-md-3">
            	<select class="goods_sale form-control" name="goods_onsale">
                    <option value="onsale">立即销售</option>
                    <option value="not_onsale">放入仓库</option>
                </select>
            </div><br>
            	
           
			<div class="input-group col-md-3">
                <select  class="goods_type form-control" name="goods_type">
                    <c:forEach items="${typelist}" var="type">
                        <option value="${type.goods_type_id}">${type.goods_type_name}</option>
                    </c:forEach>
 				</select> 
            </div><br>
            
            <div class="input-group col-md-3">
                <select class="goods_area form-control" name="goods_area">
                    <option value="1">1号库位</option>
                    <option value="2">2号库位</option>
                    <option value="3">3号库位</option>
                    <option value="4">4号库位</option>
                </select>
            </div> <br>
            
             <div class="input-group col-md-3">
                <textarea class="goods_describe form-control" name="goods_describe"  placeholder="商品描述"></textarea>
            </div><br>

            <input type="text" name="goods_head" class="goods_head" value="${goods_head_url}" hidden="true">
            <div class="input-group date col-md-3">
                    <input class="form-control" type="submit" value="提 交">
            </div><br>

            
        </form>
        </div>
    </div>
</div>
   
   
   
  </body>
</html>
