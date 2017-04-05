package com.sjkj.service.pre.preUser.impl;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sjkj.dao.pre.PreUserDao;
import com.sjkj.pojo.User;
import com.sjkj.pojo.pre.PreUser;
import com.sjkj.service.pre.preUser.PreUserService;
import com.sjkj.utils.Base64;
import com.sjkj.utils.times.DateUtil;
import com.sjkj.vo.PageBean;
@Service
public class PreUserServiceImpl implements PreUserService {
	@Autowired
	private PreUserDao preUserDao;
	@Override
	public Map<String, String> addPreUser(PreUser preUser) {
		Map<String, String> result = new HashMap<String, String>();
		//解密
		String username = Base64.getFromBase64(preUser.getUserName());
		preUser.setUserName(username);
		String useremail = Base64.getFromBase64(preUser.getUserEmail());
		preUser.setUserEmail(useremail);
		//对密码加密
		String password = null;
		try {
			BASE64Decoder base64 = new BASE64Decoder();
			byte[] newPwds = base64.decodeBuffer(preUser.getUserPassword());
			MessageDigest md5s = MessageDigest.getInstance("MD5");
			byte[] digests = md5s.digest(newPwds);
			BASE64Encoder base64ens = new BASE64Encoder();
			//加密后的字符串
			password = base64ens.encode(digests);
		} catch (NoSuchAlgorithmException | IOException e) {
			e.printStackTrace();
		}
		preUser.setUserPassword(password);
		//查询用户名是否存在
		Example example = new Example(PreUser.class);
		example.createCriteria().andEqualTo("userName", preUser.getUserName());
		example.createCriteria().andEqualTo("isDel", 0);
		List<PreUser> selectByExample = preUserDao.selectByExample(example);
		if(selectByExample.size() >0){
			result.put("msg", "用户名已存在");
			result.put("success", "false");
		}
		//userCode组成   时间+7位用户注册序号前位补0
		SimpleDateFormat sdf = new SimpleDateFormat(DateUtil.YMD9);
		String format = sdf.format(new Date());
		
		PreUser record = new PreUser();
		record.setIsDel(0);
		int totalUser = preUserDao.selectCount(record);
		if(totalUser == 0){
			totalUser =1;
		}
		String userCount = (totalUser+1)+"";
		while(userCount.length() < 9){
			userCount = "0"+userCount;
		}
		preUser.setUserCode(format+userCount);
		preUser.setCreateTime(new Date());
		preUser.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		preUser.setIsDel(0);
		preUser.setLastLoginTime(new Date());
		preUser.setLoginTimes(1);
		preUser.setPrivilegeLevel(0);
		preUser.setUpdateTime(new Date());
		preUserDao.insert(preUser);
		result.put("msg", "添加成功");
		result.put("success", "true");
		return result;
	}
	@Override
	public Map<String, String> preUserLogin(PreUser preUser) {
		Map<String, String> result = new HashMap<String, String>();
		//密码处理
		String password = null;
		try {
			BASE64Decoder base64 = new BASE64Decoder();
			byte[] newPwds = base64.decodeBuffer(preUser.getUserPassword());
			MessageDigest md5s = MessageDigest.getInstance("MD5");
			byte[] digests = md5s.digest(newPwds);
			BASE64Encoder base64ens = new BASE64Encoder();
			//加密后的字符串
			password = base64ens.encode(digests);
		} catch (NoSuchAlgorithmException | IOException e) {
			e.printStackTrace();
		}
		//前台用户输入的是，userCode或userName或userEmail由前台JS判断
		try {
			Example example = new Example(PreUser.class);
			if(StringUtils.isNoneBlank(preUser.getUserCode())){
				SecurityUtils.getSubject().login(new UsernamePasswordToken("preUserCode"+preUser.getUserCode(),password));
				example.createCriteria().andEqualTo("userCode", preUser.getUserCode());
			}else if(StringUtils.isNoneBlank(preUser.getUserName())){
				SecurityUtils.getSubject().login(new UsernamePasswordToken("preUserName"+preUser.getUserName(),password));
				example.createCriteria().andEqualTo("userName", preUser.getUserName());
			}else if(StringUtils.isNoneBlank(preUser.getUserEmail())){
				SecurityUtils.getSubject().login(new UsernamePasswordToken("preUserEmail"+preUser.getUserEmail(),password));
				example.createCriteria().andEqualTo("userEmail",preUser.getUserEmail());
			}
			//用户登录信息修改
			example.createCriteria().andEqualTo("isDel", 0);
			List<PreUser> selectByExample = preUserDao.selectByExample(example);
			if(selectByExample.size() >0){
				
			}
		} catch (AuthenticationException e) {
			result.put("success", "false");
			result.put("msg","用户名或密码错误");
		}
		return result;
	}
	@Override
	public PreUser findPreUserByUsername(String username) {
		Example example = new Example(PreUser.class);
		example.createCriteria().andEqualTo("userName", username);
		example.createCriteria().andEqualTo("isDel", 0);
		List<PreUser> selectByExample = preUserDao.selectByExample(example);
		return selectByExample.size() >0 ? selectByExample.get(0):null;
	}
	@Override
	public PreUser findPreUserByUserCode(String usercode) {
		Example example = new Example(PreUser.class);
		example.createCriteria().andEqualTo("userCode", usercode);
		example.createCriteria().andEqualTo("isDel", 0);
		List<PreUser> selectByExample = preUserDao.selectByExample(example);
		return selectByExample.size() >0 ? selectByExample.get(0):null;
	}
	@Override
	public PreUser findPreUserByUserEmail(String useremail) {
		Example example = new Example(PreUser.class);
		example.createCriteria().andEqualTo("userEmail", useremail);
		example.createCriteria().andEqualTo("isDel", 0);
		List<PreUser> selectByExample = preUserDao.selectByExample(example);
		return selectByExample.size() >0 ? selectByExample.get(0):null;
	}
	@Override
	public Map<String, Object> getUserList(PageBean pageBean) {
		Map<String, Object> result = new HashMap<String, Object>();
		PageHelper.startPage(pageBean.getPage(), pageBean.getRows());
		Example example = new Example(PreUser.class);
		example.createCriteria().andEqualTo("isDel", 0);
		List<PreUser> uList = preUserDao.selectByExample(example);
		PageInfo<PreUser> po = new PageInfo<PreUser>(uList);
		result.put("records", po.getTotal());
		result.put("page", pageBean.getPage());
		//result.put("total", po.getTotal()/pageBean.getRows())//总页数
		result.put("rows", po.getList());
		return result;
	}
	public Map<String, String> deleteUserById(PreUser user) {
		Map<String, String> result = new HashMap<String, String>();
		PreUser u = preUserDao.selectByPrimaryKey(user.getId());
		u.setUpdateTime(new Date());
		u.setIsDel(1);
		int updateByPrimaryKey = preUserDao.updateByPrimaryKey(u);
		if(updateByPrimaryKey >0){
			result.put("success", "true");
			result.put("msg", "删除成功");
		}else{
			result.put("success", "false");
			result.put("msg", "删除失败");
		}
		return result;
	}
	public Map<String, String> updateUser(PreUser user) {
		Map<String, String> result = new HashMap<String, String>();
		PreUser u = preUserDao.selectByPrimaryKey(user.getId());
		u.setBirthday(user.getBirthday());
		u.setUpdateTime(new Date());
		u.setUserEmail(user.getUserEmail());
		u.setUserGender(user.getUserGender());
		u.setUserMobile(user.getUserMobile());
		u.setUserName(user.getUserName());
		u.setPrivilegeLevel(user.getPrivilegeLevel());
		int updateByPrimaryKey = preUserDao.updateByPrimaryKey(u);
		if(updateByPrimaryKey >0){
			result.put("success", "true");
			result.put("msg", "更新成功");
		}else{
			result.put("success", "false");
			result.put("msg", "更新失败");
		}
		return result;
	}
	public Map<String, String> addUser(PreUser user) {
		Map<String, String> result = new HashMap<String, String>();
		//用户账号不能重复
		Example example = new Example(PreUser.class);
		example.createCriteria().andEqualTo("userName", user.getUserName());
		example.createCriteria().andEqualTo("isDel", 0);
		List<PreUser> selectByExample = preUserDao.selectByExample(example);
		if(selectByExample.size() >0){
			result.put("success", "false");
			result.put("msg", "用户名已存在");
			return result;
		}
		//userCode组成   时间+7位用户注册序号前位补0
		SimpleDateFormat sdf = new SimpleDateFormat(DateUtil.YMD9);
		String format = sdf.format(new Date());
		
		PreUser record = new PreUser();
		record.setIsDel(0);
		int totalUser = preUserDao.selectCount(record);
		if(totalUser == 0){
			totalUser =1;
		}
		String userCount = (totalUser+1)+"";
		while(userCount.length() < 9){
			userCount = "0"+userCount;
		}
		user.setUserCode(format+userCount);
		user.setCreateTime(new Date());
		user.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		user.setIsDel(0);
		user.setLoginTimes(null);
		user.setLastLoginTime(null);
		user.setLoginTimes(0);
		user.setUpdateTime(user.getCreateTime());
		user.setUserPassword("4QrcOUm6Wau+VuBX8g+IPg==");//初始密码123456
		preUserDao.insert(user);
		result.put("success", "true");
		result.put("msg", "添加成功，初始密码123456");
		return result;
	}
	@Override
	public Map<String, String> operatePreUser(HttpServletRequest param) {
		Map<String, String> result = new HashMap<String,String>();
		String oper = param.getParameter("oper");
		PreUser user = new PreUser();
		String id = param.getParameter("id");
		if(StringUtils.equals(oper, "del")){
			user.setId(id);
			result = deleteUserById(user);
			return result;
		}
		String userCode = param.getParameter("userCode");
		String userName = param.getParameter("userName");
		String userGender = param.getParameter("userGender");
		String userEmail = param.getParameter("userEmail");
		String birthday = param.getParameter("birthday");
		String userMobile = param.getParameter("userMobile");
		String privilegeLevel = param.getParameter("privilegeLevel");
		try {
			user.setBirthday(DateUtil.convertDate(birthday));
			user.setUserCode(userCode);
			user.setUserEmail(userEmail);
			user.setUserGender(userGender);
			user.setUserMobile(userMobile);
			user.setUserName(userName);
			user.setPrivilegeLevel(Integer.parseInt(privilegeLevel));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(StringUtils.equals(oper, "edit")){
			user.setId(id);
			result = updateUser(user);
		}
		if(StringUtils.equals(oper, "add")){
			result = addUser(user);
		}
		return result;
	}

}
