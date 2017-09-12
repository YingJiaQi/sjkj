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
	/**
	 * 删除网页收藏根据记录ID
	 * @param brandId
	 * @author YJQ
	 * @return
	 */
	Map<String, Object> deleteBrandById(String brandId);
	/**
	 * 更新链接或图标
	 * @param linkAddr
	 * @return
	 */
	Map<String, Object> updateBrand(Map<String, Object> param);

}
