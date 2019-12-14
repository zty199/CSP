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
    
    <title>My JSP 'managerModify.jsp' starting page</title>
    
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
		managermain.action="servlet/StudentDeleteServlet";
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
    <center>
 	<form name="managermodify" action="jsp/managerModify.jsp" method="post">
  	  <input type="submit" value="refresh">
	  <table border="1">
 		<tr>
		  <td>all<input type="checkbox" name="allgrade" id="checkall"></td>
		  <td>2016<input type="checkbox" name="grade" value="2016"></td>
		  <td>2017<input type="checkbox" name="grade" value="2017"></td>
		  <td>2018<input type="checkbox" name="grade" value="2018"></td>
		  <td>2019<input type="checkbox" name="grade" value="2019"></td>
		</tr>
		<tr>
		  <td><input type="checkbox" id="stuID">学号</td>
		  <td>姓名</td>
		  <td>年级</td>
		  <td>身份证号</td>
		</tr>
 		<%
		String[] grade = new String[4];
		if(request.getParameterValues("grade") == null) {
			grade[0] = "2016";
			grade[1] = "2017";
			grade[2] = "2018";
			grade[3] = "2019";
		} else {
			grade = request.getParameterValues("grade");
		}
		AdminDao dao = new AdminDao();
		List<Student> list = new ArrayList<Student>();
		for(int i = 0; i < grade.length; i++) {
			try {
				list = dao.getGradeStudent(grade[i]);
				for(int j = 0; j < list.size(); j++) {
					Student student = list.get(j);
		%>
		<tr>
		  <td><input type="checkbox" name="stuid" value=<%=student.getStuID()%>><%=student.getStuID()%></td>
		  <td><%=student.getStuName()%></td>
		  <td><%=student.getStuGrade()%></td>
		  <td><%=student.getStuPersonID()%></td>
		  <td><a href="/CSP/jsp/studentModify.jsp?stuID=<%=student.getStuID()%>">修改</a></td>          
		</tr>
		<%
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		%>
		<tr><td><input type="submit" value="delete selected" onclick="a()"></td></tr>  
	  </table>
	</form>
  </center>
  </body>
</html>
