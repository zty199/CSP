<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.*, cn.edu.njust.dao.*"%>
<jsp:include page="isAdmin.jsp"></jsp:include>
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
    
    <title>My JSP 'managerOpen.jsp' starting page</title>
    
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
  <%
  if(admin.getAdminGrade().equals("0000")) {
  %>
  	<center>
	    <form action="servlet/OpenServlet" method="post">
	    	<input type = "submit" name = "open" value = "开启团报报名">
	    </form>
	    <form action="servlet/CloseServlet" method="post">
	    	<input type = "submit" name = "close" value ="关闭团报入口">
	    </form>
	    <form action="servlet/CalculateServlet" method="post">
	    	请输入筛选分数线：<input type = "text" name = "score">
	    	<input type = "submit" name = "calculate" value ="计算">
	    </form>
    </center>
    <button type="button" onclick="window.location.href='/CSP/jsp/managerMain.jsp';">返回</button>
  <%
  } else {
  %>
    <center>
      <a href="jsp/login.jsp">您并无权限开启or关闭团报,请点此返回登录</a>
    </center>
  <%
  }
  %>
  </body>
</html>