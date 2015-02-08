<%@page import="com.zcx.service.CartService,com.zcx.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="org.json.simple.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'a.jsp' starting page</title>
    
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	

  </head>
  
  <body>
<%
List<CartStore> cart=(List<CartStore>)request.getSession().getAttribute("cart");
for(int i=0;i<cart.size();i++){
out.print(cart.get(i).getCart_goods_list().get(0).getCart_goods_count()+"<br>");
}
 %>
  </body>
</html>
