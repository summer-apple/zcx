<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
<style type="text/css">
body div {
	margin-left: auto;
	margin-right: auto;
	width: 500px;
	text-align: center;
	height: 50px;
	margin-top: 300px;
	color: #000000;
	font-size: 35px;
}
</style>
</head>

<body>
 <%
   		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    	long from = df.parse("2014-5-25").getTime();
    	String now = df.format(new Date());
    	long to = df.parse(now).getTime();
    	int howlong = (int) ((to - from) / (1000 * 60 * 60 * 24));
   
   
    %>
<div>It's been <%=howlong %> days.</div>
</body>
</html>

