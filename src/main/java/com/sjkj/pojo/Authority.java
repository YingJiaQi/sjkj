package com.sjkj.pojo;

import javax.persistence.Column;
import javax.persistence.Table;



@Table(name = "tbl_s_authority")
public class Authority  extends BasePojo{
	@Column(name="name")
    private String name;
	@Column(name="code")
    private String code;
	@Column(name="priority")
    private Integer priority;//排序
	@Column(name="pid")
    private String pid;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	
}
