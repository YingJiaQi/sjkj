package com.sjkj.service.pre.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sjkj.service.pre.PreCustomPageService;
import com.sjkj.utils.PropsUtil;
import com.sjkj.utils.times.DateUtil;
@Service
public class PreCustomPageServiceImpl implements PreCustomPageService {

	@Override
	public Map<String, Object> saveCustomHtmls(Map<String, Object> param) {
		String head = param.get("head").toString();
		String body = param.get("body").toString();
		String refer = "<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>"+
				"<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>"+
				"<html>";	
		head = "<head>"+head+"<meta charset='utf-8'><meta http-equiv='X-UA-Compatible' content='IE=edge'>"+
			    "<meta name='viewport' content='width=device-width, initial-scale=1'>"+
			    "<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->"+
				"<!-- Bootstrap --> "+
				"<link href='css/bootstrap.min.css' rel='stylesheet' media='screen'>"+
				"<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries --> <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->"+ 
				"<!--[if lt IE 9]>"+
			      "<script src='https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js'></script>"+
			      "<script src='https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js'></script>"+
			    "<![endif]--> "+
			     "<script type='text/javascript' src='../utils/bootstrap.min.js'></script>"+
			     "<script type='text/javascript' src='../utils/jquery-1.11.3.js'></script>"+
			     "<link rel='stylesheet' type='text/css' href='../utils/bootstrap.min.css'>"+
			     "<link rel='stylesheet' type='text/css' href='../utils/PreCustomPage.css'></head>";
		body = "<body><div class='container'>"+body+"</div></body>";
		String pageHtml = refer+head+body;
		SimpleDateFormat sdf = new SimpleDateFormat(DateUtil.YMD1);
		String saveTime = sdf.format(new Date());
		try {
			File file = new File(PropsUtil.get("savePathCustomJsp")+"/customHtmls/"+saveTime+"/");
			if(!file.exists()){
				file.mkdirs();
			}
			FileOutputStream writerStream = new FileOutputStream(PropsUtil.get("savePathCustomJsp")+"/customHtmls/"+saveTime+"/"+"custom.jsp");
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(writerStream, "UTF-8"));
			writer.write(pageHtml);
			writer.close();
			writerStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
