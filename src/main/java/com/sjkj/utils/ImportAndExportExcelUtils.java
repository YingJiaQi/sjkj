package com.sjkj.utils;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * @author yjq
 * @param   response   
 * @param   dataList    需要导出的数据集合
 * @param   exportFileName   导出excel文件名
 * @param   headers     导出excel文件的头信息。例String[] headers = new String[] { "id#计划id", ...}
 *
 */
public class ImportAndExportExcelUtils {
	private static Logger log = LoggerFactory.getLogger(ImportAndExportExcelUtils.class);
	public static void exportExcel(HttpServletResponse response, List<?> dataList, String exportFileName, String[] headers){

		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String sdate = sf.format(date);
		String fileName = exportFileName +"_" + sdate + ".xlsx";
		// 设置导出Excel报表的导出形式
		response.setContentType("application/vnd.ms-excel,charset=utf-8");
		response.setHeader("Content-disposition", "attachment;filename=" + fileName);
		// 获取输出流
		OutputStream os = null;
		try {
			os = response.getOutputStream();
		} catch (IOException e1) {
			log.error("IOException: " + e1);
			throw new CustomRuntimeException(e1.getMessage());
		}
		SXSSFWorkbook workbook = new SXSSFWorkbook();
		try {
			Sheet sheet = workbook.createSheet();

			Row rowHead = sheet.createRow(0);
			Cell cellHead = null;
			if (headers != null && headers.length > 0) {
				for (int i = 0; i < headers.length; i++) {
					cellHead = rowHead.createCell(i);
					cellHead.setCellValue(headers[i].split("#")[1]);
				}
			}
			Row row = null;
			Cell cellInfo = null;
			Method method = null;
			Object objValue = null;
			for (int j = 0; j < dataList.size(); j++) {
				row = sheet.createRow(j + 1);
				Object obj = dataList.get(j);
				for (int m = 0; m < headers.length; m++) {
					cellInfo = row.createCell(m);
					String[] str = headers[m].split("#");
					String first = str[0].substring(0, 1);
					
					method = obj.getClass().getMethod("get" + first.toUpperCase() + str[0].substring(1));
					objValue = method.invoke(obj);
					if (method.getReturnType().getName() == "java.util.Date") {
						if (objValue != null) {

							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String format = sdf.format((Date) objValue);
							String strValue = objValue == null ? "" : format;
							cellInfo.setCellType(Cell.CELL_TYPE_STRING);
							cellInfo.setCellValue(strValue);
						}
					} else {
						cellInfo.setCellValue(objValue == null ? ""
								: objValue.toString().equals("null") ? ""
										: objValue.toString().replaceAll("(\r\n|\r|\n|\n\r)", ""));
					}
				}
			}
			workbook.write(os);
			os.close();
			workbook.close();
		} catch (FileNotFoundException e) {
			log.error("FileNotFoundException: " + e);
			throw new CustomRuntimeException(e.getMessage());
		} catch (IOException e) {
			log.error("IOException: " + e);
			throw new CustomRuntimeException(e.getMessage());
		} catch (SecurityException e) {
			log.error("SecurityException: " + e);
			throw new CustomRuntimeException(e.getMessage());
		} catch (IllegalArgumentException e) {
			log.error("IllegalArgumentException: " + e);
			throw new CustomRuntimeException(e.getMessage());
		} catch (NoSuchMethodException e) {
			log.error("NoSuchMethodException: " + e);
			throw new CustomRuntimeException(e.getMessage());
		} catch (IllegalAccessException e) {
			log.error("IllegalAccessException: " + e);
			throw new CustomRuntimeException(e.getMessage());
		} catch (InvocationTargetException e) {
			log.error("InvocationTargetException: " + e);
			throw new CustomRuntimeException(e.getMessage());
		}
	
	}
	/**
	 * @author yjq
	 * @param   myfile    导入的文件
	 * @param   request    
	 * @param   obj        范类 
	 * @param   methodName  执行导入到数据库的service方法
	 * @param   header   	excel头信息，核验使用
	 *
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> ImportExcel(CommonsMultipartFile myfile,String obj,String methodName, String header){
		Object bean = SpringContextUtil.getBean(obj);
		Map<String, Object> result = new HashMap<String, Object>();
		return result;
	}
}
