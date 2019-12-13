package cn.edu.njust.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import cn.edu.njust.dao.*;

public class ScoreModifyServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String stuID = (String) request.getParameter("stuID");
        int session = Integer.parseInt(request.getParameter("session"));
        int total_score = Integer.parseInt(request.getParameter("total_score"));
        ScoreDao dao = new ScoreDao();
        try {
			if(dao.modifyScoreInfo(request.getParameter("stuID"), request.getParameter("session"), total_score)) {
				JOptionPane.showMessageDialog(null, "修改成功！");
			    response.sendRedirect("../jsp/scoreModify.jsp?stuID=" + stuID + "&session=" + session);
			    return;
			} else {
				JOptionPane.showMessageDialog(null, "未知原因，修改失败！");
			    response.sendRedirect("../jsp/scoreModify.jsp?stuID=" + stuID + "&session=" + session);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
