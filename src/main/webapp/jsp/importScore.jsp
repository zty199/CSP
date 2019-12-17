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
    
    <title>My JSP 'importScore.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	 accept="*.xls,*.xlsx"
	-->

  </head>
  <script type="text/javascript">
    function check_upload(theform) {
		var filename = document.getElementById("filename").value;
		if(filename == "" ||filename == null || filename.indexOf(".xls")==-1) {
		alert('只能上传.xls文件');
		return false;
		}
	}
  </script>
  <body>
  <%
  if(admin.getAdminGrade().equals("0000")) { 
  %>
  	<center>
	    <form action="servlet/ExcelTwoServlet" enctype="multipart/form-data" method="post" οnsubmit="return check_upload(this)" >
	    	<select name = "csp">
	    		<option value="" selected="selected">[选择CSP]</option>
	    		<!--<option value="CSP-16">CSP-16</option>
	    		<option value="CSP-17">CSP-17</option>
	    		<option value="CSP-18">CSP-18</option>-->
	    		<option value="CSP-19">CSP-19</option>
	    		<option value="CSP-20">CSP-20</option>
	    		<option value="CSP-21">CSP-21</option>
	    		<option value="CSP-22">CSP-22</option>
	    		<option value="CSP-23">CSP-23</option>
	    		<option value="CSP-24">CSP-24</option>
	    		<!--<option value="CSP-25">CSP-25</option>
	    		<option value="CSP-26">CSP-26</option>
	    		<option value="CSP-27">CSP-27</option>
	    		<option value="CSP-28">CSP-28</option>
	    		<option value="CSP-29">CSP-29</option>
	    		<option value="CSP-30">CSP-30</option>
	    		<option value="CSP-31">CSP-31</option>
	    		<option value="CSP-32">CSP-32</option>
	    		<option value="CSP-33">CSP-33</option>
	    		<option value="CSP-34">CSP-34</option>
	    		<option value="CSP-35">CSP-35</option>
	    		<option value="CSP-36">CSP-36</option>
	    		<option value="CSP-37">CSP-37</option>
	    		<option value="CSP-38">CSP-38</option>
	    		<option value="CSP-39">CSP-39</option>
	    		<option value="CSP-40">CSP-40</option>
	    		<option value="CSP-41">CSP-41</option>
	    		<option value="CSP-42">CSP-42</option>
	    		<option value="CSP-43">CSP-43</option>
	    		<option value="CSP-44">CSP-44</option>
	    		<option value="CSP-45">CSP-45</option>-->
	    	</select>
	    	<input type = "file" id="filename" name = "scoreExcel"><br>
	    	<!-- &nbsp;&nbsp;请选择文件路径上传学生信息表</br> -->
	    	<input type="submit" value="提交">
	    </form>
    </center>
  <%
  } else {
  %> 
    <center><a href="jsp/login.jsp">您并无此权限,请点此返回登录</a></center> 
  <%
  }
  %>
    <button type="button" onclick="window.location.href='/CSP/jsp/managerMain.jsp';">返回</button>
  </body>
</html>