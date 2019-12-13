package cn.edu.njust.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import cn.edu.njust.dao.*;

public class ScoreDeleteServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        ScoreDao dao = new ScoreDao();
        if(request.getParameterValues("stuid") == null) {
        	out.print("<script>");
			out.print("alert('Please pick what you want to delete.');");
			out.print("window.location.href='jsp/managerMain.jsp'");
			out.print("</script>");
			out.close();	
        } else {
        	String stuid[] = request.getParameterValues("stuid");
        	for(int i = 0; i < stuid.length; i++) {
        		try {
        			if(dao.deleteScore(stuid[i])) {
        				JOptionPane.showMessageDialog(null, "删除成功！");
        			    response.sendRedirect("../jsp/managerMain.jsp");
        			    return;
        			} else {
        				JOptionPane.showMessageDialog(null, "未知原因，删除失败！");
        			    response.sendRedirect("../jsp/managerMain.jsp");
        			}
        		} catch (SQLException e) {
        			e.printStackTrace();
        		}
        	}
        }
	}

}
