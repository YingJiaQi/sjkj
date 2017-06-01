package com.sjkj.pojo.pre;

import javax.persistence.Column;
import javax.persistence.Table;

import com.sjkj.pojo.BasePojo;
@Table(name="tbl_pre_brand")
public class PreBrand extends BasePojo{
	@Column(name="brand_name")
	private String brandName;
	@Column(name="brand_code")
	private String brandCode;
	@Column(name="brand_img_url")
	private String brandImgUrl;
	@Column(name="brand_url")
	private String brandUrl;
	@Column(name="owner_user_id")
	private String ownerUserId;//所属用户的ID，表明这个图标是哪个用户上传的，该图标只能该用户使用
	
	
	public String getOwnerUserId() {
		return ownerUserId;
	}
	public void setOwnerUserId(String ownerUserId) {
		this.ownerUserId = ownerUserId;
	}
	public String getBrandImgUrl() {
		return brandImgUrl;
	}
	public void setBrandImgUrl(String brandImgUrl) {
		this.brandImgUrl = brandImgUrl;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getBrandCode() {
		return brandCode;
	}
	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}
	public String getBrandUrl() {
		return brandUrl;
	}
	public void setBrandUrl(String brandUrl) {
		this.brandUrl = brandUrl;
	}
}
