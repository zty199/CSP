<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.njust.bean.Admin, cn.edu.njust.dao.*"%>
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
    <title>importstudent.html</title>

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
    <script type="text/javascript">
        function check_upload(theform) {
            var filename = document.getElementById("filename").value;
            if (filename == "" || filename == null || filename.indexOf(".xls") == -1) {
                alert('只能上传.xls文件');
                return false;
            }
        }
    </script>

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
                <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
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
                        <li><a href="/CSP/jsp/importScore.jsp"><i class="fi-text-color"
									style="font-size:20px;color:white;"></i>
								<p style="color:white">导入成绩</p>
							</a></li>
                        <li class="divider"></li>
                        <li><a href="/CSP/jsp/importStudent.jsp"><i class="fi-torsos-all"
									style="font-size:20px;color:white;"></i>
								<p style="color:white">导入学生</p>
							</a></li>
                        <li class="divider"></li>
                        <li><a href="/CSP/jsp/managerOpen.jsp"><i class="fi-play"
									style="font-size:20px;color:white;"></i>
								<p style="color:white">开启团报</p>
							</a></li>
                        <li class="divider"></li>
                        <li><a href="/CSP/jsp/managerIntention.jsp"><i class="fi-widget"
									style="font-size:20px;color:white;"></i>
								<p style="color:white">团报意向管理</p>
							</a></li>
                        <li class="divider"></li>
                        <li><a href="/CSP/jsp/managerConfirm.jsp"><i class="fi-widget"
									style="font-size:20px;color:white;"></i>
								<p style="color:white">团报名单管理</p>
							</a></li>
                        <li class="divider"></li>
                    </ul>
                </aside>

                <section class="main-section">
                    <center>
                        <form action="servlet/ExcelOneServlet" enctype="multipart/form-data" method="post" οnsubmit="return check_upload(this)">
                            <select name="grade">
								<option value="" selected="selected">[选择年级]</option>
								<option value="2015">2015级</option>
								<option value="2016">2016级</option>
								<option value="2017">2017级</option>
								<option value="2018">2018级</option>
								<option value="2019">2019级</option>
								<option value="2020">2020级</option>
								<option value="2021">2021级</option>
								<option value="2022">2022级</option>
								<!--<option value="2023">2023级</option>
	    							<option value="2024">2024级</option>
	    							<option value="2025">2025级</option>
	    							<option value="2026">2026级</option>
	    							<option value="2027">2027级</option>
	    							<option value="2028">2028级</option>
	    							<option value="2029">2029级</option>
	    							<option value="2030">2030级</option>
	    							<option value="2031">2031级</option>
	    							<option value="2032">2032级</option>
	    							<option value="2033">2033级</option>
	    							<option value="2034">2034级</option>
	    							<option value="2035">2035级</option>
	    							<option value="2036">2036级</option>
	    							<option value="2037">2037级</option>
	    							<option value="2038">2038级</option>
	    							<option value="2039">2039级</option>
	    							<option value="2040">2040级</option>
	    							<option value="2041">2041级</option>
	    							<option value="2042">2042级</option>
	    							<option value="2043">2043级</option>
	    							<option value="2044">2044级</option>
	    							<option value="2045">2045级</option>
	    							<option value="2046">2046级</option>
	    							<option value="2047">2047级</option>
	    							<option value="2048">2048级</option>
	    							<option value="2049">2049级</option> -->
	    					</select>
                            <input type="file" name="studentExcel">
                            
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

                            <button class="button button3">提交</button>
                        </form>
                    </center>
                </section>
                <a class="exit-off-canvas"></a>
            </div>
        </div>
    </div>
    <!-- 初始化 Foundation JS -->
    <script>
        $(document).ready(function() {
            $(document).foundation();
        })
    </script>

</body>

</html>