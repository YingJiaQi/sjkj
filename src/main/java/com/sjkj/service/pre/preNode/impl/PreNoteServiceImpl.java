package com.sjkj.service.pre.preNode.impl;

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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sjkj.dao.pre.PreNoteContentDao;
import com.sjkj.dao.pre.PreUserNoteCategoryDao;
import com.sjkj.pojo.pre.PreNoteContent;
import com.sjkj.pojo.pre.PreUserNoteCategory;
import com.sjkj.service.pre.preNode.PreNoteService;
import com.sjkj.vo.ProjectConstant;
@Service
public class PreNoteServiceImpl implements PreNoteService {
	@Autowired
	private PreNoteContentDao preNoteContentDao;
	@Autowired
	private PreUserNoteCategoryDao preUserNoteCategoryDao;
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
		
		//保存笔记类目，
		//计算需要保存的笔记笔记类目
		//遍历静态类与提交的类目比较，只保存静态类中没有的
		StringBuffer sb = new StringBuffer();
		String[] split = cate_name.split(",");
		//获取数据库中存在了
		Example example = new Example(PreUserNoteCategory.class);
		example.createCriteria().andEqualTo("ownUser", userCode);
		List<PreUserNoteCategory> plist = preUserNoteCategoryDao.selectByExample(example);
		PreUserNoteCategory preUserNoteCategory = null;
		if(plist.size()>0){
			preUserNoteCategory = plist.get(0);
		}
		int flag = 0;//标识
		for(int n=0;n<split.length;n++){
			String updateCate = split[n];
			String[] df = ProjectConstant.NOTE_CATE.split(",");
			for(int k=0;k<df.length;k++){
				String staticCates = df[k];
				if(StringUtils.equals(staticCates, updateCate)){
					flag =1;//已存在不用存储,此时是前台提交的与静态的常量比较
				}
			}
			if(StringUtils.isNoneBlank(preUserNoteCategory.getId())){
				String[] split2 = preUserNoteCategory.getNoteCate().split(",");
				for(int m=0;m<split2.length;m++){
					if(StringUtils.equals(split2[m], updateCate)){
						flag = 1;//已经存在，此时是前台提交的与后台数据存储的比较
					}
				}
			}
			if(flag != 1){
				sb.append(updateCate).append(",");
			}
		}
		if(preUserNoteCategory != null){
			//此时更新
			preUserNoteCategory.setNoteCate(preUserNoteCategory.getNoteCate()+sb.toString());//原来的类目加上新添加的类目
			preUserNoteCategory.setUpdateTime(new Date());
			preUserNoteCategoryDao.updateByPrimaryKey(preUserNoteCategory);
		}else{
			//此时添加
			PreUserNoteCategory punc = new PreUserNoteCategory();
			punc.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			punc.setCreateTime(new Date());
			punc.setUpdateTime(punc.getCreateTime());
			punc.setIsDel(0);
			punc.setIsShare(0);
			
			punc.setNoteCate(sb.toString());
			punc.setOwnUser(userCode);
			preUserNoteCategoryDao.insert(punc);
		}
		
		result.put("msg", "添加成功");
		result.put("success", "true");
		return result;
	}
	@Override
	public Map<String, Object> getNoteContentList(String pageSize, String currPage) {
		Map<String, Object> result = new HashMap<String, Object>();
		//获取登录用户信息
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		JSONObject user = JSON.parseObject(jsonString);
		if(jsonString.contains("null") || jsonString.indexOf("null")>0){
			result.put("success", "false");
		}else{
			//分页
			int curr = Integer.parseInt(currPage);
			int psize = Integer.parseInt(pageSize);
			PageHelper.startPage(curr, psize);
			Example example = new Example(PreNoteContent.class);
			example.createCriteria().andEqualTo("isDel", 0);
			example.createCriteria().andEqualTo("userCode", user.get("userCode"));
			example.setOrderByClause("createTime DESC");
			List<PreNoteContent> selectByExample = preNoteContentDao.selectByExample(example);
			PageInfo<PreNoteContent> pageInfo = new PageInfo<PreNoteContent>(selectByExample);
			result.put("success", "true");
			result.put("total", pageInfo.getTotal());
			result.put("data", pageInfo.getList());
		}
		return result;
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Map<String, Object> getUserNoteCategory() {
		Map<String, Object> result = new HashMap<String, Object>();
		//获取登录用户信息
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		JSONObject user = JSON.parseObject(jsonString);
		String userCode = user.get("userCode")+"";
		//获取数据库中存在了
		Example example = new Example(PreUserNoteCategory.class);
		example.createCriteria().andEqualTo("ownUser", userCode);
		List<PreUserNoteCategory> plist = preUserNoteCategoryDao.selectByExample(example);
		PreUserNoteCategory preUserNoteCategory = null;
		if(plist.size()>0){
			preUserNoteCategory = plist.get(0);
		}
		List list = new ArrayList();
		if(preUserNoteCategory != null){
			String[] split = preUserNoteCategory.getNoteCate().split(",");
			for(int i=0;i<split.length;i++){
				list.add(split[i]);
			}
		}
		String[] df = ProjectConstant.NOTE_CATE.split(",");
		for(int k=0;k<df.length;k++){
			if(!list.contains(df[k])){
				list.add(df[k]);
			}
		}
		result.put("success", "true");
		result.put("cateList", list);
		return result;
	}

}
