package com.sjkj.pojo;

import javax.persistence.Column;
import javax.persistence.Table;



@Table(name = "tbl_s_user_role_link")
public class UserRoleLink  extends BasePojo{
	@Column(name="user_id")
    private String userId;
	@Column(name="role_id")
    private String roleId;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
}
