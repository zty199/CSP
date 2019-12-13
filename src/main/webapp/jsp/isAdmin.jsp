<%@ page language="java" import="java.util.*, javax.swing.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.*, cn.edu.njust.dao.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(session.getAttribute("identity") == null) {
	JOptionPane.showMessageDialog(null, "请先登录！");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
int identity = (int) session.getAttribute("identity");
if(identity != 1) {
	JOptionPane.showMessageDialog(null, "请以管理员身份登录！");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>
