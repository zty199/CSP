package cn.edu.njust.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

public class CloseServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        ServletContext sc = getServletConfig().getServletContext();
        sc.setAttribute("open", 0);
        sc.removeAttribute("score");
        JOptionPane.showMessageDialog(null, "团报入口已经关闭！");
        response.sendRedirect("../jsp/managerOpen.jsp");
        return;
	}

}