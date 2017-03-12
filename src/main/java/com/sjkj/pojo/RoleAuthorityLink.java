package com.sjkj.pojo;

import javax.persistence.Column;
import javax.persistence.Table;



@Table(name = "tbl_s_role_authority_link")
public class RoleAuthorityLink  extends BasePojo{
	@Column(name="authority_id")
    private String authorityId;
	@Column(name="role_id")
    private String roleId;
	public String getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(String authorityId) {
		this.authorityId = authorityId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
}
