package com.sjkj.controller.pre;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sjkj.service.pre.preNode.PreNoteService;
import com.sjkj.utils.PropsUtil;
import com.sjkj.utils.times.DateUtil;

@Controller
@RequestMapping("/pre/noteManage")
public class PreNoteManager {
	@Autowired
	private PreNoteService preNoteService;
	/**
	 * @return
	 */
	@RequestMapping(value="/addNote" ,method = RequestMethod.POST)
	public String addNote(HttpServletRequest request, HttpServletResponse response){
		String noteContent = request.getParameter("content");
		//处理商品图片,转存到本地
		List<Map<String, String>> lmap = new ArrayList<Map<String, String>>();
		//获取登录用户信息
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		JSONObject user = JSON.parseObject(jsonString);
		String newFileAddr = null;//文件新路径
		//获取根路径
		String t=Thread.currentThread().getContextClassLoader().getResource("").getPath();
		String rootPath = t.substring(0, t.indexOf("SJKJ")+5);
		SimpleDateFormat sdf = new SimpleDateFormat(DateUtil.YMD1);
		String saveTime = sdf.format(new Date());
		File server_saveAddr = new File(rootPath.subSequence(0, rootPath.indexOf("SJKJ")) + PropsUtil.get("note_pics_path_no_ip")+"/"+saveTime);
		String _server_saveAddr = null;
		if(!server_saveAddr.exists()){
			server_saveAddr.mkdirs();
		}
		
		StringBuffer newNoteContent = new StringBuffer();//存储记录信息，替换原来上传的图片路径，保存新的文件地址，
		String[] split = noteContent.split("<img");
		for(int i=0;i<split.length;i++){
			Map<String, String> map = new HashMap<String, String>();
			if(split[i].contains("title")){
				//包含图片
				String path = split[i].substring(6, split[i].indexOf("title")-2);
				String substrings = split[i].substring(split[i].indexOf("title")+7);
				String titles = substrings.substring(0, substrings.indexOf('"'));
				map.put("path", path);
				map.put("title", titles);
				lmap.add(map);
				//下面代码是为了更新旧内容，替换系统默认的图片上传路径
				String id = UUID.randomUUID().toString().replaceAll("-", "");
				newFileAddr = PropsUtil.get("note_pics_path")+"/"+saveTime+File.separator+user.get("userCode")+"_"+id+titles;//数据库中存储逻辑路径
				_server_saveAddr = server_saveAddr +File.separator+user.get("userCode")+"_"+id+titles;//文件复制的物理路径
				//
				newNoteContent.append("src=\" "+newFileAddr+"\"  "+split[i].substring(split[i].indexOf("title"))+"<img ");//重新组装新图片路径 
			}else{
				newNoteContent.append(split[i]+"<img ");
			}
		}
		String _newNoteContent_1 = newNoteContent.toString();
		String _newNoteContent = _newNoteContent_1.substring(0, _newNoteContent_1.length()-5);
		
		
		//将图片复制到，目标位置，删除原图片
		for(Map<String, String> img : lmap){
			
			File sourceCommodityImage = new File(rootPath+img.get("path").substring(img.get("path").indexOf("SJKJ")+5,img.get("path").length()));
			try {
				FileUtils.copyFile(sourceCommodityImage, new File(_server_saveAddr));
				//删除原文件
				FileUtils.deleteQuietly(sourceCommodityImage);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		//删除源文件夹
		try {
			FileUtils.deleteDirectory(new File(rootPath+"/ueditor/jsp/upload/image"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		String cate_name = request.getParameter("catename");
		String note_title = request.getParameter("notetitle");
		if(newFileAddr == null){
			//此时用户的笔记里没有上传图片，可以给定制一个图片，安放广告，对那些没有付费的用户
			newFileAddr = PropsUtil.get("note_adv_pics_path");
		}
		preNoteService.addNoteContent(_newNoteContent,user.get("userCode")+"",cate_name,note_title,newFileAddr);
		//添加记录，并返回
		return "pre_write_node";
	}
	@RequestMapping(value="/getNoteContentList")
	public ResponseEntity<?> getNoteContentList(HttpServletRequest request, HttpServletResponse response){
		String pageSize = (String)request.getParameter("pageSize");
		String currPage = (String)request.getParameter("currPage");
		return new ResponseEntity<Object>(preNoteService.getNoteContentList(pageSize,currPage),HttpStatus.OK);
	}
	@RequestMapping(value="/getUserNoteCategory", method= RequestMethod.POST)
	public ResponseEntity<?> getUserNoteCategory(){
		return new ResponseEntity<Object>(preNoteService.getUserNoteCategory(),HttpStatus.OK);
	}

}
