package cn.edu.njust.excel;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import cn.edu.njust.bean.*;
import cn.edu.njust.dao.*;

public class SaveScore {
	
    public void save(String path, String session) throws IOException, SQLException {
        ReadScoreExcel xlsMain = new ReadScoreExcel();
        xlsMain.readXls(path, session);
        ScoreDao dao = new ScoreDao();
        List<Score> list1 = xlsMain.getList();
        List<Score> list2 = dao.getSessionScore(session);
        System.out.println("Saving...");
        System.out.println("ScoreSession: " + session);
        for (int i = 0; i < list1.size(); i++) {
        	Score score = list1.get(i);
            if (!list2.contains(score)) {
            	dao.addScore(score);
            	list2.add(score);
            } else {
                System.out.println("The record exists, and has been thrown away!");
            }
        }
    }

}
