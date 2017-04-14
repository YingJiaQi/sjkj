package com.sjkj.pojo.pre;

import javax.persistence.Column;
import javax.persistence.Table;

import com.sjkj.pojo.BasePojo;
@Table(name = "tbl_pre_user_brand_category")
public class PreUserBrandCategory extends BasePojo{
	@Column(name="user_id")
	private String userId;
	@Column(name="user_code")
	private String userCode;
	@Column(name="brand_category_order")
	private String brandCategoryOrder;
	@Column(name="brand_category_name")
	private String brandCategoryName;
	
	
	public String getBrandCategoryOrder() {
		return brandCategoryOrder;
	}
	public void setBrandCategoryOrder(String brandCategoryOrder) {
		this.brandCategoryOrder = brandCategoryOrder;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getBrandCategoryName() {
		return brandCategoryName;
	}
	public void setBrandCategoryName(String brandCategoryName) {
		this.brandCategoryName = brandCategoryName;
	}
}
