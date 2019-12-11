<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.Student, cn.edu.njust.dao.StudentDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Student student = new Student();
student = (Student) session.getAttribute("user");
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
        <tr><td colspan="7">
          姓名：<%=student.getStuName()%>&nbsp;&nbsp;学号：<%=student.getStuID()%>&nbsp;&nbsp;年级：<%=student.getStuGrade()%>&nbsp;&nbsp;
          <button type="button" onclick="window.location.href='/CSP/jsp/logout.jsp';">注销</button>&nbsp;&nbsp;
          <button type="button" onclick="window.location.href='/CSP/jsp/studentModify.jsp';">修改信息</button>
        </td></tr>
        <tr><td>CSP</td><td>总分</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td></tr>
        <tr><td colspan="7">
        团报资格&nbsp;&nbsp;公共：<%=student.getPubFree()%>&nbsp;&nbsp;分数：<%=student.getScoreNum()%>
        </td></tr>
        <tr><td colspan="7">
          <button type="button" onclick="">进行团报</button>
        </td></tr>
      </table>
    </center>
  </body>
</html>
