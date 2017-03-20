package com.sjkj.service.pre;

import java.util.Map;

import org.springframework.util.MultiValueMap;

public interface PreCustomPageService {
	/**
	 * 保存前台提交过来的自定义页面
	 * @param param
	 * @return
	 */
	Map<String, Object> saveCustomHtmls(Map<String, Object> param);

}
