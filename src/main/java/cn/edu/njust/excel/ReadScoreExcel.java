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

	private List<Score> list = new ArrayList<Score>();
	
	public List<Score> getList() {
		return list;
	}

	public void setList(List<Score> list) {
		this.list = list;
	}
	/*
	 * inout: .xls文件路径
	 * output: List<Student>
	 * 
	 */
	public void readXls(String path, String session) throws IOException {
        InputStream is = new FileInputStream(path);
        @SuppressWarnings("resource")
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
        System.out.println("Reading...");
        StudentDao dao = new StudentDao();
        // 循环工作表Sheet
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
            if (hssfSheet == null) {
                continue;
            }
            // 循环行Row
            for (int rowNum = 1; rowNum < hssfSheet.getLastRowNum(); rowNum++) {
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow != null && getValue(hssfRow.getCell(0)) != "") {
                	Score score = new Score();
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
						String stuID = dao.getStuID(ID);
						if(!stuID.equals("NO")) {
							score.setSession(session);
							score.setStuID(stuID);
							score.setTotal_score(Integer.parseInt(getValue(all_sc).substring(0, getValue(all_sc).length()-2)));
							score.setScore_1(Integer.parseInt(getValue(first).substring(0, getValue(first).length()-2)));
							score.setScore_2(Integer.parseInt(getValue(second).substring(0, getValue(second).length()-2)));
							score.setScore_3(Integer.parseInt(getValue(third).substring(0, getValue(third).length()-2)));
							score.setScore_4(Integer.parseInt(getValue(fourth).substring(0, getValue(fourth).length()-2)));
							score.setScore_5(Integer.parseInt(getValue(fifth).substring(0, getValue(fifth).length()-2)));
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
    }
    
    private String getValue(HSSFCell hssfCell) {
    	if (hssfCell.getCellType() == CellType.NUMERIC) {
        	// 返回数值类型的值
        	return String.valueOf(hssfCell.getNumericCellValue());
        } else {
        	// 返回字符串类型的值
        	return hssfCell.getStringCellValue();
        }
     }

}
