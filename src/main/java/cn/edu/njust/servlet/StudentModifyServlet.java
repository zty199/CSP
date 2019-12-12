package cn.edu.njust.servlet;

import java.awt.HeadlessException;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import cn.edu.njust.dao.StudentDao;
import cn.edu.njust.bean.Student;

public class StudentModifyServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        if(request.getSession().getAttribute("identity") == null) {
			JOptionPane.showMessageDialog(null, "请先登录！");
			request.getSession().setAttribute("user", null);
			response.sendRedirect("../jsp/login.jsp");
			return;
		} else {
			int identity = (int) request.getSession().getAttribute("identity");
			if(identity == 0) {
				Student stu = new Student();
				stu = (Student) request.getSession().getAttribute("user");
				Student student = new Student();
				student.setStuID(request.getParameter("id"));
				student.setStuName(request.getParameter("name"));
				student.setStuGrade(request.getParameter("grade"));
				student.setStuPersonID(request.getParameter("pid"));
				student.setStuPassword(request.getParameter("pwd"));
				String cpwd = request.getParameter("cpwd");
				if(!stu.getStuID().equals(student.getStuID())) {
					JOptionPane.showMessageDialog(null, "登录信息不符，请重新登录！");
					request.getSession().setAttribute("user", null);
					request.getSession().setAttribute("identity", null);
					response.sendRedirect("../jsp/login.jsp");
					return;
				}
				if(student.getStuName().equals("")) {
					JOptionPane.showMessageDialog(null, "姓名不能为空！");
					response.sendRedirect("../jsp/studentModify.jsp");
					return;
				}
				if(student.getStuPersonID().length() != 18) {
					JOptionPane.showMessageDialog(null, "身份证号格式错误！");
					response.sendRedirect("../jsp/studentModify.jsp");
					return;
				}
				if(student.getStuPassword().equals("")) {
			        JOptionPane.showMessageDialog(null, "密码不能为空！");
			        response.sendRedirect("../jsp/studentModify.jsp");
			        return;
				}
		        if(!student.getStuPassword().equals(cpwd)) {
		            JOptionPane.showMessageDialog(null, "两次输入的密码不一致！");
		            response.sendRedirect("../jsp/studentModify.jsp");
			        return;
		        }
		        StudentDao dao = new StudentDao();
		        try {
					if(dao.modifyStudent(student, student.getStuID())) {
					    JOptionPane.showMessageDialog(null, "修改成功！");
					    student = dao.getInfo(student.getStuID());
					    request.getSession().setAttribute("user", student);
					    request.getSession().setAttribute("identity", identity);
					    response.sendRedirect("../jsp/studentModify.jsp");
					    return;
					} else {
					    JOptionPane.showMessageDialog(null, "未知错误，修改失败！");
					    response.sendRedirect("../jsp/studentModify.jsp");
					}
				} catch (HeadlessException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				Student student = new Student();
				student.setStuID(request.getParameter("id"));
				String temp = request.getParameter("stuID");
				student.setStuName(request.getParameter("name"));
				student.setStuGrade(request.getParameter("grade"));
				student.setStuPersonID(request.getParameter("pid"));
				student.setStuPassword(request.getParameter("pwd"));
				String cpwd = request.getParameter("cpwd");
				if(student.getStuGrade().length() != 4) {
					JOptionPane.showMessageDialog(null, "年级格式错误！");
					response.sendRedirect("../jsp/studentModify.jsp?stuID=" + student.getStuID());
					return;
				}
				if(student.getStuID().length() != 12) {
					JOptionPane.showMessageDialog(null, "学号格式错误！");
					response.sendRedirect("../jsp/studentModify.jsp?stuID=" + temp);
					return;
				}
				StudentDao dao = new StudentDao();
				try {
					if(!temp.equals(student.getStuID()) && dao.isListed(student.getStuID())) {
						JOptionPane.showMessageDialog(null, "学号存在冲突，请检查！");
						response.sendRedirect("../jsp/studentModify.jsp?stuID=" + temp);
						return;
					}
				} catch (HeadlessException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(student.getStuName().equals("")) {
					JOptionPane.showMessageDialog(null, "姓名不能为空！");
					response.sendRedirect("../jsp/studentModify.jsp?stuID=" + student.getStuID());
					return;
				}
				if(student.getStuPersonID().length() != 18) {
					JOptionPane.showMessageDialog(null, "身份证号格式错误！");
					response.sendRedirect("../jsp/studentModify.jsp?stuID=" + student.getStuID());
					return;
				}
				if(student.getStuPassword().equals("")) {
			        JOptionPane.showMessageDialog(null, "密码不能为空！");
			        response.sendRedirect("../jsp/studentModify.jsp?stuID=" + student.getStuID());
			        return;
				}
		        if(!student.getStuPassword().equals(cpwd)) {
		            JOptionPane.showMessageDialog(null, "两次输入的密码不一致！");
		            response.sendRedirect("../jsp/studentModify.jsp?stuID=" + student.getStuID());
			        return;
		        }
		        try {
					if(dao.modifyStudent(student, student.getStuID())) {
					    JOptionPane.showMessageDialog(null, "修改成功！");
					    response.sendRedirect("../jsp/studentModify.jsp?stuID=" + student.getStuID());
					    return;
					} else {
					    JOptionPane.showMessageDialog(null, "未知错误，修改失败！");
					    response.sendRedirect("../jsp/studentModify.jsp?stuID=" + student.getStuID());
					}
				} catch (HeadlessException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

}
