package cn.edu.njust.excel;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import cn.edu.njust.bean.*;
import cn.edu.njust.dao.*;

public class SaveScore {
	
    public void save(String path, String session) throws IOException, SQLException {
        ReadScoreExcel xlsMain = new ReadScoreExcel();
        ScoreDao dao = new ScoreDao();
        List<Score> list1 = xlsMain.readXls(path, session);
        List<Score> list2 = dao.getSessionScore(session);
        for (int i = 0; i < list1.size(); i++) {
        	Score score = list1.get(i);
            //List l = DbUtil.selectOne(Common.SELECT_STUDENT_SQL + "'%" + student.getName() + "%'", student);
            if (!list2.contains(score)) {
            	dao.addScore(score);
            	list2.add(score);
                //DbUtil.insert(Common.INSERT_STUDENT_SQL, student);
            } else {
                System.out.println("The Record was Exist, and has been throw away!");
            }
        }
    }

}
