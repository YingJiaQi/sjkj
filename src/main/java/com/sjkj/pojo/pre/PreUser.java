package com.sjkj.pojo.pre;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Table;

import com.alibaba.fastjson.annotation.JSONField;
import com.sjkj.pojo.BasePojo;

@Table(name = "tbl_pre_user")
public class PreUser  extends BasePojo{
	@Column(name="user_code")
	private String userCode;
	@Column(name="user_password")
	private String userPassword;
	@Column(name="user_name")
	private String userName;
	@Column(name="user_gender")
	private String userGender;
	@Column(name="user_mobile")
	private String userMobile;
	@Column(name="user_email")
	private String userEmail;
	@Column(name="birthday")
	private Date birthday;
	@Column(name="privilege_level")
	private Integer privilegeLevel;//0普通（默认），1单个模板，2自定义权限
	@Column(name="last_login_time")
	private Date lastLoginTime;
	@Column(name="login_times")
	private Integer loginTimes;
	
	@JSONField(format= "yyyy-MM-dd HH:mm:ss")
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	@JSONField(format= "yyyy-MM-dd HH:mm:ss")
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Integer getPrivilegeLevel() {
		return privilegeLevel;
	}
	public void setPrivilegeLevel(Integer privilegeLevel) {
		this.privilegeLevel = privilegeLevel;
	}
	public Integer getLoginTimes() {
		return loginTimes;
	}
	public void setLoginTimes(Integer loginTimes) {
		this.loginTimes = loginTimes;
	}
	
}
