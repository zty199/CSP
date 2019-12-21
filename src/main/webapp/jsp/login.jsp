<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String preUrl = request.getHeader("referer");
//session.setAttribute("preUrl", preUrl);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>CSP考试团报管理系统 | 登陆</title>
    
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
		<div class="container text-center text-white col-md-auto">
		  <img src="/CSP/dist/njust.png" alt="ANJUST Logo" class=" brand-image img-circle elevation-3"">
		  <h2>&nbsp;CSP考试团报管理系统</h2>
		</div>
	  </nav>
  	  <!-- /.navbar -->
  	  <!-- Content Wrapper. Contains page content -->
  	  <div class="content-wrapper">
    	<!-- Main content -->
    	<div class="content">
      	  <div class="container">
			<br></br><br></br><br></br>
        	<div class="row">
          	  <div class="col-5 m-auto">
			  	<div class="card m-3">
			   	  <div class="card-body login-card-body">
                	<p class="login-box-msg">登陆以进行相关操作</p>
                	<form action="servlet/LoginServlet" method="post">
                  	<div class="input-group mb-3">
                      <input type="text" name="userid" class="form-control" placeholder="请输入学号/工号">
                      <div class="input-group-append">
                      	<div class="input-group-text">
                          <span class="fas fa-user"></span>
                      	</div>
                      </div>
                  	</div>
                    <div class="input-group mb-3">
                      <input type="password" name="password" class="form-control" placeholder="请输入密码">
                      <div class="input-group-append">
                        <div class="input-group-text">
                          <span class="fas fa-lock"></span>
                        </div>
                      </div>
                    </div>
            		<div class="row ">
            		  <div class="col-1"></div>
            			<div class="custom-control custom-radio col-6">
            			  <input class="custom-control-input" type="radio" id="customRadio1" name="identity" value="0" checked>
            			  <label for="customRadio1" class="custom-control-label">我是学生</label>
            			</div>
            			<div class="custom-control custom-radio">
            			  <input class="custom-control-input" type="radio" id="customRadio2" name="identity" value="1">
            			  <label for="customRadio2" class="custom-control-label">我是管理员</label>
            			</div>
            		  </div>
                      <div class="row m-3 text-center">
                        <div class="icheck-primary text-center">
                          <input type="checkbox" id="remember">
                          <label for="remember">记住密码</label>
                        </div>
                        <!-- /.col -->
                  	  </div>
            		  <div class="row m-3">
            			<div class="col-4 m-auto">
            			  <button type="submit" class="btn btn-purple btn-block">登陆</button>
            			</div>
            			<!-- /.col -->
            		  </div>
                	</form>  
            		<div class="social-auth-links text-center mb-3">
            		  <p>- OR -</p>
            		  <a href="javascript:history.back(-1);" class="btn btn-block btn-default col-3 m-auto">返回</a>
					</div>
				  </div>
				</div>
                <!-- /.login-card-body -->
          	  <!-- /.col-md-6 -->
        	  </div>
        	  <!-- /.row -->
      		</div>
    	  </div>
    	  <!-- /.content -->
  		</div>
  		<!-- /.content-wrapper -->
  	  <!-- Main Footer -->
	</div>
    <!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script src="/CSP/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/CSP/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/CSP/dist/js/adminlte.min.js"></script>

  </body>
</html>
