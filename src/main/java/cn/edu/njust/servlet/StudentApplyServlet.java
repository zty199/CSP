package cn.edu.njust.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import cn.edu.njust.dao.*;
import cn.edu.njust.bean.*;

public class StudentApplyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        Student student = (Student) request.getSession().getAttribute("user");
        IntentionDao itt = new IntentionDao();
        ConfirmDao cf = new ConfirmDao();
        try {
			if(itt.isListed(student.getStuID()) || cf.isListed(student.getStuID())) {
				JOptionPane.showMessageDialog(null, "您已经参与团报！");
	        	response.sendRedirect("../jsp/studentApply.jsp");
	        	return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if(student.getPubFree() == false && student.getScoreNum() <= 0) {
        	JOptionPane.showMessageDialog(null, "您没有公费考试资格！");
        	response.sendRedirect("../jsp/studentMain.jsp");
        	return;
        } else {
        	if(student.getScoreNum() > 0) {
        		student.setUsedNum(student.getUsedNum() + 1);
        		student.setScoreNum(student.getScoreNum() - 1);
        		StudentDao dao = new StudentDao();
        		try {
        			if(dao.updateQuality(student)) {
        				ConfirmDao dao1 = new ConfirmDao();
        				if(dao1.addConfirm(student.getStuID())) {
        					JOptionPane.showMessageDialog(null, "团报成功，您已进入公费考试名单！");
        					response.sendRedirect("../jsp/studentMain.jsp");
        					return;
        				} else {
        					JOptionPane.showMessageDialog(null, "未知原因，团报名单添加失败！请联系管理员！");
        					response.sendRedirect("../jsp/studentApply.jsp");
        					return;
        				}	
					} else {
						JOptionPane.showMessageDialog(null, "未知原因，用户数据更新失败！");
		            	response.sendRedirect("../jsp/studentApply.jsp");
		            	return;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	} else {
        		if(student.getPubFree() == true) {
        			student.setPubFree(false);
        			StudentDao dao = new StudentDao();
        			try {
        				if(dao.updateQuality(student)) {
        					IntentionDao dao1 = new IntentionDao();
        					dao1.addIntention(student.getStuID());
        					if(dao1.addIntention(student.getStuID())) {
        						JOptionPane.showMessageDialog(null, "团报成功，您需要参加选拔考试！");
        		            	response.sendRedirect("../jsp/studentMain.jsp");
        		            	return;
        					} else {
        						JOptionPane.showMessageDialog(null, "未知原因，考核名单添加失败！请联系管理员！");
            					response.sendRedirect("../jsp/studentApply.jsp");
            					return;
        					}
        				} else {
        					JOptionPane.showMessageDialog(null, "未知原因，用户数据更新失败！");
        					response.sendRedirect("../jsp/studentApply.jsp");
        					return;
        				}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
        		}
        	}
        }
	}

}
