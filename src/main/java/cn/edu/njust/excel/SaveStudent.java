package cn.edu.njust.excel;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import cn.edu.njust.bean.*;
import cn.edu.njust.dao.*;

public class SaveStudent {
	
    public void save(String path, String grade) throws IOException, SQLException {
        ReadStudentExcel xlsMain = new ReadStudentExcel();
        StudentDao d = new StudentDao();
        System.out.println(grade);
        xlsMain.readXls(path, grade);
        List<Student> list = xlsMain.getList1();
        System.out.println("saveing...");
        for (int i = 0; i < list.size(); i++) {
        	Student stu = list.get(i);
            System.out.println(stu.getStuID());
            if (!d.isValid(stu.getStuID(), stu.getStuPassword())) {
            	d.addStudent(stu);
            } else {
                System.out.println("The Record was Existed, and has been thrown away!");
            }
        }
    }

}