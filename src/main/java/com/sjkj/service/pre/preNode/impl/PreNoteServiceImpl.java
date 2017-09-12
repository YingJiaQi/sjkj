package com.sjkj.service.pre.preNode.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.abel533.entity.Example;
import com.sjkj.dao.pre.PreNoteContentDao;
import com.sjkj.pojo.pre.PreNoteContent;
import com.sjkj.service.pre.preNode.PreNoteService;
@Service
public class PreNoteServiceImpl implements PreNoteService {
	@Autowired
	private PreNoteContentDao preNoteContentDao;
	@Override
	public Map<String, String> addNoteContent(String _newNoteContent, String userCode, String cate_name, String note_title,String nav_pic_addr) {
		Map<String, String> result = new HashMap<String, String>();
		PreNoteContent pnc = new PreNoteContent();
		pnc.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		pnc.setCreateTime(new Date());
		pnc.setIsShare(0);
		pnc.setNodeContent(_newNoteContent);
		pnc.setReadTimes(0);
		pnc.setReadUserCode(userCode);//自己写的内容，自己肯定读过了，所以第一个阅读的人永远是自己
		pnc.setUpdateTime(pnc.getCreateTime());
		pnc.setUserCode(userCode);
		pnc.setCateName(cate_name);
		pnc.setNoteTitle(note_title);
		pnc.setNavPicAddr(nav_pic_addr);
		pnc.setCommentTimes(0);
		preNoteContentDao.insert(pnc);
		result.put("msg", "添加成功");
		result.put("success", "true");
		return result;
	}
	@Override
	public Map<String, Object> getNoteContentList() {
		Map<String, Object> result = new HashMap<String, Object>();
		//获取登录用户信息
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		JSONObject user = JSON.parseObject(jsonString);
		if(jsonString.contains("null") || jsonString.indexOf("null")>0){
			result.put("success", "false");
		}else{
			Example example = new Example(PreNoteContent.class);
			example.createCriteria().andEqualTo("isDel", 0);
			example.createCriteria().andEqualTo("userCode", user.get("userCode"));
			example.setOrderByClause("createTime DESC");
			List<PreNoteContent> selectByExample = preNoteContentDao.selectByExample(example);
			result.put("success", "true");
			result.put("data", selectByExample);
		}
		return result;
	}

}
