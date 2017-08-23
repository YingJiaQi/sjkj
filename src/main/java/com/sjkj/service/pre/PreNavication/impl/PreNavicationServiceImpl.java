package com.sjkj.service.pre.PreNavication.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.abel533.entity.Example;
import com.sjkj.dao.pre.PreBrandDao;
import com.sjkj.dao.pre.PreUserBrandLinkDao;
import com.sjkj.pojo.pre.PreBrand;
import com.sjkj.pojo.pre.PreUserBrandLink;
import com.sjkj.service.pre.PreNavication.PreNavicationService;
import com.sjkj.utils.PropsUtil;
import com.sjkj.utils.times.DateUtil;
@Service
public class PreNavicationServiceImpl implements PreNavicationService {
	@Autowired
	private PreBrandDao preBrandDao;
	@Autowired
	private PreUserBrandLinkDao preUserBrandLinkDao;
	@Override
	public Map<String, Object> dynFindBrand(String addr) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<PreBrand> pbs = new ArrayList<PreBrand>();
		//根据地址从数据库中查找匹配项，不能查找别人上传的图标
		Example record = new Example(PreBrand.class);
		List<Object> reg = new ArrayList<Object>();
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		JSONObject parseObject = JSON.parseObject(jsonString);
		reg.add("admin");//系统本身的
		reg.add(parseObject.get("id"));
		record.createCriteria().andIn("ownerUserId", reg);
		List<PreBrand> plist = preBrandDao.selectByExample(record);
		for(PreBrand ele:plist){
			String brandUrl = ele.getBrandUrl();
			if(brandUrl.contains(addr)){
				pbs.add(ele);
			}
		}
		result.put("success", "true");
		if(pbs.size() == 0){
			pbs = null;
		}
		result.put("plist", pbs);
		return result;
	}
	@SuppressWarnings("unused")
	@Override
	public Map<String, Object> saveBrand(Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		String brandUrl = param.get("brandUrl")+"";
		String brandName = param.get("brandName")+"";
		String brandId = param.get("brandId")+"";
		System.out.println(brandId);
		String brandCategoryName = param.get("brandCategoryName")+"";
		String brandCategoryId = param.get("brandCategoryId")+"";
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		JSONObject parseObject = JSON.parseObject(jsonString);
		if(brandId == null || StringUtils.isBlank(brandId) || brandId.equals("")){
			//此时是自定义上传了图标
			String old_filePath = param.get("file").toString();
			SimpleDateFormat sdf = new SimpleDateFormat(DateUtil.YMD1);
			String saveTime = sdf.format(new Date());
			File new_brandPic_doc = new File(PropsUtil.get("new_brandPic_Path")+saveTime);
			if(!new_brandPic_doc.exists()){
				new_brandPic_doc.mkdirs();
			}
			File new_brandPic_Path = new File(new_brandPic_doc +"/"+UUID.randomUUID().toString().replaceAll("-", "")+".png");
			try {
				FileUtils.copyFile(new File("old_filePath"), new_brandPic_Path);
				//保存到图标表
				PreBrand pb = new PreBrand();
				pb.setBrandCode(brandName);
				pb.setBrandImgUrl(new_brandPic_Path.toString());
				pb.setBrandName(brandName);
				pb.setBrandUrl(brandUrl);
				pb.setCreateTime(new Date());
				pb.setId(UUID.randomUUID().toString().replaceAll("-", ""));
				pb.setIsDel(0);
				pb.setOwnerUserId(parseObject.get("id")+"");
				pb.setUpdateTime(pb.getCreateTime());
				preBrandDao.insert(pb);
				//添加该用户与该图片的关联
				PreUserBrandLink record = new PreUserBrandLink();
				record.setBrandCategoryId(brandCategoryId);
				record.setBrandCategoryName(brandCategoryName);
				record.setBrandId(pb.getId());
				record.setBrandName(brandName);
				record.setCreateTime(new Date());
				record.setId(UUID.randomUUID().toString().replaceAll("-", ""));
				record.setIsDel(0);
				record.setUpdateTime(new Date());
				record.setUserCode(parseObject.get("userCode").toString());
				record.setUserId(parseObject.get("id").toString());
				preUserBrandLinkDao.insert(record);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			//此时使用了网站提供的图标
			PreUserBrandLink record = new PreUserBrandLink();
			record.setBrandCategoryId(brandCategoryId);
			record.setBrandCategoryName(brandCategoryName);
			record.setBrandId(brandId);
			record.setBrandName(brandName);
			record.setCreateTime(new Date());
			record.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			record.setIsDel(0);
			record.setUpdateTime(new Date());
			record.setUserCode(parseObject.get("userCode").toString());
			record.setUserId(parseObject.get("id").toString());
			preUserBrandLinkDao.insert(record);
		}
		result.put("success", "true");
		result.put("msg", "添加成功");
		return result;
	}

}
