package com.sjkj.service.category.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.abel533.entity.Example;
import com.sjkj.dao.CategoryDao;
import com.sjkj.pojo.Category;
import com.sjkj.service.category.CategoryService;
import com.sjkj.vo.VEasyuiTree;
@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public List<VEasyuiTree> getTreeMenu() {
		List<VEasyuiTree> vtList = new ArrayList<VEasyuiTree>();
		List<VEasyuiTree> childList = new ArrayList<VEasyuiTree>();
		Example example = new Example(Category.class);
		example.setOrderByClause("componentPriority ASC");
		example.createCriteria().andEqualTo("isDel", 0);
		List<Category> selectByExample = categoryDao.selectByExample(example);
		VEasyuiTree root = new VEasyuiTree();
		root.setId("1");
		root.setText("根");
		vtList.add(root);
		if(selectByExample.size() >0){
			for(Category ele:selectByExample){
				VEasyuiTree child = new VEasyuiTree();
				child.setId(ele.getId());
				child.setText(ele.getCategoryName());
				childList.add(child);
			}
			root.setChildren(childList);
		}
		return vtList;
	}

	@Override
	public Map<String, Object> operateNodes(Map<String, Object> param) {
		//param:id、text、parentId、foldType（标记进行的是什么操作）
		Map<String, Object> result = new HashMap<String, Object>();
		String name = param.get("text").toString();
		String id = param.get("id").toString();
		if(StringUtils.equals(param.get("foldType").toString(), "add")){
			//添加节点
			//先查询名称是否重复
			Example example = new Example(Category.class);
			example.createCriteria().andEqualTo("categoryName", name);
			example.createCriteria().andEqualTo("isDel", 0);
			List<Category> selectByExample = categoryDao.selectByExample(example);
			if(selectByExample.size() ==1 && selectByExample.get(0).getId().equals(id)){
				//更新
				Category category = new Category();
				category.setCategoryName(name);
				category.setId(id);
				category.setUpdateTime(new Date());
				categoryDao.updateByPrimaryKey(category);
				result.put("msg", "更新成功");
				result.put("success", "true");
			}else if(selectByExample.size() == 0){
				//添加
				Category category = new Category();
				category.setCategoryName(name);
				category.setId(UUID.randomUUID().toString().replace("-", ""));
				category.setUpdateTime(new Date());
				category.setCreateTime(new Date());
				category.setComponentPriority(0);
				categoryDao.insert(category);
				result.put("msg", "添加成功");
				result.put("success", "true");
			}else{
				result.put("msg", "类目名已存在");
				result.put("success", "false");
			}
		}else if(StringUtils.equals(param.get("foldType").toString(), "del")){
			
		}
		return result;
	}

}
