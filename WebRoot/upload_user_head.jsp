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
	<style type="text/css">
	.head_img {
	width: 400px;
	height: 400px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
	background-color: #C0C0C0;
}
    .container {
	text-align: center;
}

.file {
	width: 400px;
	height: 20px;
	display: none;
	margin-left: auto;
	margin-right: auto;
	margin-top: 10px;
}
.up_bt {
	width: 400px;
	height: 50px;
	display: block;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
	background-color: #EC513F;
	color: #FFFFFF;
	font-size: 15px;
}
.up_bt:hover {
	background-color: #FF0000;
}

    </style>
    <link rel="stylesheet" href="css/head.css">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/head.js" charset="utf-8"></script>
	<script type="text/javascript">
	$().ready(function(){
		$(".file").hide();
		
		$(".choose_img").click(function(){
		
			$(".file").click();
		
		});
		$(".file").change(function(){

			var objUrl = getObjectURL(this.files[0]) ;
			console.log("objUrl = "+objUrl) ;
			if (objUrl) {
				$(".head_img").attr("src", objUrl) ;
			}
		}) ;
		//建立一個可存取到該file的url
		function getObjectURL(file) {
			var url = null ; 
			if (window.createObjectURL!=undefined) { // basic
				url = window.createObjectURL(file) ;
			} else if (window.URL!=undefined) { // mozilla(firefox)
				url = window.URL.createObjectURL(file) ;
			} else if (window.webkitURL!=undefined) { // webkit or chrome
				url = window.webkitURL.createObjectURL(file) ;
			}
			return url ;
		}
		});
	</script>

  </head>
  
  <body>
  <%@ include file="head.jsp" %>	
  	<div class="container">
		<img src="" class="head_img" alt="上传用户头像,如果未更改请刷新"><br>
		
		
		
		
	  <form action="UploadUserHeadServlet" enctype="multipart/form-data" method="post">
      	<input type="file" name="file" class="file" hidden="true">
	    <input type="button" class="choose_img up_bt" value="选择图片">
		
		<input type="submit" class="upload_bt up_bt" value="上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;传"> 
	  </form>
    </div>
</body>
</html>
