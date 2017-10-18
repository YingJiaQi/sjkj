package com.sjkj.controller.common;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sjkj.utils.PropsUtil;

@Controller
@RequestMapping("/file")
public class FileUploadController {
	@RequestMapping(value = "/upload")  
    public ResponseEntity<?> upload(@RequestParam(value ="file",required = false) MultipartFile file, HttpServletRequest request) {  
		Map<String,Object> result = new HashMap<String,Object>();
		String fileName = file.getOriginalFilename();  
		String path = PropsUtil.get("book_save_path");
        File targetFile = new File(path, fileName);  
        if(!targetFile.exists()){  
            targetFile.mkdirs();  
        }  
        //保存  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return new ResponseEntity<Object>(result,HttpStatus.OK);
    }  
}
