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
    	String sql = "select stu_overview.stuID, stu_overview.name, session, total_score, score_1, score_2, score_3, score_4, score_5 from stu_overview join score_overview on stu_overview.stuID = score_overview.stuID where stu_overview.stuID = '" + stuID + "'";
    	Connection conn = DbUtil.getCon();   
        try {
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery();
             while(rs.next()) {
             	Score score = new Score();
             	score.setStuID(rs.getString("stuID"));
             	score.setStuName(rs.getString("name"));
             	score.setSession(rs.getInt("session"));
             	score.setTotal_score(rs.getInt("total_score"));
             	score.setScore_1(rs.getInt("score_1"));
             	score.setScore_2(rs.getInt("score_2"));
             	score.setScore_3(rs.getInt("score_3"));
             	score.setScore_4(rs.getInt("score_4"));
             	score.setScore_5(rs.getInt("score_5"));
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
        		score.setSession(rs.getInt("session"));
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
	public boolean deleteScore(String stuID) throws SQLException {
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
