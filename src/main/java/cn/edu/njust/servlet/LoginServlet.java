package cn.edu.njust.servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import cn.edu.njust.dao.AdminDao;
import cn.edu.njust.dao.StudentDao;
import cn.edu.njust.bean.Admin;
import cn.edu.njust.bean.Student;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        int identity = Integer.parseInt(request.getParameter("identity"));
        if(identity == 0) {
        	Student student = new Student();
    		student.setStuID(request.getParameter("userid"));
    		student.setStuPassword(request.getParameter("password"));
    		StudentDao dao = new StudentDao();
            try {
    			if (dao.isValid(student.getStuID(), student.getStuPassword())) {
    				student = dao.getInfo(student.getStuID());
    				request.getSession().setAttribute("user", student);
    				request.getSession().setAttribute("identity", identity);
    				response.sendRedirect("../jsp/studentMain.jsp");
    			    return;
    			} else {
    				request.getSession().setAttribute("user", null);
    			    JOptionPane.showMessageDialog(null, "账号或密码错误！");
    			    response.sendRedirect("../jsp/login.jsp?userid=" + student.getStuID());
    			}
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        } else {
        	Admin admin = new Admin();
    		admin.setAdminID(request.getParameter("userid"));
    		admin.setAdminPassword(request.getParameter("password"));
    		AdminDao dao = new AdminDao();
            try {
    			if (dao.isValid(admin.getAdminID(), admin.getAdminPassword())) {
    				admin = dao.getInfo(admin.getAdminID());
    				request.getSession().setAttribute("user", admin);
    				request.getSession().setAttribute("identity", identity);
    				response.sendRedirect("../jsp/managerMain.jsp");
    			    return;
    			} else {
    				request.getSession().setAttribute("user", null);
    			    JOptionPane.showMessageDialog(null, "账号或密码错误！");
    			    response.sendRedirect("../jsp/login.jsp?userid=" + admin.getAdminID());
    			}
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        }
    }

}
