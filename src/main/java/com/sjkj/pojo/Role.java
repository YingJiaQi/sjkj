package com.sjkj.pojo;

import javax.persistence.Column;
import javax.persistence.Table;



@Table(name = "tbl_s_role")
public class Role  extends BasePojo{
	@Column(name="name")
    private String name;
	@Column(name="code")
    private String code;
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
	
}
