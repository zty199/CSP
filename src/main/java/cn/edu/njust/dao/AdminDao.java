package cn.edu.njust.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.njust.bean.*;
import cn.edu.njust.dao.DbUtil;

public class AdminDao {
	
	public List<Admin> getAllAdmin() throws SQLException {
        List<Admin> list = new ArrayList<Admin>();
        String sql = "select * from manager";
        Connection conn = DbUtil.getCon();        
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            	Admin admin = new Admin();
            	admin.setAdminID(rs.getString("jobID"));
            	admin.setAdminPassword(rs.getString("password"));
            	admin.setAdminGrade(rs.getString("grade"));
                list.add(admin);
            }
            rs.close();
        	pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        conn.close();
        return list;
    }

	public Admin getInfo(String adminID) throws SQLException {
        String sql = "select * from manager where jobID = '" + adminID + "'";
        Connection conn = DbUtil.getCon();
        Admin admin = new Admin();
        try {
        	PreparedStatement pst = conn.prepareStatement(sql);
        	ResultSet rs = pst.executeQuery();
        	while(rs.next()) {
        		admin.setAdminID(rs.getString("jobID"));
            	admin.setAdminPassword(rs.getString("password"));
            	admin.setAdminGrade(rs.getString("grade"));
        	}
        	rs.close();
        	pst.close();
        } catch (SQLException e) {
    		e.printStackTrace();
    	}
        conn.close();
        return admin;
    }
	
	/*public boolean isRegistered(String adminID) throws SQLException {
		String sql = "select * from manager where jobID = '" + adminID + "'";
		Connection conn = DbUtil.getCon();
		Admin admin = new Admin();
    	try {
    		PreparedStatement pst = conn.prepareStatement(sql);
    		ResultSet rs = pst.executeQuery();
    		while (rs.next()) {
    			admin.setAdminID(rs.getString("jobID"));
    		}
    		rs.close();
    		pst.close();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	conn.close();
    	if(admin.getAdminID() != null && admin.getAdminID().equals(adminID))
    		return true;
    	else
    		return false;
	}*/
	
	public boolean isValid(String adminID, String adminPassword) throws SQLException {
		String sql = "select * from manager where jobID = '" + adminID + "'";
		Connection conn = DbUtil.getCon();
		Admin admin = new Admin();
    	try {
    		PreparedStatement pst = conn.prepareStatement(sql);
    		ResultSet rs = pst.executeQuery();
    		while (rs.next()) {
    			admin.setAdminID(rs.getString("jobID"));
            	admin.setAdminPassword(rs.getString("password"));
    		}
    		rs.close();
    		pst.close();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	conn.close();
    	if(admin.getAdminID() != null && admin.getAdminID().equals(adminID) && admin.getAdminPassword().equals(adminPassword))
    		return true;
    	else
    		return false;
	}
	
	/*public boolean addAdmin(Admin admin) throws SQLException {
    	String sql = "insert into manager(jobID, password, grade) values (?, ?, ?)";
    	Connection conn = DbUtil.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, admin.getAdminID());
    		pst.setString(2, admin.getAdminPassword());
    		pst.setString(3, admin.getAdminGrade());
    		int flag = pst.executeUpdate();
    		pst.close();
    		conn.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		conn.close();
    		return false;
    	}
    }
	
	public boolean modifyAdmin(Admin admin, String temp) throws SQLException {
    	String sql = "update manager set jobID = ?, password = ?, grade = ? where jobID = ?";
    	Connection conn = DbUtil.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, admin.getAdminID());
    		pst.setString(2, admin.getAdminPassword());
    		pst.setString(3, admin.getAdminGrade());
    		pst.setString(4, temp);
    		int flag = pst.executeUpdate();
    		pst.close();
    		conn.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		conn.close();
    		return false;
    	}
    }
	
	public boolean delAdmin(String adminID) throws SQLException {
    	String sql = "delete from manager where jobID = '" + adminID + "'";
    	Connection conn = DbUtil.getCon();
    	try {
    		PreparedStatement pst = conn.prepareStatement(sql);
    		int flag = pst.executeUpdate();
    		pst.close();
    		conn.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		conn.close();
    		return false;
    	}
    }*/
	
	public List<Student> getGradeStudent(String grade) throws SQLException {
		List<Student> list = new ArrayList<Student>();
		Connection conn = DbUtil.getCon();
		if(grade.equals("0000")) {
			String sql = "select stuID, name, grade from stu_overview";  
	        try {
	            PreparedStatement pst = conn.prepareStatement(sql);
	            ResultSet rs = pst.executeQuery();
	            while(rs.next())
	            {
	            	Student student = new Student();
	            	student.setStuID(rs.getString("stuID"));
	            	student.setStuName(rs.getString("name"));
	            	student.setStuGrade(rs.getString("grade"));
	            	list.add(student);
	            }
	            rs.close();
	            pst.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		} else {
			String sql = "select stuID, name, grade from stu_overview where grade = '" + grade + "'";
	        try {
	            PreparedStatement pst = conn.prepareStatement(sql);
	            ResultSet rs = pst.executeQuery();
	            while(rs.next())
	            {
	            	Student student = new Student();
	            	student.setStuID(rs.getString("stuID"));
	            	student.setStuName(rs.getString("name"));
	            	student.setStuGrade(grade);
	            	list.add(student);
	            }
	            rs.close();
	         	pst.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		}
        conn.close();
        return list;
	}

}
