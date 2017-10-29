package com.sjkj.service.pre.PreNavication.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.abel533.entity.Example;
import com.sjkj.dao.pre.PreBrandDao;
import com.sjkj.dao.pre.PreUserBrandLinkDao;
import com.sjkj.pojo.pre.PreBrand;
import com.sjkj.pojo.pre.PreUserBrandLink;
import com.sjkj.service.pre.PreNavication.PreNavicationService;
import com.sjkj.utils.PropsUtil;
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
				ele.setBrandImgUrl(PropsUtil.get("temp_brandPic_path")+ele.getBrandImgUrl());
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
		String brandUrl = param.get("brandUrl")+"";
		String brandName = param.get("brandName")+"";
		String brandId = param.get("brandId")+"";
		String filePath = "/brandPics"+param.get("filePath")+"";
		String userId = param.get("userId")+"";
		String userCode = param.get("userCode")+"";
		String userbrandLinkId = param.get("userbrandLinkId")+"";
		String brandCategoryName = param.get("brandCategoryName")+"";
		String brandCategoryId = param.get("brandCategoryId")+"";
		if(brandId == "" || StringUtils.isBlank(brandId) || brandId.equals("")){
			//此时是自定义上传了图标
			//保存到图标表
			String id = UUID.randomUUID().toString().replaceAll("-", "");
			PreBrand pb = new PreBrand();
			pb.setBrandCode(brandName);
			pb.setBrandImgUrl(filePath);
			pb.setBrandName(brandName);
			pb.setBrandUrl(brandUrl);
			pb.setCreateTime(new Date());
			pb.setIsShare(0);
			pb.setCitationTimes(1);//新增时1次引用
			pb.setId(id);
			pb.setIsDel(0);
			pb.setOwnerUserId(userId);
			pb.setUpdateTime(pb.getCreateTime());
			preBrandDao.insert(pb);
			//添加该用户与该图片的关联
			PreUserBrandLink record = new PreUserBrandLink();
			record.setBrandCategoryId(brandCategoryId);
			record.setBrandCategoryName(brandCategoryName);
			record.setBrandId(id);
			record.setBrandName(brandName);
			record.setCreateTime(new Date());
			record.setId(userbrandLinkId);
			record.setIsDel(0);
			record.setUpdateTime(new Date());
			record.setUserCode(userCode);
			record.setUserId(userId);
			preUserBrandLinkDao.insert(record);
		}else{
			//此时使用了网站提供的图标
			PreBrand selectByPrimaryKey = preBrandDao.selectByPrimaryKey(brandId);
			selectByPrimaryKey.setCitationTimes(selectByPrimaryKey.getCitationTimes()+1);
			selectByPrimaryKey.setUpdateTime(new Date());
			preBrandDao.updateByPrimaryKey(selectByPrimaryKey);//更新引用次数
			PreUserBrandLink record = new PreUserBrandLink();
			record.setBrandCategoryId(brandCategoryId);
			record.setBrandCategoryName(brandCategoryName);
			record.setBrandId(brandId);
			record.setBrandName(brandName);
			record.setCreateTime(new Date());
			record.setId(userbrandLinkId);
			record.setIsDel(0);
			record.setUpdateTime(new Date());
			record.setUserCode(userCode);
			record.setUserId(userId);
			preUserBrandLinkDao.insert(record);
		}
		result.put("success", "true");
		result.put("msg", "添加成功");
		return result;
	}
	@Override
	public Map<String, Object> deleteBrandById(String brandId) {
		Map<String, Object> result = new HashMap<String, Object>();
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		JSONObject parseObject = JSON.parseObject(jsonString);
		PreBrand pb = preBrandDao.selectByPrimaryKey(brandId);
		if(pb.getCitationTimes() > 1){
			//此时不删除PreBrand信息
			pb.setCitationTimes(pb.getCitationTimes()-1);
			pb.setUpdateTime(new Date());
			preBrandDao.updateByPrimaryKey(pb);
		}else{
			//此时删除PreBrand信息,删除记录，先逻辑删除，为了用户数据恢复，若过了1个月，用户没有做恢复操作，定时任务，删除这样的记录
			PreBrand selectByPrimaryKey = preBrandDao.selectByPrimaryKey(brandId);
			selectByPrimaryKey.setIsDel(1);
			selectByPrimaryKey.setUpdateTime(new Date());
			preBrandDao.updateByPrimaryKey(selectByPrimaryKey);
		}
		List<PreUserBrandLink> selectByExample = preUserBrandLinkDao.selectByUsercodeAndBrandid(parseObject.get("userCode")+"",brandId);
		for(int i=0;i<selectByExample.size();i++){
			//删除记录，先逻辑删除，为了用户数据恢复，若过了1个月，用户没有做恢复操作，定时任务，删除这样的记录
			PreUserBrandLink preUserBrandLink = selectByExample.get(i);
			preUserBrandLink.setIsDel(1);
			preUserBrandLink.setUpdateTime(new Date());
			preUserBrandLinkDao.updateByPrimaryKey(preUserBrandLink);
		}
		result.put("success", "true");
		return result;
	}
	@Override
	public Map<String, Object> updateBrand(Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		String id= param.get("id")+"";//旧的brand_id,
		String new_brand_id = UUID.randomUUID().toString().replaceAll("-", "");
		String isUpPic = param.get("up_pic")+"";
		String owerId = "";
		if(isUpPic.equals("1")){
			//上传了自定义图片
			//操作：原先的图片使用次数减1，当为0时，由定时任务删除
			PreBrand pb = preBrandDao.selectByPrimaryKey(id);
			pb.setCitationTimes(pb.getCitationTimes()-1);
			pb.setUpdateTime(new Date());
			preBrandDao.updateByPrimaryKey(pb);
			//保存新的Brand信息，使用次数为1，
			PreBrand _pb = new PreBrand();
			_pb.setBrandCode(param.get("brandName")+"");
			_pb.setBrandImgUrl(param.get("filePath")+"");
			_pb.setBrandName(param.get("brandName")+"");
			_pb.setBrandUrl(param.get("brandUrl")+"");
			_pb.setCitationTimes(1);
			_pb.setId(new_brand_id);
			_pb.setIsDel(0);
			_pb.setIsShare(0);
			_pb.setOwnerUserId(pb.getOwnerUserId());
			_pb.setCreateTime(new Date());
			_pb.setUpdateTime(_pb.getCreateTime());
			preBrandDao.insert(_pb);
			owerId = pb.getOwnerUserId()+"";
			//更新user_brand关联表
			List<PreUserBrandLink> selectByExample = preUserBrandLinkDao.selectByUseridAndBrandid(pb.getOwnerUserId()+"",id);
			for(int i=0;i<selectByExample.size();i++){
				//更新数据
				PreUserBrandLink preUserBrandLink = selectByExample.get(i);
				preUserBrandLink.setBrandId(new_brand_id);
				preUserBrandLink.setBrandName(param.get("brandName")+"");
				preUserBrandLink.setUpdateTime(new Date());
				preUserBrandLinkDao.updateByPrimaryKey(preUserBrandLink);
			}
			result.put("imgurl", param.get("filePath")+"");
		}else{
			//没有更改图片,
			//更新user_brand关联表
			List<PreUserBrandLink> selectByExample = preUserBrandLinkDao.selectByUseridAndBrandid(owerId,id);
			for(int i=0;i<selectByExample.size();i++){
				//更新数据,只要更新brand相关信息就好，其它的不动
				PreUserBrandLink preUserBrandLink = selectByExample.get(i);
				preUserBrandLink.setBrandId(new_brand_id);
				preUserBrandLink.setBrandName(param.get("brandName")+"");
				preUserBrandLink.setUpdateTime(new Date());
				preUserBrandLinkDao.updateByPrimaryKey(preUserBrandLink);
			}
			PreBrand pb = preBrandDao.selectByPrimaryKey(id);
			result.put("imgurl", "0");
		}
		result.put("id", id);
		
		result.put("success", "true");
		return result;
	}

}
