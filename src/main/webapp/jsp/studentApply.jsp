<%@ page language="java" import="java.util.*, javax.swing.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.*, cn.edu.njust.dao.*"%>
<jsp:include page="isStudent.jsp"></jsp:include>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Student student = new Student();
student = (Student) session.getAttribute("user");
if(session.getAttribute("open") == null || (int)session.getAttribute("open") == 0) {
	JOptionPane.showMessageDialog(null, "尚未开启报名途径！");
%>
<jsp:forward page="studentMain.jsp"></jsp:forward> 
<% 
} 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'studentMain.jsp' starting page</title>
    
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
      <table>
        <tr><td colspan="5">
          姓名：<%=student.getStuName()%>&nbsp;&nbsp;学号：<%=student.getStuID()%>&nbsp;&nbsp;年级：<%=student.getStuGrade()%>&nbsp;&nbsp;
          <button type="button" onclick="window.location.href='/CSP/jsp/logout.jsp';">注销</button>&nbsp;&nbsp;
          <!-- <button type="button" onclick="window.location.href='/CSP/jsp/studentModify.jsp?identity=0';">修改信息</button> -->
        </td></tr>
        <tr><td>序号</td><td>姓名</td><td>学号</td><td>资格</td><td>状态</td></tr>
        <tr><td colspan="5">
          <button type="button" onclick="">团报报名</button>
        </td></tr>
      </table>
    </center>
  </body>
</html>
