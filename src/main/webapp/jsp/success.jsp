<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.Admin, cn.edu.njust.dao.*"%>
<<jsp:include page="isAdmin.jsp"></jsp:include>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Admin admin = new Admin();
admin = (Admin) session.getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta http-equiv="refresh" content="5;URL=http://localhost/CSP/jsp/managerMain.jsp">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
    <p>5秒后返回管理员主页面
    <center>上传<%=session.getAttribute("message") %></center>
  </body>
</html>