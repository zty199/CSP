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
	
	List<Student> list1 = new ArrayList<Student>();
	List<Confirm> list2 = new ArrayList<Confirm>();
	
	public List<Student> getList1() {
		return list1;
	}

	public void setList1(List<Student> list1) {
		this.list1 = list1;
	}

	public List<Confirm> getList2() {
		return list2;
	}

	public void setList2(List<Confirm> list2) {
		this.list2 = list2;
	}

	/*
	 * inout: .xls文件路径
	 * output: List<Student>
	 * 
	 */
	@SuppressWarnings("null")
	public void readXls(String path, String grade) throws IOException {
        InputStream is = new FileInputStream(path);
        @SuppressWarnings("resource")
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
        Student student = null;
        Confirm con = null;
        
        // 循环工作表Sheet
        for (int numSheet = 2; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
            if (hssfSheet == null) {
                continue;
            }
            // 循环行Row
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow != null) {
                    student = new Student();
                    HSSFCell stuID = hssfRow.getCell(1);
                    HSSFCell name = hssfRow.getCell(2);
                    HSSFCell IDnum = hssfRow.getCell(3);
                    
                    String stuid = getValue(stuID);
                    String stuname = getValue(name);
                    String idnum = getValue(IDnum);
                    
                    con.setStuID(stuid);
                    con.setStuName(stuname);
                    con.setIDnumber(idnum);
                    list2.add(con);
                    
                    student.setStuID(stuid);
                    student.setStuName(stuname);
                    student.setStuPassword(stuid);
                    student.setStuPersonID(idnum);
                    student.setPubFree(true);
                    student.setScoreNum(0);
                    student.setUsedNum(0);
                    
                    list1.add(student);
                }
            }
        }
        //return list;
    }
    
     @SuppressWarnings("static-access")
    private String getValue(HSSFCell hssfCell) {
            if (hssfCell.getCellType() == CellType.BOOLEAN) {
                // 返回布尔类型的值
                return String.valueOf(hssfCell.getBooleanCellValue());
            } else if (hssfCell.getCellType() == CellType.STRING) {
                // 返回数值类型的值
                return String.valueOf(hssfCell.getNumericCellValue());
            } else {
                // 返回字符串类型的值
                return String.valueOf(hssfCell.getStringCellValue());
            }
        }

}