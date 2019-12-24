package cn.edu.njust.excel;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import cn.edu.njust.bean.*;
import cn.edu.njust.dao.*;

public class SaveStudent {
	
    public void save(String path, String grade) throws IOException, SQLException {
        ReadStudentExcel xlsMain = new ReadStudentExcel();
        xlsMain.readXls(path, grade);
        StudentDao dao = new StudentDao();
        List<Student> list = xlsMain.getList();
        System.out.println("Saving...");
        System.out.println("StudentGrade: " + grade);
        for (int i = 0; i < list.size(); i++) {
        	Student stu = list.get(i);
            if (!dao.isListed(stu.getStuID())) {
            	dao.addStudent(stu);
            } else {
                System.out.println("The record exists, and has been thrown away!");
            }
        }
    }

}