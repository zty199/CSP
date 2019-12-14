package cn.edu.njust.excel;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
 
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;

import cn.edu.njust.bean.*;
import cn.edu.njust.dao.*;

public class ReadScoreExcel {

	/*
	 * inout: .xls文件路径 and session
	 * output: List<Student>
	 * 
	 */
	public List<Score> readXls(String path, String session) throws IOException {
        InputStream is = new FileInputStream(path);
        @SuppressWarnings("resource")
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
        Score score = new Score();
        StudentDao dao1 = new StudentDao();
        List<Score> list = new ArrayList<Score>();
        // 循环工作表Sheet
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
            if (hssfSheet == null) {
                continue;
            }
            // 循环行Row
            for (int rowNum = 2; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow != null) {
                    score = new Score();
                    HSSFCell IDnum = hssfRow.getCell(3);
                    HSSFCell all_sc = hssfRow.getCell(11);
                    HSSFCell first = hssfRow.getCell(12);
                    HSSFCell second = hssfRow.getCell(13);
                    HSSFCell third = hssfRow.getCell(14);
                    HSSFCell fourth = hssfRow.getCell(15);
                    HSSFCell fifth = hssfRow.getCell(16);
                    HSSFCell rank_1 = hssfRow.getCell(17);
                    HSSFCell rank_all = hssfRow.getCell(18);
                    String ID = getValue(IDnum);
                    try {
						String stuID = dao1.getStuID(ID);
						if(!stuID.equals("NO")) {
							score.setSession(session);
							score.setStuID(stuID);
							score.setTotal_score(Integer.parseInt(getValue(all_sc)));
							score.setScore_1(Integer.parseInt(getValue(first)));
							score.setScore_2(Integer.parseInt(getValue(second)));
							score.setScore_3(Integer.parseInt(getValue(third)));
							score.setScore_4(Integer.parseInt(getValue(fourth)));
							score.setScore_5(Integer.parseInt(getValue(fifth)));
							score.setCur_rank(getValue(rank_1));
							score.setAll_rank(getValue(rank_all));
							list.add(score);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                }
            }
        }
		return list;
    }
    
    private String getValue(HSSFCell hssfCell) {
    	if (hssfCell.getCellType() == CellType.BOOLEAN) {
        	// 返回布尔类型的值
        	return String.valueOf(hssfCell.getBooleanCellValue());
        } else if (hssfCell.getCellType() == CellType.NUMERIC) {
        	// 返回数值类型的值
        	return String.valueOf(hssfCell.getNumericCellValue());
        } else {
        	// 返回字符串类型的值
        	return String.valueOf(hssfCell.getStringCellValue());
        }
     }

}
