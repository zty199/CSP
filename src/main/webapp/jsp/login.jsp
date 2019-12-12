<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String preUrl = request.getHeader("referer");
//session.setAttribute("preUrl", preUrl);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
    <center>
    <form action="servlet/LoginServlet" method="post">
      <table>
        <tr><td colspan="2"><center>用户登录</center></td></tr>
        <tr><td>学号或工号</td><td><input type="text" name="userid" placeholder="请输入账号"></td></tr>
        <tr><td>密码</td><td><input type="password" name="password" placeholder="请输入密码"></td></tr>
        <tr><td colspan="2"><center>
		  <input type="radio" name="identity" value="0" checked onclick="show();">学生&nbsp;&nbsp;
          <input type="radio" name="identity" value="1" onclick="hidd();">管理员
        </center></td></tr>
        <tr><td colspan="2"><center>
          <button type="submit">登录</button>
          <button type="button" onclick="javascript:history.back(-1);">返回</button>
        </center></td></tr>
      </table>
    </form>
    </center>
  </body>
</html>
