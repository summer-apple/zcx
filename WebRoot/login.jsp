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
    
    <title>Login</title>
    <link href="css/general.css" rel="stylesheet" type="text/css">
	<link href="css/login.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$(".user_name").focus(function(){
			var $logStatus = "用户名或密码错误！";
			var $nameInput = $(".user_name");
			
			if($nameInput.val()==$logStatus){
				$nameInput.val("");
			}
		});
		
	});	
		
		
    </script>

  </head>
  
  <body>

    
<!--     ${regStatus} -->
<!--     ${logStatus} -->
<!--     ${un} -->
<!--     ${up} -->

   
   
   <div class="login_box">
		<label class="company_name">众彩行</label>
	<form class="login_form" action="LoginServlet" method="post">
		<input type="text" class="user_name log_input" name="user_name" placeholder="用户名" value="<c:if test="${!empty logStatus}">${logStatus}</c:if>">
		<input type="password" class="user_pass log_input" name="user_pass" placeholder="密&nbsp;&nbsp;&nbsp;码">
		<input type="submit" class="login_bt" value="登&nbsp;&nbsp;&nbsp;录">
	</form>

	<div class="fog_reg">
    	<a href="forget.html">忘&nbsp;&nbsp;记</a>
        <a href="register.jsp">注&nbsp;&nbsp;册</a>
 	</div> 
</div>
   
     </body>
</html>
