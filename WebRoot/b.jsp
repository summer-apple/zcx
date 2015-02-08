<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'b.jsp' starting page</title>
    
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	

  </head>
  
  <body>
     <form action="GetUserListServlet" method="post">
    	<input type="text" name="key">
    	<input type="submit" value="Search">
    </form>
  </body>
</html>
