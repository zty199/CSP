package cn.edu.njust.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
 
import cn.edu.njust.dao.*;
import cn.edu.njust.bean.*;
 
public class ConfirmServlet extends HttpServlet {
 
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println("come to the servlet");
		@SuppressWarnings("resource")
		HSSFWorkbook wb = new HSSFWorkbook();
		// 在workbook中添加一个sheet，对应Excel中的一个sheet
		HSSFSheet sheet = wb.createSheet("XXX表");
		// 在sheet中添加表头第0行，老版本poi对excel行数列数有限制short
		HSSFRow row = sheet.createRow((int) 0);
		// 创建单元格，设置值表头，设置表头居中
		HSSFCellStyle style = wb.createCellStyle();
		// 居中格式
		style.setAlignment(HorizontalAlignment.CENTER);
		// 设置表头

		String[] titles = {"序号","学号","姓名","身份证号"};
		HSSFCell cell;
		for(int x=0;x<titles.length;x++){
		    cell = row.createCell(x);
		    cell.setCellValue(titles[x]);
			cell.setCellStyle(style);
		}
		//生成excel格式后要将数据写入excel：
		// 循环将数据写入Excel
		ConfirmDao dao = new ConfirmDao();
		List<Confirm> list = null;
		try {
			list = dao.getAllConfirm();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		for (int i = 0; i < list.size(); i++) {
		    row = sheet.createRow((int) i + 1);
		    Confirm con = list.get(i);
		    row.createCell(0).setCellValue(i+1);
		    row.createCell(1).setCellValue(con.getStuID());
		    row.createCell(2).setCellValue(con.getStuName());
		    row.createCell(3).setCellValue(con.getIDnumber());
		}
 
		//弹出下载框
 
		String fileName = "Confirm";
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		wb.write(os);
		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		// 设置response参数，可以打开下载页面
		response.reset();
		//设置编码格式
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		response.setHeader("Content-Disposition", "attachment;filename=" + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
		ServletOutputStream out1 = response.getOutputStream();
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		 
		try {
		    bis = new BufferedInputStream(is);
		    bos = new BufferedOutputStream(out1);
		    byte[] buff = new byte[2048];
		    int bytesRead;
		    // Simple read/write loop.
		    while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
		          bos.write(buff, 0, bytesRead);
		    }
		} catch (Exception e) {
		    // TODO: handle exception
		    e.printStackTrace();
		} finally {
		     if (bis != null) {
		    	 bis.close();
		     }
		     if (bos != null) {
		    	 bos.close();
		     }
		}   
	}

}