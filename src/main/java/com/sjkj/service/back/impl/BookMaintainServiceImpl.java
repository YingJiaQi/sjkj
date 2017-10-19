package com.sjkj.service.back.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sjkj.dao.back.BookMaintainDao;
import com.sjkj.pojo.common.BookDetail;
import com.sjkj.service.back.BookMaintainService;
import com.sjkj.vo.PageBean;
import com.sun.corba.se.pept.encoding.InputObject;
@Service
public class BookMaintainServiceImpl implements BookMaintainService {
	@Autowired
	private BookMaintainDao bookMaintainDao;
	@Override
	public Map<String, Object> operateBook(HttpServletRequest param) {
		Map<String, Object> result = new HashMap<String,Object>();
		String oper = param.getParameter("oper");
		BookDetail bd = new BookDetail();
		String id = param.getParameter("id");
		if(StringUtils.equals(oper, "del")){
			bd.setId(id);
			result = deleteBookById(bd);
			return result;
		}
		bd.setBookName(param.getParameter("bookName"));
		bd.setBookAuthor(param.getParameter("bookAuthor"));
		bd.setBelongCategory(param.getParameter("belongCategory"));
		if(StringUtils.isNoneBlank(param.getParameter("sore"))){
			bd.setSore(new BigDecimal(param.getParameter("sore")));
		}
		if(StringUtils.isNoneBlank(param.getParameter("readTimes"))){
			bd.setReadTimes(Integer.parseInt(param.getParameter("readTimes")));
		}
		if(StringUtils.isNoneBlank(param.getParameter("agreeTimes"))){
			bd.setAgreeTimes(Integer.parseInt(param.getParameter("agreeTimes")));
		}
		if(StringUtils.isNoneBlank(param.getParameter("againstTimes"))){
			bd.setAgainstTimes(Integer.parseInt(param.getParameter("againstTimes")));
		}
		if(StringUtils.isNoneBlank(param.getParameter("collectTimes"))){
			bd.setCollectTimes(Integer.parseInt(param.getParameter("collectTimes")));
		}
		if(StringUtils.isNoneBlank(param.getParameter("buyTimes"))){
			bd.setBuyTimes(Integer.parseInt(param.getParameter("buyTimes")));
		}
		if(StringUtils.isNoneBlank(param.getParameter("bookSizes"))){
			bd.setBookSizes(new BigDecimal(param.getParameter("bookSizes")));
		}
		if(StringUtils.isNoneBlank(param.getParameter("price"))){
			bd.setPrice(new BigDecimal(param.getParameter("price")));
		}
		if(StringUtils.isNoneBlank(param.getParameter("isDone"))){
			bd.setIsDone(Integer.parseInt(param.getParameter("isDone")));
		}
		if(StringUtils.isNoneBlank(param.getParameter("isShare"))){
			if(StringUtils.equals(param.getParameter("isShare"), "yes")){
				bd.setIsShare(1);
			}else{
				bd.setIsShare(0);
			}
		}
		if(StringUtils.equals(oper, "edit")){
			bd.setId(id);
			result = updateBook(bd);
		}
		if(StringUtils.equals(oper, "add")){
			result = addBook(bd);
		}
		return result;
	}
	//删除记录
	public Map<String, Object> deleteBookById(BookDetail bd) {
		Map<String, Object> map = new HashMap<String, Object>();
		BookDetail selectByPrimaryKey = bookMaintainDao.selectByPrimaryKey(bd.getId());
		selectByPrimaryKey.setIsDel(1);
		selectByPrimaryKey.setUpdateTime(new Date());
		bookMaintainDao.updateByPrimaryKey(selectByPrimaryKey);
		map.put("msg", "删除记录成功");
		map.put("success", "true");
		return map;
	}
	//更新数据
	public Map<String, Object> updateBook(BookDetail bd) {
		Map<String, Object> map = new HashMap<String, Object>();
		BookDetail selectByPrimaryKey = bookMaintainDao.selectByPrimaryKey(bd.getId());
		bd.setCreateTime(selectByPrimaryKey.getCreateTime());
		bd.setUpdateTime(new Date());
		bd.setIsDel(selectByPrimaryKey.getIsDel());
		bookMaintainDao.updateByPrimaryKey(selectByPrimaryKey);
		map.put("msg", "更新记录成功");
		map.put("success", "true");
		return map;
	}
	//添加数据
	public Map<String, Object> addBook(BookDetail bd) {
		Map<String, Object> map = new HashMap<String, Object>();
		bd.setCreateTime(new Date());
		bd.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		bd.setIsDel(0);
		bd.setUpdateTime(new Date());
		bookMaintainDao.insert(bd);
		map.put("msg", "添加记录成功");
		map.put("success", "true");
		return map;
	}
	@Override
	public Map<String, Object> getBookList(PageBean pageBean) {
		Map<String, Object> result = new HashMap<String, Object>();
		String filters = pageBean.getFilters();
		List<Map<String,String>> mlist = new ArrayList<Map<String,String>>();//存储查询规则
		if(StringUtils.isNoneBlank(filters)){
			JSONObject jo = JSONObject.parseObject(filters);
			JSONArray ja = jo.getJSONArray("rules");
			Iterator<Object> iterator = ja.iterator();
			while(iterator.hasNext()){
				Map<String,String> map = new HashMap<String,String>();
				JSONObject parseObject = JSONObject.parseObject(iterator.next()+"");
				map.put("field", parseObject.get("field")+"");
				map.put("op", parseObject.get("op")+"");
				map.put("data", parseObject.get("data")+"");
				mlist.add(map);
			}
		}
		PageHelper.startPage(pageBean.getPage(), pageBean.getRows());
		StringBuffer sb = new StringBuffer(" 1 ");
		for(int j=0;j<mlist.size();j++){
			Map<String, String> map = mlist.get(j);
			String field = map.get("field");
			if(StringUtils.equals("bookName", field)){
				field = "book_name";
			}else if(StringUtils.equals("bookAuthor", field)){
				field = "book_author";
			}else if(StringUtils.equals("belongCategory", field)){
				field = "belong_category";
			}else if(StringUtils.equals("sore", field)){
				field = "sore";
			}else if(StringUtils.equals("readTimes", field)){
				field = "read_times";
			}else if(StringUtils.equals("agreeTimes", field)){
				field = "agree_times";
			}else if(StringUtils.equals("againstTimes", field)){
				field = "against_times";
			}else if(StringUtils.equals("collectTimes", field)){
				field = "collect_times";
			}else if(StringUtils.equals("buyTimes", field)){
				field = "buy_times";
			}else if(StringUtils.equals("bookSizes", field)){
				field = "book_sizes";
			}else if(StringUtils.equals("price", field)){
				field = "price";
			}else if(StringUtils.equals("isDone", field)){
				field = "is_done";
			}else if(StringUtils.equals("isShare", field)){
				field = "is_share";
			}
			String data = '"'+map.get("data")+'"';
			if(StringUtils.equals("eq", map.get("op"))){//等于
				sb.append(" and ").append(field).append("=").append(data);
			}
			if(StringUtils.equals("ne", map.get("op"))){//不等于
				sb.append(" and ").append(field).append("!=").append(data);
			}
			if(StringUtils.equals("bw", map.get("op"))){//开始于，暂时用途大于
				sb.append(" and ").append(field).append(">").append(data);
			}
			if(StringUtils.equals("in", map.get("op"))){//在参数内,多个参数用逗号相隔
				sb.append(" and ").append(field).append(" in(").append(map.get("data")).append(")");
			}
			if(StringUtils.equals("ni", map.get("op"))){//不在参数内,多个参数用逗号相隔
				sb.append(" and ").append(field).append(" not in(").append(map.get("data")).append(")");
			}
			if(StringUtils.equals("ew", map.get("op"))){//对束于，用作小于
				sb.append(" and ").append(field).append("<").append(data);
			}
			if(StringUtils.equals("cn", map.get("op"))){//包含
				sb.append(" and ").append(field).append(" like ").append("%"+data+"%");
			}
			if(StringUtils.equals("nc", map.get("op"))){//不包含
				sb.append(" and ").append(field).append(" not like ").append("%"+data+"%");
			}
		}
		List<BookDetail> dlist = bookMaintainDao.getBookByCondition(sb.toString());
		PageInfo<BookDetail> po = new PageInfo<BookDetail>(dlist);
		result.put("records", po.getTotal());
		result.put("page", pageBean.getPage());
		result.put("total", po.getTotal()/pageBean.getRows());//总页数
		result.put("rows", po.getList());
		return result;
	}
	public static void main(String[] args) throws IOException {
		//文件复制
		/*File file = new File("C:/Users/Think/Desktop/buckup书名.txt");
		String str="D:\\书名.txt"; 
		String replace = str.replace("\\\\", "/");
		InputStream is = new BufferedInputStream(new FileInputStream(new File(replace)));
		OutputStream os = new BufferedOutputStream(new FileOutputStream(file));
		if(!file.exists()){
			file.mkdirs();
		}
		byte[] b = new byte[1024];
		int len = 0;
		while((len = is.read(b))!= -1){
			os.write(b, 0, len);
		}
		os.flush();
		os.close();
		is.close();*/
		
		
		//将内容存储到磁盘文件中
/*		String str="D:\\_书名.txt"; 
		String replace = str.replace("\\\\", "/");
		File file = new File(replace);
		OutputStream os = new BufferedOutputStream(new FileOutputStream(replace));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(os, "utf-8"));
		bw.write("这是一个测试");
		bw.close();
		os.close();*/
		
		//读取磁盘文件里的内容，并显示
		String str="D:\\_书名.txt"; 
		String replace = str.replace("\\\\", "/");
		File file = new File(replace);
		InputStream is = new BufferedInputStream(new FileInputStream(file));
		Reader rr = new BufferedReader(new InputStreamReader(is, "utf-8"));
		char[] cbuf = new char[1024];
		int read = rr.read(cbuf);
		System.out.println(read);
		System.out.println(new String(cbuf).toString());
		rr.close();
		is.close();
	}
	@Override
	public void updateFile(String id, String path,String fileType) {
		BookDetail bd = bookMaintainDao.selectByPrimaryKey(id);
		if(StringUtils.equals("pic", fileType)){
			//上传的是图片
			bd.setPicUrl(path);
		}else{
			//上传的是图书
			bd.setBookUrl(path);
		}
		bd.setUpdateTime(new Date());
		bookMaintainDao.updateByPrimaryKey(bd);
	}
}
