package com.sjkj.service.pre.PreNavication.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
		reg.add("");
		reg.add("null");
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
	@Override
	public Map<String, Object> saveBrand(Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		String brandUrl = param.get("brandUrl").toString();
		String brandName = param.get("brandName").toString();
		String brandId = param.get("brandId").toString();
		String brandCategoryName = param.get("brandCategoryName").toString();
		String brandCategoryId = param.get("brandCategoryId").toString();
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		JSONObject parseObject = JSON.parseObject(jsonString);
		if(brandId == null){
			//此时是自定义上传了图标
			String file = param.get("file").toString();
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
