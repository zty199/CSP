<%@ page language="java" import="java.util.*, javax.swing.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.*, cn.edu.njust.dao.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Student student = new Student();
if(session.getAttribute("identity") == null) {
	JOptionPane.showMessageDialog(null, "请先登录！");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
int identity = (int) session.getAttribute("identity");
if(identity == 0) {
	student = (Student) session.getAttribute("user");
}
if(identity == 1) {
	String stuID = request.getParameter("stuID");
	StudentDao dao = new StudentDao();
	student = dao.getInfo(stuID);
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>CSP考试团报管理系统 | 学生信息</title>
    
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
  	<div class="content-wrapper ">
      <!-- Main content -->
      <div class="content">
        <div class="container">
		  <br></br><br></br><br></br>
          <div class="row">
            <div class="col-5 m-auto">
			  <div class="card m-3">
			    <div class="card-body ">
                  <p class="login-box-msg">学生信息修改</p>
                  <form action="servlet/StudentModifyServlet?stuID=<%=student.getStuID()%>" method="post">
					<div class="input-group mb-3">
					  <input type="text" class="form-control" name="id" value="<%=student.getStuID()%>" onfocus="this.blur()">
					  <div class="input-group-append">
					    <div class="input-group-text">
					      <span class="fas fa-user"></span>
					    </div>
					  </div>
					</div>
                    <div class="input-group mb-3">
                      <%
          			  if(identity == 0) {
          			  %>
                      <input type="text" class="form-control" name="grade" value="<%=student.getStuGrade()%>" onfocus="this.blur()">
                      <%
                      } else {
                      %>
                      <input type="text" class="form-control" name="grade" value="<%=student.getStuGrade()%>" placeholder="请输入年级">
                      <%
                      }
                      %>
                      <div class="input-group-append">
                        <div class="input-group-text">
                          <span class="fas fa-align-left"></span>
                        </div>
                      </div>
                    </div>
                    <div class="input-group mb-3">
                      <%
          			  if(identity == 0) {
          			  %>
                      <input type="text" class="form-control" name="name" value="<%=student.getStuName()%>" onfocus="this.blur()">
                      <%
                      } else {
                      %>
                      <input type="text" class="form-control" name="name" value="<%=student.getStuName()%>" placeholder="请输入姓名">
                      <%
                      }
                      %>
                      <div class="input-group-append">
                        <div class="input-group-text">
                          <span class="fas fa-signature"></span>
                        </div>
                      </div>
                    </div>
				    <div class="input-group mb-3">
				      <input type="text" class="form-control" name="pid" value="<%=student.getStuPersonID()%>" placeholder="请输入身份证号/护照号">
				      <div class="input-group-append">
				        <div class="input-group-text">
				          <span class="fas fa-id-card"></span>
				        </div>
				      </div>
				    </div>
				    <div class="input-group mb-3">
				      <input type="password" class="form-control" name="pwd" value="<%=student.getStuPassword()%>" placeholder="请输入新密码">
				      <div class="input-group-append">
				        <div class="input-group-text">
				          <span class="fas fa-unlock"></span>
				        </div>
				      </div>
				    </div>
				    <div class="input-group mb-3">
				      <input type="password" class="form-control" name="cpwd" value="<%=student.getStuPassword()%>" placeholder="请确认新密码">
				      <div class="input-group-append">
				        <div class="input-group-text">
				          <span class="fas fa-unlock"></span>
				        </div>
				      </div>
			    	</div>
            		<div class="row m-3">
            		  <div class="col-4 m-auto">
            			<button type="submit" class="btn btn-purple btn-block">修改</button>
            		  </div>
            		<!-- /.col -->
            		</div>
                  </form>
				  <div class="social-auth-links text-center mb-3">
				    <p>- OR -</p>
				  </div>
				  <div class="row">
					<div class="social-auth-links col-4 m-auto">
				  	  <a href="/CSP/jsp/studentModify.jsp" class="btn btn-block btn-danger">重置</a>
					</div>
					<div class="social-auth-links col-4 m-auto">
					  <%
          			  if(identity == 0) {
          			  %>
				  	  <a href="/CSP/jsp/studentMain.jsp" class="btn btn-block btn-default">返回</a>
				  	  <%
				  	  } else {
				  	  %>
				  	  <a href="/CSP/jsp/managerMain.jsp" class="btn btn-block btn-default">返回</a>
				  	  <%
				  	  }
				  	  %>
					</div>
			  	  </div>
				</div>
		   	  </div>
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
	<script src="../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/adminlte.min.js"></script>

  </body>
</html>
