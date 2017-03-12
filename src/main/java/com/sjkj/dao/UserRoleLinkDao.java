package com.sjkj.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.abel533.mapper.Mapper;
import com.sjkj.pojo.UserRoleLink;

public interface UserRoleLinkDao extends Mapper<UserRoleLink>{
	// 根据用户ID，查询该用户所有的角色
	List<UserRoleLink> findAllRolesByUserID(@Param("id")String id);
}
