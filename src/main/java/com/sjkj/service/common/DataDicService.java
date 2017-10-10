package com.sjkj.service.common;

import java.util.Map;


import com.sjkj.pojo.common.DataDic;
import com.sjkj.vo.PageBean;

public interface DataDicService {
	/**
	 * 获取数据字典数据
	 * @param pageBean
	 * @return
	 */
	Map<String, Object> getDataDicList(PageBean pageBean);
	/**
	 * 添加数据字典数据
	 */
	Map<String, Object> addDataDic(DataDic dataDic);

}
