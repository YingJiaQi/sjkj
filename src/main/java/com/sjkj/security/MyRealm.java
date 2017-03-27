package com.sjkj.security;


import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.sjkj.pojo.User;
import com.sjkj.service.user.UserService;


public class MyRealm extends AuthorizingRealm {

	//依赖注入
	@Autowired
	private UserService userService;
	/*@Autowired
	private UserRoleLinkDao userRoleLinkDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private RoleAuthorityLinkDao roleAuthorityLinkDao;
	@Autowired
	private AuthorityDao authorityDao;*/
	@Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
	    System.out.println("授权");
/*	    //获取用户
	    Subject subject = SecurityUtils.getSubject();
	    User user = (User) subject.getPrincipal();
	    String username = user.getUserName();
	    SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
	    //判断用户
	    if("admin".equals(username)){
	    	//此时是超级管理员用户，有所有的权限
	    	List<Role> rlist = roleDao.findAll();
	    	for(Role e:rlist){
	    		info.addRole(e.getCode());
	    	}
	    	List<Authority> flist = authorityDao.findAll();
	    	for(Authority e:flist){
	    		info.addStringPermission(e.getCode());
	    	}
	    	return info;
	    }else{
	    	List<UserRoleLink> urlist = userRoleLinkDao.findAllByUserId(user.getId());
	    	List<Role> rlist = new ArrayList<Role>(); 
	    	for(UserRoleLink ele: urlist){
	    		Role role = roleDao.findById(ele.getRoleId());
	    		rlist.add(role);
	    	}
	    	for(Role e : rlist){
	    		info.addRole(e.getCode());
	    		List<RoleAuthorityLink> aList = roleAuthorityLinkDao.findAllByRoleId(e.getId());
	    		for(RoleAuthorityLink f: aList){
	    			Authority auth = authorityDao.findById(f.getAuthorityId());
	    			info.addStringPermission(auth.getCode());
	    		}
	    	}
	    	return info;
	    }*/
	    return null;
    }

	@Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
	    System.out.println("认证");
	   //将token强制转换成usernamepasswordtoken对象，因为此对象可以获得管理器中的用户名和密码
	    UsernamePasswordToken loginToke = (UsernamePasswordToken) token;
		String username = loginToke.getUsername();// 客户提交的用户
		//判断是前台用户还是后台用户
		if(username.contains("pre")){
			//前台用户
			int indexOf = username.indexOf("pre");
			username = username.substring(indexOf+3);
			
			// 查询到用户存在 将数据库密码以及对象给予 AuthenticationInfo
			// 参数一 表示 existUser 参数二 数据库查询 密码 参数三 spring 配置 里面 注册该real bean id 属性名称
			// AuthenticationInfo info = new SimpleAuthenticationInfo(existUser, existUser.getPassword(), "bosrealm");
			AuthenticationInfo info = new SimpleAuthenticationInfo(existUser, existUser.getUserPassword(), super.getName());
			return info; // 返回控制 表示没有认证许可 认证失败 AuthenticationInfo*/

		}else{
			// 通过密码校验完成 认证 系统而言 账号(唯一) 密码(可以重复) 通过账号--->密码 (数据库的密码)
			User existUser = userService.findUserByUsername(username);
			if (existUser == null) {
				return null;
			}
			// 查询到用户存在 将数据库密码以及对象给予 AuthenticationInfo
			// 参数一 表示 existUser 参数二 数据库查询 密码 参数三 spring 配置 里面 注册该real bean id 属性名称
			// AuthenticationInfo info = new SimpleAuthenticationInfo(existUser, existUser.getPassword(), "bosrealm");
			AuthenticationInfo info = new SimpleAuthenticationInfo(existUser, existUser.getUserPassword(), super.getName());
			return info; // 返回控制 表示没有认证许可 认证失败 AuthenticationInfo*/
		}
	 }

}
