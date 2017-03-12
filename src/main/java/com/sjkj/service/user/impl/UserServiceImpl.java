package com.sjkj.service.user.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.abel533.entity.Example;
import com.sjkj.dao.AuthorityDao;
import com.sjkj.dao.RoleAuthorityLinkDao;
import com.sjkj.dao.SystemComponentsDao;
import com.sjkj.dao.UserDao;
import com.sjkj.dao.UserRoleLinkDao;
import com.sjkj.pojo.Authority;
import com.sjkj.pojo.RoleAuthorityLink;
import com.sjkj.pojo.SystemComponents;
import com.sjkj.pojo.User;
import com.sjkj.pojo.UserRoleLink;
import com.sjkj.service.user.UserService;
import com.sjkj.vo.VEasyuiTree;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private UserRoleLinkDao userRoleLinkDao;
	@Autowired
	private AuthorityDao authorityDao;
	@Autowired
	private RoleAuthorityLinkDao roleAuthorityLinkDao;
	@Autowired
	private SystemComponentsDao systemComponentsDao;
	@Override
	public User findUserByUsername(String username) {
		Example example = new Example(User.class);
		example.createCriteria().andEqualTo("userName", username);
		example.createCriteria().andEqualTo("isDel", 0);
		List<User> user = userDao.selectByExample(example);
		if(user.isEmpty()){
			return null;
		}
		return user.get(0);
	}
	@Override
	public Map<String, Object> changePwd(Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String,Object>();
		String oldPwd = param.get("oldPwd").toString();
		String newPwd = param.get("newPwd").toString();
		BASE64Decoder base64 = new BASE64Decoder();
		try {
			byte[] decodeBuffer = base64.decodeBuffer(oldPwd);
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] digest = md5.digest(decodeBuffer);
			BASE64Encoder base64en = new BASE64Encoder();
			//加密后的字符串
			oldPwd = base64en.encode(digest);
			
			byte[] newPwds = base64.decodeBuffer(newPwd);
			MessageDigest md5s = MessageDigest.getInstance("MD5");
			byte[] digests = md5s.digest(newPwds);
			BASE64Encoder base64ens = new BASE64Encoder();
			//加密后的字符串
			newPwd = base64ens.encode(digests);
		} catch (IOException | NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		Object user = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSONArray.toJSONString(user);
		JSONObject parseObject = JSON.parseObject(jsonString);
		String id = parseObject.get("id").toString();
		User uu = userDao.selectByPrimaryKey(id);
		if(!StringUtils.equals(oldPwd, uu.getUserPassword())){
			result.put("success", "false");
			result.put("msg", "原密码错误");
			return result;
		}
		uu.setUpdateTime(new Date());
		uu.setUserPassword(newPwd);
		userDao.updateByPrimaryKey(uu);
		result.put("success", "true");
		result.put("msg", "修改成功");
		return result;
	}
	@Override
	public List<?> getMenu() {
		// 根据用户ID，查询该用户所有的角色
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSONArray.toJSONString(principal);
		JSONObject parseObject = JSON.parseObject(jsonString);
		List<UserRoleLink> userRoleLinkList = userRoleLinkDao.findAllRolesByUserID(parseObject.get("id").toString());
		if(userRoleLinkList.size() <= 0){
			return null;
		}
		List<List<RoleAuthorityLink>> lists = new ArrayList<List<RoleAuthorityLink>>();
		//获取角色，根据角色获取权限
		for(UserRoleLink ur:userRoleLinkList){
			List<RoleAuthorityLink> ralist = roleAuthorityLinkDao.findAllPermissionByRoleId(ur.getRoleId());
			lists.add(ralist);
		}
		List<SystemComponents> scList = new ArrayList<SystemComponents>();
		//获取有权限的模块
		StringBuffer sb = new StringBuffer();
		for(List<RoleAuthorityLink> list:lists){
			for(RoleAuthorityLink ral:list){
				String authorityId = ral.getAuthorityId();
				if(sb.toString().contains(authorityId)){
					continue;
				}
				sb.append(authorityId+",");
				
				Authority author = authorityDao.selectByPrimaryKey(authorityId);
				//权限名
				String moduleName = author.getName();
				//根据权限名获取模块对象
				Example example = new Example(SystemComponents.class);
				example.createCriteria().andEqualTo("componentName", moduleName);
				List<SystemComponents> selectByExample = systemComponentsDao.selectByExample(example);
				//有权限则一定可以查到数据，查不到，说明数据错误
				SystemComponents systemComponents = selectByExample.get(0);
				scList.add(systemComponents);
			}
		}
		
		// 循环封装数据
		List<Map<String, Object>> menu = new ArrayList<Map<String, Object>>();
		for (SystemComponents c : scList) {
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("id", c.getComponentCode());
			if (StringUtils.isBlank(c.getParentComponent())) {
				m.put("pId", 0);
			} else {
				m.put("pId", c.getParentComponent());
			}
			m.put("componentCode", c.getComponentCode());
			m.put("name", c.getComponentName());
			if (StringUtils.isNoneBlank(c.getComponentUrl())) {
				m.put("page", c.getComponentUrl());
			}
			menu.add(m);
		}
		return menu;
	}
}
