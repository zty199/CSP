package cn.edu.njust.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.njust.bean.*;

public class ConfirmDao {

	public List<Confirm> getAllConfirm(String stuID) throws SQLException {
		List<Confirm> list = new ArrayList<Confirm>();
    	String sql = "select stu_overview.stuID, stu_overview.name,stu_overview.IDnumber from stu_overview join confirm_list on stu_overview.stuID = confirm_list.stuID where stu_overview.stuID = '" + stuID + "'";
    	Connection conn = DbUtil.getCon();   
        try {
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery();
             while(rs.next()) {
             	Confirm confirm = new Confirm();
             	confirm.setStuID(rs.getString("stuID"));
             	confirm.setStuName(rs.getString("name"));
             	confirm.setIDnumber(rs.getString("IDnumber"));
                list.add(confirm);
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }
         return list;
    }
	
	public List<Confirm> getAllConfirm() throws SQLException {
		List<Confirm> list = new ArrayList<Confirm>();
    	String sql = "select stu_overview.stuID, stu_overview.name,stu_overview.IDnumber from stu_overview join confirm_list on stu_overview.stuID = confirm_list.stuID";
    	Connection conn = DbUtil.getCon();   
        try {
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery();
             while(rs.next()) {
             	Confirm confirm = new Confirm();
             	confirm.setStuID(rs.getString("stuID"));
             	confirm.setStuName(rs.getString("name"));
             	confirm.setIDnumber(rs.getString("IDnumber"));
                list.add(confirm);
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }
         return list;
    }

	public Confirm getSelectedConfirm(String stuID) throws SQLException {
        String sql = "select stuID, name, IDnumber where stuID = '" + stuID + "'";
        Connection conn = DbUtil.getCon();
        Confirm confirm = new Confirm();
        try {
        	PreparedStatement pst = conn.prepareStatement(sql);
        	ResultSet rs = pst.executeQuery();
        	while(rs.next()) {
        		confirm.setStuID(rs.getString("stuID"));
             	confirm.setStuName(rs.getString("name"));
             	confirm.setIDnumber(rs.getString("IDnumber"));
        	}
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return confirm;
    }

    public boolean modifyConfirmInfo(String stuID, String name, String IDnumber) throws SQLException {
    	String sql = "update confirm_list set name = ? where stuID = " + stuID + "";
    	Connection conn = DbUtil.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, name);
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
	}

	//删除没想好咋做
	public boolean deleteConfirm(String stuID) throws SQLException {
    	String sql = "delete from confirm_list where stuID = '" + stuID + "'";
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

	//增加confirm信息
	public boolean addConfirm(Confirm con) throws SQLException {
    	String sql = "insert into confirm_list(stuID, name, IDnumbe) values (?, ?, ?)";
    	Connection conn = DbUtil.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, con.getStuID());
    		pst.setString(2, con.getStuName());
    		pst.setString(3, con.getIDnumber());
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
	
	public boolean addConfirm(String stuid) throws SQLException {
    	String sql = "insert into confirm_list(stuID, name, IDnumbe) values (?, ?, ?)";
    	Connection conn = DbUtil.getCon();
    	try {
    		StudentDao dao = new StudentDao();
    		Student stu = dao.getInfo(stuid);
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, stu.getStuID());
    		pst.setString(2, stu.getStuName());
    		pst.setString(3, stu.getStuPersonID());
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }

}
