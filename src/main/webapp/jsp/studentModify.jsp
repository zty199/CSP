<%@ page language="java" import="java.util.*, javax.swing.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.*, cn.edu.njust.dao.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Student student = new Student();
if(session.getAttribute("identity") == null) {
	JOptionPane.showMessageDialog(null, "请先登录！");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
int identity = (int) session.getAttribute("identity");
if(identity == 0) {
	student = (Student) session.getAttribute("user");
}
if(identity == 1) {
	String stuID = request.getParameter("stuID");
	StudentDao dao = new StudentDao();
	student = dao.getInfo(stuID);
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'studentModify.jsp' starting page</title>
    
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
    <form action="servlet/StudentModifyServlet?stuID=<%=student.getStuID()%>" method="post">
      <table>
        <tr><td colspan="2">修改学生信息</td></tr>
        <tr>
          <td>学号</td>
          <td><input type="text" name="id" value="<%=student.getStuID()%>" onfocus="this.blur()"></td>
        </tr>
        <tr>
          <td>年级</td>
          <%
          if(identity == 0) {
          %>
          <td><input type="text" name="grade" value="<%=student.getStuGrade()%>" onfocus="this.blur()"></td>
          <%
          } else {
          %>
          <td><input type="text" name="grade" value="<%=student.getStuGrade()%>" placeholder="请输入年级"></td>
          <%
          }
          %>
        </tr>
        <tr><td>姓名</td><td><input type="text" name="name" value="<%=student.getStuName()%>" placeholder="请输入姓名"></td></tr>
        <tr><td>身份证号</td><td><input type="text" name="pid" value="<%=student.getStuPersonID()%>" placeholder="请输入身份证号/护照号"></td></tr>
        <tr><td>登录密码</td><td><input type="password" name="pwd" value="<%=student.getStuPassword()%>" placeholder="请输入新密码"></td></tr>
        <tr><td>确认密码</td><td><input type="password" name="cpwd" value="<%=student.getStuPassword()%>" placeholder="请确认密码"></td></tr>
        <tr><td colspan="2">
          <button type="submit">修改</button>
          <button type="button" onclick="window.location.reload();">重置</button>
          <%
          if(identity == 0) {
          %>
          <button type="button" onclick="window.location='/CSP/jsp/studentMain.jsp';">返回</button>
          <%
          } else {
          %>
          <button type="button" onclick="window.location='/CSP/jsp/managerMain.jsp';">返回</button>
          <%
          }
          %>
        </td></tr>
      </table>
    </form>
    </center>
  </body>
</html>
