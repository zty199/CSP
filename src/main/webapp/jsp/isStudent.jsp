<%@ page language="java" import="java.util.*, javax.swing.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.Student, cn.edu.njust.dao.StudentDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String identity = session.getAttribute("identity").toString();
if(!identity.equals("0")) {
	JOptionPane.showMessageDialog(null, "请以学生身份登录！");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>
