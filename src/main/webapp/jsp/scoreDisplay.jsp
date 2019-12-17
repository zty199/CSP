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
    
    <title>My JSP 'scoreDisplay.jsp' starting page</title>
    
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
		scoredisplay.action="servlet/ScoreDeleteServlet";
		scoredisplay.submit();
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
 	<form name="scoredisplay" action="jsp/scoreDisplay.jsp" method="post">
	  <table border="1">
 		<tr>
		  <td>all<input type="checkbox" name="allgrade" value="0000"id="checkall"></td>
		  <td>2016<input type="checkbox" name="grade" value="2016"></td>
		  <td>2017<input type="checkbox" name="grade" value="2017"></td>
		  <td>2018<input type="checkbox" name="grade" value="2018"></td>
		  <td>2019<input type="checkbox" name="grade" value="2019"></td>
		  <!-- <td>CSP届数
			<select name="cspnumber">
			  <option value="CSP-17">CSP-17</option>
			  <option value="CSP-18">CSP-18</option>
			  <option value="CSP-19">CSP-19</option>
			  <option value="CSP-20">CSP-20</option>
			  <option value="CSP-21">CSP-21</option>
            </select>
		  </td> -->
		  <td><input type="submit" value="refresh"></td>
		</tr>
		<tr>
		  <td><input type="checkbox" id="stuID">学号</td>
		  <td>姓名</td>
		  <td>CSP</td>
		  <td>总成绩</td>
		  <td>第一题得分</td>
		  <td>第二题得分</td>
		  <td>第三题得分</td>
		  <td>第四题得分</td>
		  <td>第五题得分</td>
		  <td></td>
		</tr>
		<%
		String csp = request.getParameter("cspnumber");
		String[] grade = new String[4];
		if(request.getParameterValues("grade") == null) {
			grade[0] = "2016";
			grade[1] = "2017";
			grade[2] = "2018";
			grade[3] = "2019";
		} else {
			grade = request.getParameterValues("grade");
		}
		AdminDao dao1 = new AdminDao();
		ScoreDao dao2 = new ScoreDao();
		List<Student> list1 = new ArrayList<Student>();
		List<Score> list2 = new ArrayList<Score>();
		for(int i = 0; i < grade.length; i++) {
			try {
				list1 = dao1.getGradeStudent(grade[i]);
			} catch(Exception e) {
				e.printStackTrace();
			}
			for(int j = 0; j < list1.size(); j++) {
				try {
					list2 = dao2.getAllScore(list1.get(j).getStuID(), csp);
					for(int k = 0; k < list2.size(); k++) {
						Score score = list2.get(k);
		%>
		<tr>
		  <td><input type="checkbox" name="stuid" value=<%=score.getStuID()%>><%=score.getStuID()%></td>
		  <td><%=score.getStuName()%></td>
		  <td><%=score.getSession()%></td>
		  <td><%=score.getTotal_score()%></td>
		  <td><%=score.getScore_1()%></td>
		  <td><%=score.getScore_2()%></td>
		  <td><%=score.getScore_3()%></td>
		  <td><%=score.getScore_4()%></td>
		  <td><%=score.getScore_5()%></td>
		  <td><a href="/CSP/jsp/scoreModify.jsp?stuID=<%=score.getStuID()%>&session=<%=score.getSession()%>">修改</a></td>          
		</tr>          	
		<%
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		if(admin.getAdminGrade().equals("0000")) {
		%>
		<tr><td><input type="submit" value="delete selected" onclick="a()"></td></tr>
		<%
		}
		%>
	  </table>
	</form>
  </center>
  <button type="button" onclick="window.location.href='/CSP/jsp/managerMain.jsp';">返回</button>
  </body>
</html>