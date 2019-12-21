<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.*, cn.edu.njust.dao.*"%>
<jsp:include page="isStudent.jsp"></jsp:include>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Student student = new Student();
student = (Student) session.getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>CSP考试团报管理系统 | 学生主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="/CSP/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="/CSP/dist/css/adminlte.min.css">
	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	<link rel="stylesheet" href="/CSP/dist/css/mycss.css">

  </head>
  
  <body class="hold-transition layout-top-nav">
  <div class="wrapper">
  
	<!-- Navbar -->
	<nav class="main-header navbar navbar-expand-md navbar-light navbar-purple">
	  <div class="container">
      	<a href="/CSP/jsp/studentMain.jsp" class="navbar-brand">
		  <img src="/CSP/dist/njust.png" alt="ANJUST Logo" class=" brand-image img-circle elevation-3"">
          <span class="brand-text text-white font-weight-light"><strong>CSP团报管理系统</strong></span>
      	</a>
      	<button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
      	</button>
  	  	<!-- Right navbar links -->
  	  	<ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
  	    	<div class="collapse navbar-collapse order-3" id="navbarCollapse">
  	      	  <!-- Left navbar links -->
  	      	  <ul class="navbar-nav">
  	        	<li class="nav-item">
  	          	  <a href="/CSP/jsp/studentModify.jsp" class="nav-link text-white"><%=student.getStuName()%>&nbsp;同学，您好！</a>
  	            </li>
  	            <li class="nav-item">
  	              <a href="/CSP/jsp/studentMain.jsp" class="nav-link text-white">主页</a>
  	            </li>
  			    <li class="nav-item">
  			      <a href="/CSP/jsp/logout.jsp" class="nav-link text-white">注销</a>
  			    </li>
  	          </ul>
  	    	</div>
  	  	</ul>
      </div>
  	</nav>
  	<!-- /.navbar -->

  	<!-- Content Wrapper. Contains page content -->
  	<div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container">
          <div class="row mb-0">
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">
		  <div class="row">
		    <div class="col-12">
		      <div class="card card-red">
		        <div class="card-header">
		          <h3 class="card-title">考试成绩</h3>
		        </div>
		        <!-- /.card-header -->
		        <div class="card-body table-responsive p-0" style="height: 350px;">
		          <table class="table table-head-fixed">
		            <thead>
		              <tr>
		                <th>CSP</th>
		                <th>总分</th>
		                <th>1</th>
		                <th>2</th>
					    <th>3</th>
					    <th>4</th>
					    <th>5</th>
		              </tr>
		            </thead>
		            <%
        			ScoreDao dao = new ScoreDao();
        			List<Score> list = dao.getAllScore(student.getStuID());
        			for(int i = 0; i < list.size(); i++) {
        				Score score = list.get(i);
        			%>
        			<tbody>
        			  <tr>
          				<td><%=score.getSession()%></td>
          				<td><%=score.getTotal_score()%></td>
          				<td><%=score.getScore_1()%></td>
          				<td><%=score.getScore_2()%></td>
          				<td><%=score.getScore_3()%></td>
          				<td><%=score.getScore_4()%></td>
          				<td><%=score.getScore_5()%></td>
        			  </tr>
        			</tbody>
        			<%
        			}
        			%>
		          </table>
		        </div>
		        <!-- /.card-body -->
		      </div>
		      <!-- /.card -->
			
			  <div class="row">
			    <div class="col-12">
			      <div class="card card-primary">
			        <div class="card-header">
			          <h3 class="card-title">团报资格</h3>
			        </div>
			        <!-- /.card-header -->
			        <div class="card-body">
			          <div class="row">
			          </div>
			          <div class="row mt-4">
			            <div class="col-sm-4">
			              <div class="position-relative p-3 bg-gray" style="height: 180px">
			                <div class="ribbon-wrapper ribbon-lg">
			                  <div class="ribbon bg-success text-lg">公共</div>
			                </div>
			              	是否拥有免费的公共资格 <br> <br>
			              	<big><%=student.getPubFree()%></big>
			              </div>
			            </div>
			            <div class="col-sm-4">
			              <div class="position-relative p-3 bg-gray" style="height: 180px">
			                <div class="ribbon-wrapper ribbon-lg">
			                  <div class="ribbon bg-warning text-lg">分数</div>
			                </div>
			             	 通过考试获取的资格 <br> <br>
			                <big><%=student.getScoreNum()%>&nbsp;次</big>&nbsp;
			              </div>
			            </div>
					    <div class="social-auth-links text-center col-sm-4">
						    <br></br>
					      <a href="/CSP/jsp/studentApply.jsp" class="btn btn-block btn-purple col-8 m-auto">
					        <i class="fas fa-user-plus mr-2"></i> 进行团报
					      </a>
					    </div>
			          </div>
			        </div>
			        <!-- /.card-body -->
			      </div>
			      <!-- /.card -->
			    </div>
			    <!-- /.col -->
			  </div>
			  <!-- /.row -->
		    </div>
		  </div>
        </div>
        <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->
    </div>
    <!-- ./wrapper -->

 	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script src="../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/adminlte.min.js"></script>

  </body>
</html>
