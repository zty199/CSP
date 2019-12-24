package cn.edu.njust.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import cn.edu.njust.bean.*;
import cn.edu.njust.dao.*;

public class IntentionServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        ConfirmDao dao = new ConfirmDao();
        if(request.getParameterValues("stuID") == null) {
        	out.print("<script>");
			out.print("alert('Please check what you want to add to ConfirmList.');");
			out.print("window.location.href='/CSP/jsp/managerIntention.jsp'");
			out.print("</script>");
			out.close();
        } else {
        	String stuid[] = request.getParameterValues("stuID");
        	int i;
        	for(i = 0; i < stuid.length; i++) {
        		try {
        			if(!dao.isListed(stuid[i]) && dao.addConfirm(stuid[i])) {
        				StudentDao dao1 = new StudentDao();
        				Student student = dao1.getInfo(stuid[i]);
        				student.setPubFree(false);
        				if(!dao1.updateQuality(student)) {
            			    break;
        				}
        			} else {
        			    break;
        			}
        		} catch (SQLException e) {
        			e.printStackTrace();
        		}
        	}
        	if(i == stuid.length) {
        		JOptionPane.showMessageDialog(null, "添加成功！");
    			response.sendRedirect("../jsp/managerIntention.jsp");
    		    return;
        	} else {
				JOptionPane.showMessageDialog(null, "未知原因，添加失败！");
			    response.sendRedirect("../jsp/managerIntention.jsp");
        		return;
        	}
        }
	}

}