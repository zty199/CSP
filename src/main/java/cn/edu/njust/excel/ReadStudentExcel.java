package cn.edu.njust.excel;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
 
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;

import cn.edu.njust.bean.*;

public class ReadStudentExcel {
	
	private List<Student> list = new ArrayList<Student>();
	
	public List<Student> getList() {
		return list;
	}

	public void setList(List<Student> list) {
		this.list = list;
	}
	/*
	 * inout: .xls文件路径
	 * output: List<Student>
	 * 
	 */
	public void readXls(String path, String grade) throws IOException {
        InputStream is = new FileInputStream(path);
        @SuppressWarnings("resource")
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
        System.out.println("Reading...");
        // 循环工作表Sheet
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
            if (hssfSheet == null) {
                continue;
            }
            // 循环行Row
            System.out.println(hssfSheet.getLastRowNum());
            for (int rowNum = 1; rowNum < hssfSheet.getLastRowNum(); rowNum++) {
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow != null && getValue(hssfRow.getCell(0)) != "") {
                    Student student = new Student();
                    HSSFCell stuID = hssfRow.getCell(1);
                    HSSFCell name = hssfRow.getCell(2);
                    HSSFCell IDnum = hssfRow.getCell(3);
                    String stuid = getValue(stuID);
                    String stuname = getValue(name);
                    String idnum = getValue(IDnum);
                    student.setStuID(stuid);
                    student.setStuName(stuname);
                    student.setStuPassword(stuid);
                    student.setStuGrade(grade);
                    student.setStuPersonID(idnum);
                    student.setPubFree(true);
                    student.setScoreNum(0);
                    student.setUsedNum(0);
                    list.add(student);
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