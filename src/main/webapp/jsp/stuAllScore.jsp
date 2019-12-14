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
    
    <title>My JSP 'managerMain.jsp' starting page</title>
    
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
	  	<%
	  	ScoreDao dao=new ScoreDao();
	  	String stuID = request.getParameter("stuID"); 
	  	List<Score> list = dao.getAllScore(stuID);
	  	%>
	  	<form action="jsp/studentDisplay.jsp"method="post">
	  		<table>
	  			<tr>
		  			<td>学号</td>
		  			<td>姓名</td>
		  			<td>CSP</td>
		  			<td>总分</td>
		  			<td>Score_1</td>
		  			<td>Score_2</td>
		  			<td>Score_3</td>
		  			<td>Score_4</td>
		  			<td>Score_5</td>
		  			<td>本次排名</td>
		  			<td>总排名</td>
	  			</tr>
	  			<%
	  				for(int i=0; i<list.size(); i++) {
	  					Score sc = list.get(i);	
	  				
	  			%>
	  			<tr>
	  				<td><%=sc.getStuID() %></a></td>
	  				<td><%=sc.getStuName() %></td>
	  				<td><%=sc.getSession() %></td>
	  				<td><%=sc.getTotal_score() %></a></td>
	  				<td><%=sc.getScore_1() %></td>
	  				<td><%=sc.getScore_2() %></td>
	  				<td><%=sc.getScore_3() %></a></td>
	  				<td><%=sc.getScore_4() %></td>
	  				<td><%=sc.getScore_5() %></td>
	  				<td><%=sc.getCur_rank() %></td>
	  				<td><%=sc.getAll_rank() %></td>
	  			</tr>
	  			<%} %>
	  		</table>
	  	</form>
	  </center>
	  <button type="button" onclick="window.location.href='/CSP/jsp/managerMain.jsp';">返回</button>
  </body>
</html>