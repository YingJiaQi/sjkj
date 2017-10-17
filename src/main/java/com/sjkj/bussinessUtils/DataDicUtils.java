package com.sjkj.bussinessUtils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.abel533.entity.Example;
import com.sjkj.dao.common.DataDicDao;
import com.sjkj.pojo.common.DataDic;
import com.sjkj.utils.JdbcUtil;
public class DataDicUtils {
	@Autowired
	public static DataDicDao dataDicDao;
	/**
	 * @DESC  根据   字典类型编码   查找所有的字典码及数据 JSONObject(BelongCode,BelongName)
	 * @param docCode
	 * @author YJQ
	 * @return
	 */
	public static String getMapByDocCode(String docCode){
		JSONObject result = new JSONObject();
		JSONObject jo = new JSONObject();
		try {
			List<Map<String, String>> dlist = JdbcUtil.queryApplyMoreMap("select belong_code,belong_name from tbl_c_data_dic where is_deleted =0 and doc_code = "+docCode);
			if(dlist.size()>0){
				for(int i=0;i<dlist.size();i++){
					Map<String, String> map = dlist.get(i);
					jo.put(map.get("belong_code"), map.get("belong_name"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("value", jo);
		return jo.toJSONString();
	}
	/**
	 * @DESC  根据字典码查找对应数据值
	 * @param belongCode 字典码
	 * @param docCode	字典类型编码
	 * @author YJQ
	 * @return
	 */
	public static String getBelongNameByBelongCode(String docCode, String belongCode){
		Example example = new Example(DataDic.class);
		example.createCriteria().andEqualTo("docCode", docCode).andEqualTo("isDel", 0).andEqualTo("belongCode", belongCode);
		List<DataDic> dlist = dataDicDao.selectByExample(example);
		if(dlist.size()>0){
			return dlist.get(0).getBelongName();
		}else{
			return null;
		}
	}
}
