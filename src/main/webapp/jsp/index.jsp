<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my JSP page. <br>
    <a href="/CSP/jsp/login.jsp">登录测试</a><br>
    所有项目的jsp页面都在webapp/jsp文件夹下，外面那个index.jsp是项目的起始页，只起到跳转作用。<br>
    jsp文件夹下预留了一个Sample.jsp，后面的页面可以用这个为底板做，有些备注写在里面了，务必看一下。<br>
    webapp下预留了css样式、字体、js脚本文件夹，有需要的记得分类摆放。Sample中有引用css文件夹中样式的引用方法（使用相对路径）<br>
    <a href="/CSP/jsp/Sample.jsp?text=中文测试">中文测试</a><br>
  </body>
</html>
