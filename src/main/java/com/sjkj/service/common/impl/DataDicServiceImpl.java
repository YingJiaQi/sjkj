package com.sjkj.service.common.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
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
		String filters = pageBean.getFilters();
		List<Map<String,String>> mlist = new ArrayList<Map<String,String>>();//存储查询规则
		if(StringUtils.isNoneBlank(filters)){
			JSONObject jo = JSONObject.parseObject(filters);
			JSONArray ja = jo.getJSONArray("rules");
			Iterator<Object> iterator = ja.iterator();
			while(iterator.hasNext()){
				Map<String,String> map = new HashMap<String,String>();
				JSONObject parseObject = JSONObject.parseObject(iterator.next()+"");
				map.put("field", parseObject.get("field")+"");
				map.put("op", parseObject.get("op")+"");
				map.put("data", parseObject.get("data")+"");
				mlist.add(map);
			}
		}
		PageHelper.startPage(pageBean.getPage(), pageBean.getRows());
		StringBuffer sb = new StringBuffer(" 1 ");
		for(int j=0;j<mlist.size();j++){
			Map<String, String> map = mlist.get(j);
			String field = map.get("field");
			if(StringUtils.equals("docCode", field)){
				field = "doc_code";
			}else if(StringUtils.equals("docName", field)){
				field = "doc_name";
			}else if(StringUtils.equals("belongCode", field)){
				field = "belong_code";
			}else if(StringUtils.equals("belongName", field)){
				field = "belong_name";
			}else if(StringUtils.equals("createTime", field)){
				field = "create_time";
			}
			String data = '"'+map.get("data")+'"';
			if(StringUtils.equals("eq", map.get("op"))){//等于
				sb.append(" and ").append(field).append("=").append(data);
			}
			if(StringUtils.equals("ne", map.get("op"))){//不等于
				sb.append(" and ").append(field).append("!=").append(data);
			}
			if(StringUtils.equals("bw", map.get("op"))){//开始于，暂时用途大于
				sb.append(" and ").append(field).append(">").append(data);
			}
			if(StringUtils.equals("in", map.get("op"))){//在参数内,多个参数用逗号相隔
				sb.append(" and ").append(field).append(" in(").append(map.get("data")).append(")");
			}
			if(StringUtils.equals("ni", map.get("op"))){//不在参数内,多个参数用逗号相隔
				sb.append(" and ").append(field).append(" not in(").append(map.get("data")).append(")");
			}
			if(StringUtils.equals("ew", map.get("op"))){//对束于，用作小于
				sb.append(" and ").append(field).append("<").append(data);
			}
			if(StringUtils.equals("cn", map.get("op"))){//包含
				sb.append(" and ").append(field).append(" like ").append("%"+data+"%");
			}
			if(StringUtils.equals("nc", map.get("op"))){//不包含
				sb.append(" and ").append(field).append(" not like ").append("%"+data+"%");
			}
		}
		List<DataDic> dlist = dataDicDao.getDataByCondition(sb.toString());
		PageInfo<DataDic> po = new PageInfo<DataDic>(dlist);
		result.put("records", po.getTotal());
		result.put("page", pageBean.getPage());
		result.put("total", po.getTotal()/pageBean.getRows());//总页数
		result.put("rows", po.getList());
		return result;
	}
	@Override
	public Map<String, Object> operateDataDic(DataDic dataDic) {
		Map<String, Object> result = new HashMap<String, Object>();
		if(!StringUtils.equals("_empty", dataDic.getId()) && StringUtils.isNoneBlank(dataDic.getBelongCode())){
			//更新
			DataDic dd = dataDicDao.selectByPrimaryKey(dataDic.getId());
			dd.setBelongCode(dataDic.getBelongCode());
			dd.setBelongName(dataDic.getBelongName());
			dd.setDocCode(dataDic.getDocCode());
			dd.setDocName(dataDic.getDocName());
			dd.setUpdateTime(new Date());
			//id不为空，此时为更新
			dataDicDao.updateByPrimaryKey(dd);
		}else if(!StringUtils.equals("_empty", dataDic.getId()) && StringUtils.isBlank(dataDic.getBelongCode())){
			//此时为删除,逻辑删除，定时任务物理删除
			DataDic dd = dataDicDao.selectByPrimaryKey(dataDic.getId());
			dd.setIsDel(1);
			dataDicDao.updateByPrimaryKey(dd);
		}else{
			//此时为添加
			dataDic.setCreateTime(new Date());
			dataDic.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			dataDic.setIsDel(0);
			dataDic.setUpdateTime(dataDic.getCreateTime());
			dataDicDao.insert(dataDic);
		}
		result.put("success", "true");
		result.put("msg", "添加成功");
		return result;
	}

}
