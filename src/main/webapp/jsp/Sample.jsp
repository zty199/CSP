<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><!-- 这一行注意啊，每次新建页面都要改编码格式，或者用这个样例另存为新页面（注释看完记得最后删掉） -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Sample.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"><!-- 注意这行，记得加上，页面编码格式 -->
	
	<!--
	<link rel="stylesheet" type="text/css" href="/CSP/css/xxxxxx.css">
	这部分是css样式引用，需要的话把注释符号去掉写在这里，注意相对路径填写方式
	-->

  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
