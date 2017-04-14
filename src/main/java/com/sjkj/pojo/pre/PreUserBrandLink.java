package com.sjkj.pojo.pre;

import javax.persistence.Column;
import javax.persistence.Table;

import com.sjkj.pojo.BasePojo;
@Table(name = "tbl_pre_user_brand_link")
public class PreUserBrandLink extends BasePojo{
	@Column(name="user_id")
	private String userId;
	@Column(name="user_code")
	private String userCode;
	@Column(name="brand_id")
	private String brandId;
	@Column(name="brand_name")
	private String brandName;
	@Column(name="brand_category_name")
	private String brandCategoryName;
	@Column(name="brand_category_id")
	private String brandCategoryId;
	@Column(name="brand_order")
	private Integer brandOrder;
	
	public Integer getBrandOrder() {
		return brandOrder;
	}
	public void setBrandOrder(Integer brandOrder) {
		this.brandOrder = brandOrder;
	}
	public String getBrandCategoryName() {
		return brandCategoryName;
	}
	public void setBrandCategoryName(String brandCategoryName) {
		this.brandCategoryName = brandCategoryName;
	}
	public String getBrandCategoryId() {
		return brandCategoryId;
	}
	public void setBrandCategoryId(String brandCategoryId) {
		this.brandCategoryId = brandCategoryId;
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
	public String getBrandId() {
		return brandId;
	}
	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
}
