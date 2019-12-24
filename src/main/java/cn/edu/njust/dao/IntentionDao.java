package cn.edu.njust.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.njust.bean.*;

public class IntentionDao {

	public List<Intention> getAllIntention(String stuID) throws SQLException {
		List<Intention> list = new ArrayList<Intention>();
    	String sql = "select stu_overview.stuID, stu_overview.name,intention from stu_overview join intention_list on stu_overview.stuID = intention_list.stuID where stu_overview.stuID = '" + stuID + "'";
    	Connection conn = DbUtil.getCon();   
        try {
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery();
             while(rs.next()) {
             	Intention intention = new Intention();
             	intention.setStuID(rs.getString("stuID"));
             	intention.setName(rs.getString("name"));
             	intention.setIntention(rs.getInt("intention"));
                list.add(intention);
             }
             rs.close();
             pst.close();
             conn.close();
         } catch (SQLException e) {
             e.printStackTrace();
         }
         return list;
    }
	
	//得到csp的所有intention
	public List<Intention> getAllIntention() throws SQLException {
		List<Intention> list = new ArrayList<Intention>();
	    String sql = "select stu_overview.stuID, stu_overview.name, intention from stu_overview join intention_list on stu_overview.stuID = intention_list.stuID";
	    Connection conn = DbUtil.getCon();   
	    try {
	    	PreparedStatement pst = conn.prepareStatement(sql);
	    	ResultSet rs = pst.executeQuery();
	    	while(rs.next()) {
	    		Intention intention = new Intention();
	    		intention.setStuID(rs.getString("stuID"));
	    		intention.setName(rs.getString("name"));
	    		intention.setIntention(rs.getInt("intention"));
	    		list.add(intention);
	    	}
	    	rs.close();
            pst.close();
            conn.close();
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	    return list;
	}

	public Intention getSelectedIntention(String stuID) throws SQLException {
        String sql = "select stuID, name, intention from intention_list where stuID = '" + stuID + "'";
        Connection conn = DbUtil.getCon();
        Intention intention = new Intention();
        try {
        	PreparedStatement pst = conn.prepareStatement(sql);
        	ResultSet rs = pst.executeQuery();
        	while(rs.next()) {
        		intention.setStuID(rs.getString("stuID"));
             	intention.setName(rs.getString("name"));
             	intention.setIntention(rs.getInt("intention"));
        	}
        	rs.close();
            pst.close();
            conn.close();
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return intention;
    }
	
	public boolean isListed(String stuID) throws SQLException {
		String sql = "select * from intention_list where stuID = '" + stuID + "'";
		Connection conn = DbUtil.getCon();
		Intention intention = new Intention();
    	try {
    		PreparedStatement pst = conn.prepareStatement(sql);
    		ResultSet rs = pst.executeQuery();
    		while (rs.next()) {
    			intention.setStuID(rs.getString("stuID"));
    		}
    		rs.close();
    		pst.close();
    		conn.close();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	if(intention.getStuID() != null && intention.getStuID().equals(stuID))
    		return true;
    	else
    		return false;
	}

    public boolean modifyIntentionInfo(String stuID, String name, int intention) throws SQLException {
    	String sql = "update intention_list set name = ? where stuID = '" + stuID + "'";
    	Connection conn = DbUtil.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, name);
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

	//删除没想好咋做
	public boolean deleteIntention(String stuID) throws SQLException {
    	String sql = "delete from intention_list where stuID = '" + stuID + "'";
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
    }
	
	//通过学号添加Intention表
	public boolean addIntention(Student student) throws SQLException {
		String sql = "insert into intention_list(stuID, name, intention) values (?, ?, ?)";
		Connection conn = DbUtil.getCon();
		try {
		    PreparedStatement pst = conn.prepareStatement(sql);
		    pst.setString(1, student.getStuID());
		    pst.setString(2, student.getStuName());
		    pst.setBoolean(3, false);
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

}
