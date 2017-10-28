package com.sjkj.controller.common;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sjkj.service.back.BookMaintainService;
import com.sjkj.utils.PropsUtil;
import com.sjkj.utils.times.DateUtil;

@Controller
@RequestMapping("/file")
public class FileUploadController {
	@Autowired
	private BookMaintainService bookMaintainService;
	@RequestMapping(value = "/upload")  
    public ResponseEntity<?> upload(@RequestParam(value ="file",required = false) MultipartFile file, HttpServletRequest request) {  
		Map<String,Object> result = new HashMap<String,Object>();
		String fileName = file.getOriginalFilename();  
		String fileType = request.getParameter("fileType");//文件类型，是书籍封面图片(pic)，还是书籍(book)
		String id = request.getParameter("fileId");//操作记录的id
		String path = PropsUtil.get("book_save_path");
		String loc = "/books/"+fileType;//相对 路径 路径拼接   系统路径+记录id+文件类型
		path +=loc;//路径拼接   系统路径+记录id+文件类型
		String[] split = fileName.split("\\.");
		fileName = id+DateUtil.convertToString(new Date(), DateUtil.YMD3)+"."+split[1];//拼接文件名  记录ID+上传时间+文件格式
        File targetFile = new File(path, fileName);  
        long fileSize = file.getSize();
        if(!targetFile.exists()){  
            targetFile.mkdirs();  
        }  
        //保存  
        try {  
            file.transferTo(targetFile);
            
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        //更新数据库信息
        bookMaintainService.updateFile(id,loc+"/"+fileName,fileType,fileSize);
        return new ResponseEntity<Object>(result,HttpStatus.OK);
    }  
}
