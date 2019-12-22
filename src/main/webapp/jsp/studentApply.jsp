<%@ page language="java" import="java.util.*, javax.swing.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.*, cn.edu.njust.dao.*"%>
<jsp:include page="isStudent.jsp"></jsp:include>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Student student = new Student();
student = (Student) session.getAttribute("user");
ServletContext sc = getServletConfig().getServletContext();
if(sc.getAttribute("open") == null || sc.getAttribute("open").equals(0)) {
	JOptionPane.showMessageDialog(null, "尚未开启报名途径！");
%>
<jsp:forward page="studentMain.jsp"></jsp:forward> 
<% 
} 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>CSP考试团报管理系统 | 学生报名</title>
    
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
  	          	  <a href="/CSP/jsp/studentModify.jsp" class="nav-link text-white" target="_blank"><%=student.getStuName()%>&nbsp;同学，您好！</a>
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
          <div class="row mb-3">
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">
		  <div class="row">
		    <div class="col-12">
		      <div class="card mb-5">
		        <div class="card-header">
		          <h3 class="card-title">报名状态</h3>
		        </div>
		        <!-- /.card-header -->
		        <div class="card-body table-responsive p-0" style="height: 350px;" >
		          <table class="table table-head-fixed">
		            <thead>
		              <tr>
		                <th>序号</th>
		                <th>学号</th>
		                <th>姓名</th>
		                <th>资格</th>
		                <th>状态</th>
		              </tr>
		            </thead>
		            <tbody>
		            <%
        			IntentionDao dao = new IntentionDao();
        			List<Intention> list = new ArrayList<Intention>();
        			list = dao.getAllIntention();
        			for(int i = 1; i <= list.size(); i++) {
        				Intention intention = new Intention();
        			%>
		              <tr>
		                <td><%=i%></td>
		                <td><%=intention.getStuID()%></td>
		                <td><%=intention.getName()%></td>
		                <td>公共资格</td>
		                <td>待参加选拔考试</td>
		              </tr>
		            <%
        			}
        			%>
		            </tbody>
		          </table>
		        </div>
		        <!-- /.card-body -->
		      </div>
		      <!-- /.card -->
			  <div class="social-auth-links text-center mb-4">
			    <a href="/CSP/servlet/StudentApplyServlet" class="btn btn-block btn-purple col-4 m-auto">
			      <i class="fas fa-user-plus mr-2"></i> 团报报名
			    </a>
			  </div>
			
			  <div class="social-auth-links text-center  mb-3">
			    <a href="/CSP/jsp/studentMain.jsp" class="btn btn-block btn-purple col-4 m-auto">
			      <i class="fas fa-sign-out-alt mr-2"></i> 返回
			    </a>
			  </div>
		    </div>
		  </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
      <div class="p-3">
        <h5>Title</h5>
        <p>Sidebar content</p>
      </div>
    </aside>
  	<!-- /.control-sidebar -->

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
