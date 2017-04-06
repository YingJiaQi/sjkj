package com.sjkj.service.category;

import java.util.List;
import java.util.Map;

import com.sjkj.vo.VEasyuiTree;

public interface CategoryService {
	/**
	 * 获取规格参数树结构数据
	 * @return
	 */
	List<VEasyuiTree> getTreeMenu();
	/**
	 * 节点操作：增、删、改、查
	 * @param param
	 * @return
	 */
	Map<String, Object> operateNodes(Map<String, Object> param);

}
