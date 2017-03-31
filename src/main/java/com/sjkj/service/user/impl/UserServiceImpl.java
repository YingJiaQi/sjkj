package com.sjkj.service.user.impl;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
import com.sjkj.utils.times.DateUtil;
import com.sjkj.vo.PageBean;
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
	public User findUserByUsername(String userAccount) {
		Example example = new Example(User.class);
		example.createCriteria().andEqualTo("userCode", userAccount);
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
	@Override
	public Map<String, Object> getUserList(PageBean pageBean) {
		Map<String, Object> result = new HashMap<String, Object>();
		PageHelper.startPage(pageBean.getPage(), pageBean.getRows());
		Example example = new Example(User.class);
		example.createCriteria().andEqualTo("isDel", 0);
		List<User> uList = userDao.selectByExample(example);
		PageInfo<User> po = new PageInfo<User>(uList);
		result.put("total", po.getTotal());
		result.put("rows", po.getList());
		return result;
	}
	@Override
	public void updateLoginTimesAndLastLoginTime(String userAccount) {
		Example example = new Example(User.class);
		example.createCriteria().andEqualTo("isDel", 0);
		example.createCriteria().andEqualTo("userCode", userAccount);
		List<User> selectByExample = userDao.selectByExample(example);
		User user = selectByExample.get(0);
		user.setLastLoginTime(new Date());
		if(StringUtils.isNoneBlank(user.getLoginTimes()+"") && user.getLoginTimes() != null){
			user.setLoginTimes(user.getLoginTimes()+1);
		}else{
			user.setLoginTimes(1);
		}
		userDao.updateByPrimaryKey(user);
	}
	@Override
	public Map<String, String> updateUser(User user) {
		Map<String, String> result = new HashMap<String, String>();
		User u = userDao.selectByPrimaryKey(user.getId());
		u.setBirthday(user.getBirthday());
		u.setIsActive(user.getIsActive());
		u.setUpdateTime(new Date());
		u.setUserEmail(user.getUserEmail());
		u.setUserGender(user.getUserGender());
		u.setUserMobile(user.getUserMobile());
		u.setUserName(user.getUserName());
		int updateByPrimaryKey = userDao.updateByPrimaryKey(u);
		if(updateByPrimaryKey >0){
			result.put("success", "true");
			result.put("msg", "更新成功");
		}else{
			result.put("success", "false");
			result.put("msg", "更新失败");
		}
		return result;
	}
	@Override
	public Map<String, String> deleteUserById(User user) {
		Map<String, String> result = new HashMap<String, String>();
		User u = userDao.selectByPrimaryKey(user.getId());
		u.setUpdateTime(new Date());
		u.setIsActive(0);
		u.setIsDel(1);
		int updateByPrimaryKey = userDao.updateByPrimaryKey(u);
		if(updateByPrimaryKey >0){
			result.put("success", "true");
			result.put("msg", "删除成功");
		}else{
			result.put("success", "false");
			result.put("msg", "删除失败");
		}
		return result;
	}
	@Override
	public Map<String, String> addUser(User user) {
		Map<String, String> result = new HashMap<String, String>();
		//用户账号不能重复
		Example example = new Example(User.class);
		example.createCriteria().andEqualTo("userCode", user.getUserCode());
		example.createCriteria().andEqualTo("isDel", 0);
		List<User> selectByExample = userDao.selectByExample(example);
		if(selectByExample.size() >0){
			result.put("success", "false");
			result.put("msg", "用户账号已存在");
			return result;
		}
		user.setCreateTime(new Date());
		user.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		user.setIsDel(0);
		user.setLoginTimes(null);
		user.setLastLoginTime(null);
		user.setLoginTimes(0);
		user.setUpdateTime(user.getCreateTime());
		user.setUserPassword("4QrcOUm6Wau+VuBX8g+IPg==");//初始密码123456
		userDao.insert(user);
		result.put("success", "true");
		result.put("msg", "添加成功，初始密码123456");
		return result;
	}
	@Override
	public Map<String, String> operateUser(HttpServletRequest param) {
		String oper = param.getParameter("oper");
		String userCode = param.getParameter("userCode");
		String userName = param.getParameter("userName");
		String userGender = param.getParameter("userGender");
		String userEmail = param.getParameter("userEmail");
		String birthday = param.getParameter("birthday");
		String isActive = param.getParameter("isActive");
		String userMobile = param.getParameter("userMobile");
		String id = param.getParameter("id");
		User user = new User();
		try {
			user.setBirthday(DateUtil.convertDate(birthday));
			if(StringUtils.equals("YES", isActive)){
				user.setIsActive(1);
			}else{
				user.setIsActive(0);
			}
			user.setUserCode(userCode);
			user.setUserEmail(userEmail);
			user.setUserGender(Integer.parseInt(userGender));
			user.setUserMobile(userMobile);
			user.setUserName(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, String> result = new HashMap<String,String>();
		if(StringUtils.equals(oper, "edit")){
			user.setId(id);
			result = updateUser(user);
		}
		if(StringUtils.equals(oper, "add")){
			result = addUser(user);
		}
		if(StringUtils.equals(oper, "add")){
			user.setId(id);
			result = deleteUserById(user);
		}
		return result;
	}
}
