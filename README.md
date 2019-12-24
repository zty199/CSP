# CSP
软件项目管理——CSP团报管理系统
系统部署与运行说明
1、项目工作环境
  1)	服务器端：
    ①　Java环境：jdk 1.8u_231
    ②　服务器：Apache Tomcat 9.0.29
    ③　数据库：MySQL 8.0.18
  2)	客户端：
    ④　操作系统：Windows 10
    ⑤　浏览器：Microsoft Edge
2、项目部署
  1)	服务器部署：
    ①　安装配置Java环境jdk1.8u_231
      a.	从官网下载对应版本jdk
      b.	下载完毕后，安装jdk
      c.	配置环境变量
      d.	环境变量配置完之后测试一下jdk是否安装成功
    ②　安装配置Apache Tomcat 9.0.29
      a.	进入官网，下载Tomcat的压缩包版本
      b.	解压到硬盘任意位置，在系统变量中添加设置环境变量
      c.	在控制台输入startup，在系统中启动Tomcat服务项。
      d.	打开浏览器，地址栏输入http://localhost:8080，如果出现tomcat示例主页，则表示服务器安装成功
      e.	在解压目录的bin文件夹中运行shutdown.bat可以关闭服务器
      f.	在解压目录的config文件夹中，找到server.xml文件，打开后在两处Connector中添加URIEncoding="UTF-8"，避免出现中文乱码问题
  2)	数据库部署：
    ①　安装配置MySQL 8.0.18
      a.	下载Windows系统对应的MySQL Installer for Windows
      b.	双击安装，多数选项使用默认配置；设置服务器密码时选择传统模式（Legacy 5.x），root用户密码设置为root
      c.	启动服务项（默认名称MySQL80）
3、项目运行：
  1)	导入csp.sql文件到服务器端数据库
      使用mysql命令行，输入密码root连接数据库；
      create database csp;
      use datebase csp;
      source ../csp.sql;（csp.sql文件的完整路径）
  2)	将项目打包文件CSP.war部署至Apache Tomcat安装目录的webapps文件夹下；
  3)	运行Apache Tomcat 9.0服务
  4)	在浏览器中键入http://localhost:8080/CSP/进入登陆页面开始运行项目
