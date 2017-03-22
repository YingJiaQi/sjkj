package com.sjkj.pojo.pre;

import javax.persistence.Column;
import javax.persistence.Table;

import com.sjkj.pojo.BasePojo;

@Table(name = "tbl_pre_sys_components")
public class PreSystemComponents  extends BasePojo{
	@Column(name="module_name")
	private String moduleName;
	@Column(name="module_parent_id")
	private String moduleParentId;
	
	
	
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public String getModuleParentId() {
		return moduleParentId;
	}
	public void setModuleParentId(String moduleParentId) {
		this.moduleParentId = moduleParentId;
	}
	
	
}
