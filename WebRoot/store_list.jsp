<%@ page language="java" import="java.util.*,com.zcx.bean.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    
    <c:forEach items="storelist" var="store">
    <p>
    	${store.store_id}
    	${store.store_name}
    	${store.store_owner}
    </p>
    </c:forEach>
    
    
    

  </body>
</html>
