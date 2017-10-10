package com.sjkj.service.common.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sjkj.dao.common.DataDicDao;
import com.sjkj.pojo.common.DataDic;
import com.sjkj.service.common.DataDicService;
import com.sjkj.vo.PageBean;
@Service
public class DataDicServiceImpl implements DataDicService {
	@Autowired
	private DataDicDao dataDicDao;
	@Override
	public Map<String, Object> getDataDicList(PageBean pageBean) {
		Map<String, Object> result = new HashMap<String, Object>();
		PageHelper.startPage(pageBean.getPage(), pageBean.getRows());
		Example example = new Example(DataDic.class);
		example.createCriteria().andEqualTo("isDel", 0);
		List<DataDic> selectByExample = dataDicDao.selectByExample(example);
		PageInfo<DataDic> po = new PageInfo<DataDic>(selectByExample);
		result.put("records", po.getTotal());
		result.put("page", pageBean.getPage());
		result.put("total", po.getTotal()/pageBean.getRows());//总页数
		result.put("rows", po.getList());
		return result;
	}
	@Override
	public Map<String, Object> addDataDic(DataDic dataDic) {
		Map<String, Object> result = new HashMap<String, Object>();
		dataDic.setCreateTime(new Date());
		dataDic.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		dataDic.setIsDel(0);
		dataDic.setUpdateTime(dataDic.getCreateTime());
		dataDicDao.insert(dataDic);
		result.put("success", "true");
		result.put("msg", "添加成功");
		return result;
	}

}
