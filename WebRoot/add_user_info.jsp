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
<title>add_user_info</title>
    
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="css/head.css">
    <link rel="stylesheet" href="css/add_user_info.css" type="text/css">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script> 
    <script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/messages_zh.js"></script> 
    <script type="text/javascript" src="js/geo.js"></script> 
	<script type="text/javascript" src="js/head.js"></script>
    <script type="text/javascript">
    	$().ready(function(e) {
	
	
			$('.form_date').datetimepicker({//date picker
				format: 'yyyy-mm-dd',
				language:  'zh-CN',
				weekStart: 1,
				todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 4,
				startDate:'1900-01-01',
				minView: 2,
				forceParse: 0
			});
	
			   
		   function promptinfo(){ //address
			
			var address = document.getElementById('address'); 
			
			var s1 = document.getElementById('s1'); 
			
			var s2 = document.getElementById('s2'); 
			
			var s3 = document.getElementById('s3'); 
			
			address.value = s1.value + s2.value + s3.value; 
			
			} 
			
			$(".user_info_form").validate({
				
				rules:{
						user_ture_name:{
								required:true,
								maxlength:10
							},
						user_sex:{
								required:true
							},
						user_phone:{
								required:true,
								digits:true,
								minlength:11,
								maxlength:11
							},
						user_id_card_no:{
								required:true,
								minlength:18,
								maxlength:18
						},
						address_detial:{
								required:true
						},
						user_head:{
							required:true
						}
					}
				
				});
			
			
        });
    </script>
	
	
  </head>
<body onload="setup();preselect('浙江省');promptinfo();">
<%@ include file="head.jsp" %>



<br>
<div class="container">
	<div class="row">
		
		<div class="col-md-4">
			<img class="head_img" src="${user_head_url}">
		</div>
    	
    
    	<div class="col-md-8">
    <c:if test="${!empty user.user_true_name }">
    	<form role="form" action="UpdateUserInfoServlet" method="post" class="user_info_form"><br>
        	<div class="input-group col-md-3">
            	<input class="user_ture_name form-control" name="user_true_name" type="text" placeholder="姓 名" value="${user.user_true_name }">
            </div><br>
            <div class="input-group col-md-3">
        		 <select class="user_sex form-control" name="user_sex" value="${user.user_sex }">
                <option value="男">男</option>
                <option value="女">女</option> 
                </select>
            </div><br>
            
            <div class="input-group col-md-3">
            	<input class="user_phone form-control" name="user_phone" type="text" placeholder="手 机" value="${user.user_phone }">
            </div><br>
            
            <div class="input-group col-md-3">
            	<input class="user_id_card_no form-control" name="user_id_card_no" type="text" placeholder="身份证号" value="${user.user_id_card_no }">
            </div><br>
            
            <div class="input-group date form_date col-md-3">
                    <input class="form-control" size="16" type="text" value="${user.user_birth }" readonly title="生日" name="user_birth">
                   
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
            </div><br>	
           
			<div class="input-group col-md-3">
                <select class="address_province select form-control" name="address_province" id="s1">
                <option></option>             
                </select>  
            </div><br>
            
            <div class="input-group col-md-3">
                <select class="address_city select form-control" name="address_city" id="s2">
                <option></option> 
                </select>
            </div> <br>
            
            <div class="input-group col-md-3">
                <select class="address_district select form-control" name="address_district" id="s3">
                <option></option> 
                </select>
            </div><br>  
            
             <div class="input-group col-md-3">
                <textarea class="address_detial form-control" name="address_detial"  placeholder="详细地址"></textarea>
            </div><br>

            		<input type="text" name="user_head" value="${user_head_url}" hidden="true">
            <div class="input-group col-md-3">
                    <input class="form-control" type="submit" value="提 交">
            </div><br>

        </form>
    </c:if>   



<c:if test="${empty user.user_true_name }">
    	<form role="form" action="UpdateUserInfoServlet" method="post" class="user_info_form"><br>
        	<div class="input-group col-md-3">
            	<input class="user_ture_name form-control" name="user_true_name" type="text" placeholder="姓 名">
            </div><br>
            <div class="input-group col-md-3">
        		 <select class="user_sex form-control" name="user_sex">
                <option value="男">男</option>
                <option value="女">女</option> 
                </select>
            </div><br>
            
            <div class="input-group col-md-3">
            	<input class="user_phone form-control" name="user_phone" type="text" placeholder="手 机">
            </div><br>
            
            <div class="input-group col-md-3">
            	<input class="user_id_card_no form-control" name="user_id_card_no" type="text" placeholder="身份证号">
            </div><br>
            
            <div class="input-group date form_date col-md-3">
                    <input class="form-control" size="16" type="text" value="1990-01-01" readonly title="生日" name="user_birth">
                   
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
            </div><br>	
           
			<div class="input-group col-md-3">
                <select class="address_province select form-control" name="address_province" id="s1">
                <option></option>             
                </select>  
            </div><br>
            
            <div class="input-group col-md-3">
                <select class="address_city select form-control" name="address_city" id="s2">
                <option></option> 
                </select>
            </div> <br>
            
            <div class="input-group col-md-3">
                <select class="address_district select form-control" name="address_district" id="s3">
                <option></option> 
                </select>
            </div><br>  
            
             <div class="input-group col-md-3">
                <textarea class="address_detial form-control" name="address_detial"  placeholder="详细地址"></textarea>
            </div><br>

            		<input type="text" name="user_head" value="${user_head_url}" hidden="true">
            <div class="input-group date col-md-3">
                    <input class="form-control" type="submit" value="提 交">
            </div><br>

        </form>
    </c:if>
        
        </div>
    </div>
</div>
 

</body>
</html>
