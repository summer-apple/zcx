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
    
    <title>update_user</title>
   
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/head.css">
    <link href="css/update_user.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/head.js"></script>
	
  </head>
  
  <body>
  <%@ include file="head.jsp" %>
  <br><br>
  <div class="container">
  	<div class="row">
    	<div class="col-dm-10">
        	touxiang
        </div>
    </div>
    <div class="row">
    	<div class="col-dm-8">
             <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                    </div>
                </div>
             </form>
         </div>
     </div>
  </div>
  </body>
</html>
