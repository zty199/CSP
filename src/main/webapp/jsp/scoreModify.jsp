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
    
    <title>My JSP 'scoreModify.jsp' starting page</title>
    
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
	String stuID = request.getParameter("stuID");
	int s = Integer.parseInt(request.getParameter("session"));
	ScoreDao dao = new ScoreDao();
	Score score = dao.getSelectedScore(stuID, s);
  %>
	<form name="" action="servlet/ScoreModifyServlet?stuID=<%=score.getStuID()%>&session=<%=score.getSession()%>" method="post">
	  学号：<input type="text" name="stuID" value=<%=score.getStuID()%> onfocus="this.blur()"><br><br>
	  届数：<input type="text" name="session" value=<%=score.getSession()%> onfocus="this.blur()"><br><br>
	  总得分：<input type="text" name="total_score" value=<%=score.getTotal_score()%>><br><br>
	  第一题得分：<input type="text" name="score_1" value=<%=score.getScore_1()%> onfocus="this.blur()"><br><br>
	  第二题得分：<input type="text" name="score_2" value=<%=score.getScore_2()%> onfocus="this.blur()"><br><br>
	  第三题得分：<input type="text" name="score_3" value=<%=score.getScore_3()%> onfocus="this.blur()"><br><br>
	  第四题得分：<input type="text" name="score_4" value=<%=score.getScore_4()%> onfocus="this.blur()"><br><br>
	  第五题得分：<input type="text" name="score_5" value=<%=score.getScore_5()%> onfocus="this.blur()"><br><br>
	  <button type="submit">修改</button><button type="button" onclick="window.location.href='/CSP/jsp/managerMain.jsp';">返回</button>
	</form>
  </body>
</html>
