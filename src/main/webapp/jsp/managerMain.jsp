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
	
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
	function a()
	{
		managermain.action="servlet/ScoreDeleteServlet";
		managermain.submit();
	}
	</script>
	<script>
	$(function () {
		$("#checkall").click(function () {//判断全选框的改变
	    	var flage = $(this).is(":checked");//全选选中为true，否则为false
	        $("input[name=grade]").each(function () {
	            $(this).prop("checked", flage);
	        })
	    });
	    //当子元素都选全选选中，其中一个不选取消全选
	    $("input[name=grade]").click(function () {
	        var flage1 = true;
	        for (var i = 0; i < $("input[name=grade]").length; i++) {
	            if (!$($("input[name=grade]")[i]).is(":checked")) {
	                flage1 = false;
	                break;
	            }
	        }
	        $("#checkall").prop("checked", flage1);
	    })
	})
	
	$(function () {
	    $("#stuID").click(function () {//判断全选框的改变
	        var flage = $(this).is(":checked");//全选选中为true，否则为false
	        $("input[name=stuid]").each(function () {
	            $(this).prop("checked", flage);
	        })
	    });
	    //当子元素都选全选选中，其中一个不选取消全选
	    $("input[name=stuid]").click(function () {
	        var flage1 = true;
	        for (var i = 0; i < $("input[name=stuid]").length; i++) {
	             if (!$($("input[name=stuid]")[i]).is(":checked")) {
	                 flage1 = false;
	                 break;
	             }
	        }
	        $("#stuID").prop("checked", flage1);
	    })
	})
	<%/*$(document).ready(function(){
        $("[name='allgrade']").click(function(){
		    if($(this).is(':checked')){
		        $("[name='grade']").prop('checked',true);
		    }else{
		    	$("[name='grade']").prop('checked',false);
		    }	
		})
	});*/%>
	</script>
  </head>
  
  <body>
  	<h4>欢迎，<%=admin.getAdminGrade()%>年级管理员
  	<center><button type="button" onclick="window.location.href='/CSP/jsp/logout.jsp';">注销</button>&nbsp;&nbsp;</center>
  	</h4>
	  <center>
	  	<form action="jsp/scoreDisplay.jsp" method="post">
	  		CSP届数
			<select name="session">
			  <option value="17">CSP-17</option>
			  <option value="18">CSP-18</option>
			  <option value="19">CSP-19</option>
			  <option value="20">CSP-20</option>
			  <option value="21">CSP-21</option>
            </select>
            <input type="submit" value="查询成绩">
	  	</form>
	  	<form action="jsp/studentDisplay.jsp"method="post">
	  		<table  border="1">
	  			<tr>
		  			<td>学号</td>
		  			<td>姓名</td>
		  			<td>年级</td>
		  			<td></td>
	  			</tr>
	  			<%
	  			String grade = admin.getAdminGrade();
	  			AdminDao dao = new AdminDao();
	  			List<Student> list=dao.getGradeStudent(grade);
	  			for(int i = 0; i < list.size(); i++) {
	  				Student student = new Student();
	  				student = list.get(i);
	  			%>
	  			<tr>
	  			  <td><a href="/CSP/jsp/stuAllScore.jsp?stuID=<%=student.getStuID()%>"><%=student.getStuID()%></a></td>
	  			  <td><%=student.getStuName() %></td>
	  			  <td><%=student.getStuGrade() %></td>
	  			  <td><a href="/CSP/jsp/studentModify.jsp?stuID=<%=student.getStuID()%>">修改学生信息</a></td>
	  			</tr>
	  			<%} %>
	  		</table>
	  	</form>
	  </center>
  	
  <ul>
  	<li><a href="/CSP/jsp/importScore.jsp">导入成绩</a></li>
  	<li><a href="/CSP/jsp/importStudent.jsp">导入学生</a></li>
  	<li><a href="/CSP/jsp/managerOpen.jsp">开启团报</a></li>
  	<li><a href="/CSP/jsp/managerIntention.jsp">团报意向管理</a></li>
  	<li><a href="/CSP/jsp/managerConfirm.jsp">团报名单管理</a></li>
  </ul>
  </body>
</html>