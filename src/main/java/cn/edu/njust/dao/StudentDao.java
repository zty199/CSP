package cn.edu.njust.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.njust.bean.*;
import cn.edu.njust.dao.DbUtil;

public class StudentDao {
	
	public List<Student> getAllStudent() throws SQLException {
        List<Student> list = new ArrayList<Student>();
        String sql = "select * from stu_overview";
        Connection conn = DbUtil.getCon();        
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            	Student student = new Student();
            	student.setStuID(rs.getString("stuID"));
        		student.setStuPassword(rs.getString("password"));
        		student.setStuName(rs.getString("name"));
        		student.setStuGrade(rs.getString("grade"));
        		student.setStuPersonID(rs.getString("IDnumber"));
        		student.setPubFree(rs.getBoolean("public_free"));
        		student.setUsedNum(rs.getInt("used_qual"));
        		student.setScoreNum(rs.getInt("score_qual"));
                list.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

	public Student getInfo(String stuID) throws SQLException {
        String sql = "select * from stu_overview where stuID = '" + stuID + "'";
        Connection conn = DbUtil.getCon();
        Student student = new Student();
        try {
        	PreparedStatement pst = conn.prepareStatement(sql);
        	ResultSet rs = pst.executeQuery();
        	while(rs.next()) {
        		student.setStuID(rs.getString("stuID"));
        		student.setStuPassword(rs.getString("password"));
        		student.setStuName(rs.getString("name"));
        		student.setStuGrade(rs.getString("grade"));
        		student.setStuPersonID(rs.getString("IDnumber"));
        		student.setPubFree(rs.getBoolean("public_free"));
        		student.setUsedNum(rs.getInt("used_qual"));
        		student.setScoreNum(rs.getInt("score_qual"));
        	}
        	rs.close();
        	pst.close();
        } catch (SQLException e) {
    		e.printStackTrace();
    	}
        return student;
    }
	
	public String getStuID(String IDnumber) throws SQLException {
		String sql = "select * from stu_overview where IDNumber = '" + IDnumber + "'";
        Connection conn = DbUtil.getCon();
        String stuID = "NO";
        try {
        	PreparedStatement pst = conn.prepareStatement(sql);
        	ResultSet rs = pst.executeQuery();
        	while(rs.next()) {
        		stuID = rs.getString("StuID");
        	}
        	rs.close();
        	pst.close();
        } catch (SQLException e) {
    		e.printStackTrace();
    	}
        return stuID;
	}
	
	public boolean isListed(String stuID) throws SQLException {
		String sql = "select * from stu_overview where stuID = '" + stuID + "'";
		Connection conn = DbUtil.getCon();
		Student student = new Student();
    	try {
    		PreparedStatement pst = conn.prepareStatement(sql);
    		ResultSet rs = pst.executeQuery();
    		while (rs.next()) {
    			student.setStuID(rs.getString("stuID"));
    		}
    		rs.close();
    		pst.close();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	if(student.getStuID() != null && student.getStuID().equals(stuID))
    		return true;
    	else
    		return false;
	}
	
	public boolean isValid(String stuID, String stuPassword) throws SQLException {
		String sql = "select * from stu_overview where stuID = '" + stuID + "'";
		Connection conn = DbUtil.getCon();
		Student student = new Student();
    	try {
    		PreparedStatement pst = conn.prepareStatement(sql);
    		ResultSet rs = pst.executeQuery();
    		while (rs.next()) {
    			student.setStuID(rs.getString("stuID"));
    			student.setStuPassword(rs.getString("password"));
    		}
    		rs.close();
    		pst.close();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	if(student.getStuID() != null && student.getStuID().equals(stuID) && student.getStuPassword().equals(stuPassword))
    		return true;
    	else
    		return false;
	}
	
	public boolean addStudent(Student student) throws SQLException {
    	String sql = "insert into stu_overview(stuID, password, name, grade, IDnumber, public_free, used_qual, score_qual) values (?, ?, ?, ?, ?, ?, ?, ?)";
    	Connection conn = DbUtil.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, student.getStuID());
    		pst.setString(2, student.getStuPassword());
    		pst.setString(3, student.getStuName());
    		pst.setString(4, student.getStuGrade());
    		pst.setString(5, student.getStuPersonID());
    		pst.setBoolean(6, student.getPubFree());
    		pst.setInt(7, student.getUsedNum());
    		pst.setInt(8, student.getScoreNum());
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
	
	public boolean modifyStudent(Student student, String temp) throws SQLException {
    	String sql = "update stu_overview set stuID = ?, password = ?, name = ?, grade = ?, IDnumber = ? where stuID = ?";
    	Connection conn = DbUtil.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, temp);
    		pst.setString(2, student.getStuPassword());
    		pst.setString(3, student.getStuName());
    		pst.setString(4, student.getStuGrade());
    		pst.setString(5, student.getStuPersonID());
    		pst.setString(6, student.getStuID());
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
	
	public boolean delStudent(String stuID) throws SQLException {
    	String sql = "delete from stu_overview where stuID = '" + stuID + "'";
    	Connection conn = DbUtil.getCon();
    	try {
    		PreparedStatement pst = conn.prepareStatement(sql);
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
	
	public boolean updateQuality(Student student) throws SQLException {
    	String sql = "update stu_overview set public_free = ?, used_qual = ?, score_qual = ? where stuID = ?";
    	Connection conn = DbUtil.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setBoolean(1, student.getPubFree());
    		pst.setInt(2, student.getUsedNum());
    		pst.setInt(3, student.getScoreNum());
    		pst.setString(4, student.getStuID());
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }

}
