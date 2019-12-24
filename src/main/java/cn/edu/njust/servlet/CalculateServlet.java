package cn.edu.njust.servlet;

import java.util.*;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import cn.edu.njust.dao.*;
import cn.edu.njust.bean.*;

public class CalculateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        ServletContext sc = getServletConfig().getServletContext();
        if(request.getParameter("score").equals("")) {
        	JOptionPane.showMessageDialog(null, "请输入分数线！");
        	response.sendRedirect("../jsp/managerOpen.jsp");
        	return;
        }
        int s = Integer.parseInt(request.getParameter("score"));
        sc.setAttribute("score", s);
        int num = 0, i, j;
        sc.setAttribute("num", 0);
        StudentDao dao = new StudentDao();
        List<Student> list = new ArrayList<Student>();
        try {
			list = dao.getAllStudent();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        for(i = 0; i < list.size(); i++) {
        	Student student = list.get(i);
        	student.setScoreNum(0);
        	ScoreDao dao1 = new ScoreDao();
        	List<Score> list1 = new ArrayList<Score>();
        	try {
				list1 = dao1.getAllScore(student.getStuID());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	for(j = 0; j < list1.size(); j++) {
        		Score score = list1.get(j);
        		if(score.getTotal_score() >= s) {
        			student.setScoreNum(student.getScoreNum() + 1);
        		}
        	}
        	if(student.getScoreNum() - student.getUsedNum() > 0)
        		num++;
        	try {
				if(!dao.updateQuality(student)) {
					JOptionPane.showMessageDialog(null, "未知原因，数据更新失败！");
		        	break;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        if(i != list.size()) {
        	JOptionPane.showMessageDialog(null, "未知原因，数据更新失败！");
    		response.sendRedirect("../jsp/managerOpen.jsp");
    		return;
    	} else {
    		sc.setAttribute("num", num);
    		JOptionPane.showMessageDialog(null, "数据更新成功！符合条件人数： " + num);
    		response.sendRedirect("../jsp/managerOpen.jsp");
    		return;
    	}
	}

}
