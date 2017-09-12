package com.sjkj.controller.pre;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sjkj.service.pre.PreNavication.PreNavicationService;
import com.sjkj.utils.PropsUtil;
import com.sjkj.utils.times.DateUtil;

@Controller
@RequestMapping("/pre/navication")
public class PreNavicationManager {
	@Autowired
	private PreNavicationService preNavicationService;
	/**
	 * 动态获取链接图标
	 * @param linkAddr
	 * @return
	 */
	@RequestMapping(value="/dynFindBrand" ,method = RequestMethod.POST)
	public ResponseEntity<?> dynFindBrand(@RequestBody Map<String, Object> linkAddr){
		String addr = linkAddr.get("linkAddr").toString();
		return new ResponseEntity<Object>(preNavicationService.dynFindBrand(addr),HttpStatus.OK);
	}
	/**
	 * 保存链接及图标
	 * @param linkAddr
	 * @return
	 */
	@RequestMapping(value="/saveBrand" ,method = RequestMethod.POST)
	public ResponseEntity<?> saveBrand(MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		SimpleDateFormat sdf = new SimpleDateFormat(DateUtil.YMD1);
		String saveTime = sdf.format(new Date());
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		JSONObject parseObject = JSON.parseObject(jsonString);
		String originalFilename = file.getOriginalFilename();
		String prefix=originalFilename.substring(originalFilename.lastIndexOf(".")+1);
        String fileName = parseObject.get("userCode")+"_"+UUID.randomUUID().toString().replaceAll("-", "")+"."+prefix;
        String paths = null;
        if(parseObject.get("userCode").equals("admin")){
        	paths = PropsUtil.get("temp_brandPic_path")+"admin_brandPics/"+saveTime;
        }else{
        	paths = PropsUtil.get("temp_brandPic_path")+"user_brandPics/"+saveTime;
        }
        String strDirPath = request.getSession().getServletContext().getRealPath("/");
        String context = request.getContextPath().substring(1);
        int indexOf = strDirPath.indexOf(context);
        String substring = strDirPath.substring(0, indexOf);
        paths = substring+paths;
        File path = new File(paths);
        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        //保存
        try {
        	file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String brandUrl = request.getParameter("brandUrl");
        String brandName = request.getParameter("brandName");
        String brandId = request.getParameter("brandId");
        String userbrandLinkId = request.getParameter("userbrandLinkId");
        String brandCategoryName = request.getParameter("brandCategoryName");
        String brandCategoryId = request.getParameter("brandCategoryId");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("brandUrl", brandUrl);
        param.put("brandName", brandName);
        param.put("brandId", brandId);
        if(parseObject.get("userCode").equals("admin")){
        	param.put("filePath", "/admin_brandPics/"+saveTime+"/"+fileName);
        }else{
        	param.put("filePath", "/user_brandPics/"+saveTime+"/"+fileName);
        }
        param.put("userId", parseObject.get("id"));
        param.put("userCode", parseObject.get("userCode"));
        param.put("brandCategoryName", brandCategoryName);
        param.put("brandCategoryId", brandCategoryId);
        param.put("userbrandLinkId", userbrandLinkId);
		return new ResponseEntity<Object>(preNavicationService.saveBrand(param),HttpStatus.OK);
	}
	/**
	 * 删除链接
	 * @param brandId
	 * @return
	 */
	@RequestMapping(value="/deleteBrand" ,method = RequestMethod.POST)
	public ResponseEntity<?> deleteBrand(@RequestBody Map<String, Object> brandId){
		String brand_id = brandId.get("brandId").toString();
		return new ResponseEntity<Object>(preNavicationService.deleteBrandById(brand_id),HttpStatus.OK);
	}
	/**
	 * 更新链接及图标
	 * @return
	 */
	@RequestMapping(value="/updateBrand" ,method = RequestMethod.POST)
	public ResponseEntity<?> updateBrand(MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");//brand_id
		 Map<String, Object> param = new HashMap<String, Object>();
		if(request.getParameter("isDefined").equals("1")){
			param.put("up_pic", "1");//上传了图片
			//重新上传了图片,删除原先的图片，保存新的图片，图片的路径重新生成，
			//删除操作不做，只是在图片的使用次数上减1，当使用次数为0时，用定时任务删除
			SimpleDateFormat sdf = new SimpleDateFormat(DateUtil.YMD1);
			String saveTime = sdf.format(new Date());
			Object principal = SecurityUtils.getSubject().getPrincipal();
			String jsonString = JSON.toJSONString(principal);
			JSONObject parseObject = JSON.parseObject(jsonString);
			String originalFilename = file.getOriginalFilename();
			String prefix=originalFilename.substring(originalFilename.lastIndexOf(".")+1);
	        String fileName = parseObject.get("userCode")+"_"+id+"."+prefix;
	        String paths = null;
	        if(parseObject.get("userCode").equals("admin")){
	        	paths = PropsUtil.get("temp_brandPic_path")+"admin_brandPics/"+saveTime;
	        }else{
	        	paths = PropsUtil.get("temp_brandPic_path")+"user_brandPics/"+saveTime;
	        }
	        String strDirPath = request.getSession().getServletContext().getRealPath("/");
	        String context = request.getContextPath().substring(1);
	        int indexOf = strDirPath.indexOf(context);
	        String substring = strDirPath.substring(0, indexOf);
	        paths = substring+paths;
	        File path = new File(paths);
	        File targetFile = new File(path, fileName);
	        if (!targetFile.exists()) {
	            targetFile.mkdirs();
	        }
	        //保存
	        try {
	        	if(targetFile.exists()){
	        		fileName = parseObject.get("userCode")+"_u_"+UUID.randomUUID().toString().replaceAll("-", "")+"."+prefix;
	        		targetFile =new File(path.toString()+"/" + fileName);//存在就更改文件名，在后加_u，因为是同一个人上传的，同一天内
	        	}
	        	file.transferTo(targetFile);
	        	if(parseObject.get("userCode").equals("admin")){
	            	param.put("filePath", "/admin_brandPics/"+saveTime+"/"+fileName);
	            }else{
	            	param.put("filePath", "/user_brandPics/"+saveTime+"/"+fileName);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		}else{
			//只是改了标题或链接
			param.put("up_pic", "0");//没有上传图片
		}
		
       
        String brandUrl = request.getParameter("brandUrl");
        String brandName = request.getParameter("brandName");
       
        param.put("brandUrl", brandUrl);
        param.put("brandName", brandName);
        param.put("id", id);
		return new ResponseEntity<Object>(preNavicationService.updateBrand(param),HttpStatus.OK);
	}
}
