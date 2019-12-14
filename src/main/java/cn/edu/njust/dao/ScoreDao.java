package cn.edu.njust.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.njust.bean.Score;

public class ScoreDao {
	
	public List<Score> getAllScore(String stuID) throws SQLException {
		List<Score> list = new ArrayList<Score>();
    	String sql = "select stu_overview.stuID, stu_overview.name, session, total_score, score_1, score_2, score_3, score_4, score_5, current_rank, period_rank from stu_overview join score_overview on stu_overview.stuID = score_overview.stuID where stu_overview.stuID = '" + stuID + "'";
    	Connection conn = DbUtil.getCon();   
        try {
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery();
             while(rs.next()) {
             	Score score = new Score();
             	score.setStuID(rs.getString("stuID"));
             	score.setStuName(rs.getString("name"));
             	score.setSession(rs.getString("session"));
             	score.setTotal_score(rs.getInt("total_score"));
             	score.setScore_1(rs.getInt("score_1"));
             	score.setScore_2(rs.getInt("score_2"));
             	score.setScore_3(rs.getInt("score_3"));
             	score.setScore_4(rs.getInt("score_4"));
             	score.setScore_5(rs.getInt("score_5"));
             	score.setCur_rank(rs.getString("current_rank"));
             	score.setAll_rank(rs.getString("period_rank"));
                list.add(score);
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }
         return list;
    }
	
	public List<Score> getAllScore(String stuID, String session) throws SQLException {
		List<Score> list = new ArrayList<Score>();
    	String sql = "select stu_overview.stuID, stu_overview.name, session, total_score, score_1, score_2, score_3, score_4, score_5, current_rank, period_rank from stu_overview join score_overview on stu_overview.stuID = score_overview.stuID where stu_overview.stuID = '" + stuID + "' and session= '" + session + "'";
    	Connection conn = DbUtil.getCon();   
        try {
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery();
             while(rs.next()) {
             	Score score = new Score();
             	score.setStuID(rs.getString("stuID"));
             	score.setStuName(rs.getString("name"));
             	score.setSession(rs.getString("session"));
             	score.setTotal_score(rs.getInt("total_score"));
             	score.setScore_1(rs.getInt("score_1"));
             	score.setScore_2(rs.getInt("score_2"));
             	score.setScore_3(rs.getInt("score_3"));
             	score.setScore_4(rs.getInt("score_4"));
             	score.setScore_5(rs.getInt("score_5"));
             	score.setCur_rank(rs.getString("current_rank"));
             	score.setAll_rank(rs.getString("period_rank"));
                list.add(score);
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }
         return list;
    }
	
	public Score getSelectedScore(String stuID, int session) throws SQLException {
        String sql = "select stuID, session, total_score, score_1, score_2, score_3, score_4, score_5 from score_overview where stuID = '" + stuID + "' and session = " + session;
        Connection conn = DbUtil.getCon();
        Score score = new Score();
        try {
        	PreparedStatement pst = conn.prepareStatement(sql);
        	ResultSet rs = pst.executeQuery();
        	while(rs.next()) {
        		score.setStuID(rs.getString("stuID"));
        		score.setSession(rs.getString("session"));
        		score.setTotal_score(rs.getInt("total_score"));
        		score.setScore_1(rs.getInt("score_1"));
        		score.setScore_2(rs.getInt("score_2"));
        		score.setScore_3(rs.getInt("score_3"));
        		score.setScore_4(rs.getInt("score_4"));
        		score.setScore_5(rs.getInt("score_5"));
        	}
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return score;
    }
	
	//得到某次考试的所有学生成绩
	public List<Score> getSessionScore(String session) throws SQLException {
		String sql = "select stuID, session, total_score, score_1, score_2, score_3, score_4, score_5, current_rank, period_rank from score_overview where session = '" + session + "'";
		Connection conn = DbUtil.getCon();
		List<Score> list = new ArrayList<Score>();
		Score score = new Score();
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
	        	score.setStuID(rs.getString("stuID"));
	        	score.setSession(rs.getString("session"));
	        	score.setTotal_score(rs.getInt("total_score"));
	        	score.setScore_1(rs.getInt("score_1"));
	        	score.setScore_2(rs.getInt("score_2"));
	        	score.setScore_3(rs.getInt("score_3"));
	        	score.setScore_4(rs.getInt("score_4"));
	        	score.setScore_5(rs.getInt("score_5"));
	        	score.setCur_rank(rs.getString("current_rank"));
	            score.setAll_rank(rs.getString("period_rank"));
	            list.add(score);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}
		
	//插入score_overview
	public boolean addScore(Score sc) throws SQLException {
	    String sql = "insert into score_overview(stuID, session, total_score, score_1, score_2, score_3, score_4, score_5, current_rank, period_rank) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    Connection conn = DbUtil.getCon();
	    try {			
	    	PreparedStatement pst = conn.prepareStatement(sql);
	    	pst.setString(1, sc.getStuID());
	    	pst.setString(2, sc.getSession());
	    	pst.setInt(3, sc.getTotal_score());
	    	pst.setInt(4, sc.getScore_1());
	    	pst.setInt(5, sc.getScore_2());
	    	pst.setInt(6, sc.getScore_3());
	    	pst.setInt(7, sc.getScore_4());
	    	pst.setInt(8, sc.getScore_5());
	    	pst.setString(9, sc.getCur_rank());
	    	pst.setString(10, sc.getAll_rank());
	    	int flag = pst.executeUpdate();
	    	pst.close();
	    	return flag > 0 ? true : false;
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    	return false;
	    }
	}
    
    public boolean modifyScoreInfo(String stuID, String session, int score) throws SQLException {
    	String sql = "update score_overview set total_score = ? where stuID = " + stuID + " and session = " + session;
    	Connection conn = DbUtil.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setInt(1, score);
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
	}
    
	//删除没想好咋做
	public boolean delScore(String stuID) throws SQLException {
    	String sql = "delete from score_overview where stuID = '" + stuID + "'";
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

}
