package com.sjkj.service.pre.PreNavication;

import java.util.Map;

import org.springframework.util.MultiValueMap;


public interface PreNavicationService {
	/**
	 * 动态获取链接图标
	 * @param linkAddr
	 * @return
	 */
	Map<String, Object> dynFindBrand(String addr);
	/**
	 * 保存链接及图标
	 * @param linkAddr
	 * @return
	 */
	Map<String, Object> saveBrand(Map<String, Object> param);

}
