package com.sjkj.dao;


import java.util.List;

import com.github.abel533.mapper.Mapper;
import com.sjkj.pojo.RoleAuthorityLink;

public interface RoleAuthorityLinkDao extends Mapper<RoleAuthorityLink>{
	//根据角色ID，查找权限
	List<RoleAuthorityLink> findAllPermissionByRoleId(String roleId);

}
