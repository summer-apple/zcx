<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>register_store</title>
    
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/head.css">


	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/messages_zh.js"></script> 
	<script type="text/javascript" src="js/head.js"></script>
	
<style type="text/css">
input{outline:none;}
.container {
	min-width: 800px;
	min-height: 500px;
}
.container .store_form {
	width: 510px;
	height: 300px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 200px;
	padding-top: 0px;
	padding-right: 0px;
	padding-bottom: 0px;
	padding-left: 0px;
}
.store_form .store_name_warper {
	width: 400px;
	height: 100px;
	float: left;
}
.store_form .store_name_warper .store_name {
	width: 370px;
	height: 50px;
	display: block;
	line-height: 25px;
	font-size: 18px;
	text-indent: 15px;
	text-align: left;
	color: #666666;
	margin-right: 20px;
	border: 1px solid #999999;
	clear: both;
	margin-top: 0px;
}
.store_form .store_name_warper #store_name-error {
	width: 300px;
	height: 20px;
	margin-top: 15px;
	display: block;
	text-align: left;
	text-indent: 20px;
	font-size: 15px;
	color: #FF0000;
	clear: both;
}
.container .store_form .register_store_bt {
	width: 98px;
	height: 50px;
	background-color: #EC523F;
	margin-top: 0px;
	font-size: 16px;
	color: #FFFFFF;
	border-style: none;
	border-width: 0px;
}
.container .store_form .register_store_bt:hover {
	background-color: #FF0000;
}
</style>








    <script type="text/javascript">
    	$().ready(function(e) {
			
			var $store_name=$(".store_name").val();
			
			/* $(".store_name").blur(function(){
				alert($store_name);
			}); */
			
				$(".store_form").validate({
					
					rules:{
							store_name:{
									required:true,
									maxlength:10,
									remote:{
									        url: "CheckStoreNameServlet",
									        type: "post",
									        contentType: "application/x-www-form-urlencoded; charset=utf-8"
									      }
											
								}
						}
					
					});
			
	
			
			
			
        });
    </script>
	
	
</head>
<body>
<%@ include file="head.jsp" %>

<div class="container">
	<form class="store_form" action="AddStoreServlet" method="post">
    	<div class="store_name_warper">
    		<input type="text" class="store_name"  name="store_name" placeholder="商店名称">
         
        </div>
        	<input type="submit" class="register_store_bt" value="注册">
    </form>
</div>
 

</body>
</html>
   