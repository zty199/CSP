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
    
    <title>My JSP 'importStudent.jsp' starting page</title>
    
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
	    <form action="servlet/ExcelOneServlet" method="post" >
	    	<select name = "grade">
	    		<option value="" selected="selected">[选择年级]</option>
	    		<option value="2015">2015级</option>
	    		<option value="2016">2016级</option>
	    		<option value="2017">2017级</option>
	    		<option value="2018">2018级</option>
	    		<option value="2019">2019级</option>
	    		<option value="2020">2020级</option>
	    		<option value="2021">2021级</option>
	    		<option value="2022">2022级</option>
	    		<option value="2023">2023级</option>
	    		<option value="2024">2024级</option>
	    		<option value="2025">2025级</option>
	    		<option value="2026">2026级</option>
	    		<option value="2027">2027级</option>
	    		<option value="2028">2028级</option>
	    		<option value="2029">2029级</option>
	    		<option value="2030">2030级</option>
	    		<option value="2031">2031级</option>
	    		<option value="2032">2032级</option>
	    		<option value="2033">2033级</option>
	    		<option value="2034">2034级</option>
	    		<option value="2035">2035级</option>
	    		<option value="2036">2036级</option>
	    		<option value="2037">2037级</option>
	    		<option value="2038">2038级</option>
	    		<option value="2039">2039级</option>
	    		<option value="2040">2040级</option>
	    		<option value="2041">2041级</option>
	    		<option value="2042">2042级</option>
	    		<option value="2043">2043级</option>
	    		<option value="2044">2044级</option>
	    		<option value="2045">2045级</option>
	    		<option value="2046">2046级</option>
	    		<option value="2047">2047级</option>
	    		<option value="2048">2048级</option>
	    		<option value="2049">2049级</option>
	    	</select>
	    	<input type = "file" name = "studentExcel" accept="*.xls,*.xlsx">
	    	<!-- &nbsp;&nbsp;请选择文件路径上传学生信息表</br> -->
	    	<input type = "submit" name = "submitOne" value = "提交">
	    </form>
    </center>
  </body>
</html>