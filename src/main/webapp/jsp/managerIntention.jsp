<%@ page language="java" import="java.util.*, javax.swing.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.*, cn.edu.njust.dao.*"%>
<jsp:include page="isAdmin.jsp"></jsp:include>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Admin admin = new Admin();
admin = (Admin) session.getAttribute("user");
if(!admin.getAdminGrade().equals("0000")) {
	JOptionPane.showMessageDialog(null, "请以系统管理员身份登录！");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
  <base href="<%=basePath%>">

  <title>CSP考试团报管理系统 | 团报意向名单</title>

  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/foundation.min.css">
  <link rel="stylesheet" href="css/foundation-icons.css">
  <link rel="stylesheet" href="css/foundation-icons.eot">
  <link rel="stylesheet" href="css/foundation-icons.svg">
  <link rel="stylesheet" href="css/foundation-icons.ttf">
  <link rel="stylesheet" href="css/foundation-icons.woff">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="dist/css/mycss.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/foundation.min.js"></script>
  <script src="js/modernizr.js"></script>

</head>

<body class="hold-transition layout-top-nav">
  <div class="wrapper">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand-md navbar-light navbar-purple">
      <div class="container">
        <a href="/CSP/jsp/managerMain.jsp" class="navbar-brand">
          <img src="/CSP/dist/njust.png" alt="ANJUST Logo" class="brand-image img-circle elevation-3">
          <span class="brand-text text-white font-weight-light"><strong>CSP团报管理系统</strong></span>
        </a>
        <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse"
          aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Right navbar links -->
        <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
          <div class="collapse navbar-collapse order-3" id="navbarCollapse">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
              <li class="nav-item">
                <a href="/CSP/jsp/managerMain.jsp" class="nav-link text-white">欢迎，<%=admin.getAdminGrade()%>级管理员!</a>
              </li>
              <li class="nav-item">
                <a href="/CSP/jsp/managerMain.jsp" class="nav-link text-white">主页</a>
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


    <div class="off-canvas-wrap" data-offcanvas style="height: 100%;">

      <div class="inner-wrap" style="height: 100%;">
        <nav class="tab-bar" style="background-color: #ffffff;">
          <section class="left-small" style="background-color: #68838b;">
            <a class="left-off-canvas-toggle menu-icon" href="#"><span></span></a>
          </section>

          <section class="middle tab-bar-section">
            <h1 class="title"></h1>
          </section>
        </nav>

        <aside class="left-off-canvas-menu" style="background-color: #68838b;height: 98%;">
          <ul class="off-canvas-list test" style="height: 98%;">
          	<li><a href="/CSP/jsp/scoreDisplay.jsp"><i class="fi-text-color" style="font-size:20px;color:white;"></i>
				<p style="color:white">查询成绩</p>
			  </a></li>
            <li class="divider"></li>
            <li><a href="/CSP/jsp/importScore.jsp"><i class="fi-text-color" style="font-size:20px;color:white;"></i>
                <p style="color:white">导入成绩</p>
              </a></li>
            <li class="divider"></li>
            <li><a href="/CSP/jsp/importStudent.jsp"><i class="fi-torsos-all" style="font-size:20px;color:white;"></i>
                <p style="color:white">导入学生</p>
              </a></li>
            <li class="divider"></li>
            <li><a href="/CSP/jsp/managerOpen.jsp"><i class="fi-play" style="font-size:20px;color:white;"></i>
                <p style="color:white">开启团报</p>
              </a></li>
            <li class="divider"></li>
            <li><a href="/CSP/jsp/managerIntention.jsp"><i class="fi-widget" style="font-size:20px;color:white;"></i>
                <p style="color:white">团报意向管理</p>
              </a></li>
            <li class="divider"></li>
            <li><a href="/CSP/jsp/managerConfirm.jsp"><i class="fi-widget" style="font-size:20px;color:white;"></i>
                <p style="color:white">团报名单管理</p>
              </a></li>
            <li class="divider"></li>
          </ul>
        </aside>

        <section class="main-section">
          <!-- Content Wrapper. Contains page content -->
          <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
              <div class="container">
                <div class="row mb-3">
                </div>
                <!-- /.row -->
              </div>
              <!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <div class="content">
              <div class="container">
                <div class="row">
                  <div class="col-12">
                    <div class="card mb-5">
                      <div class="card-header">
                        <h3 class="card-title">团报意向名单</h3>
                      </div>
                      <!-- /.card-header -->
                      <div class="card-body table-responsive p-0" style="height: 350px;">
                      <style>
                      .button {
                        background-color: #4CAF50;
                        /* Green */
                        border: none;
                        color: white;
                        padding: 15px 32px;
                        text-align: center;
                        text-decoration: none;
                        display: inline-block;
                        font-size: 16px;
                        margin: 4px 2px;
                        cursor: pointer;
                      }
                      .button3 {
                        border-radius: 8px;
                      }
                      </style>
                       <form action="servlet/IntentionServlet" method="post"> 
                        <table class="table table-head-fixed">
                          <thead>
                          	<tr><td colspan="3"><center>
                          	  <button type="submit" class="button button3">添加到团报名单</button>
                          	</center></td></tr>
                            <tr>
                              <th>学号</th>
                              <th>姓名</th>
                              <th>团报途径</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%
                          IntentionDao dao = new IntentionDao();
                          List<Intention> list = dao.getAllIntention();
                          for(int i = 0; i < list.size(); i++) {
                          Intention intention = list.get(i);
                          %>
                            <tr>
                              <td><input type="checkbox" name="stuID" value="<%=intention.getStuID()%>"><%=intention.getStuID()%></td>
                              <td><%=intention.getName()%></td>
                              <td><%=intention.getIntention()%></td>
                            </tr>
                          <%
                          }
                          %>
                          </tbody>
                        </table>
                       </form>
                      </div>
                      <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                  </div>
                </div>
              </div>
              <!-- /.container-fluid -->
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
        </section>

        <a class="exit-off-canvas"></a>

      </div>
      <!-- ./wrapper -->

      <!-- REQUIRED SCRIPTS -->

      <!-- jQuery -->
      <script src="../plugins/jquery/jquery.min.js"></script>
      <!-- Bootstrap 4 -->
      <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
      <!-- AdminLTE App -->
      <script src="../dist/js/adminlte.min.js"></script>

    </div>
  </div>

  <!-- 初始化 Foundation JS -->
  <script>
    $(document).ready(function () {
      $(document).foundation();
    })
  </script>

</body>

</html>