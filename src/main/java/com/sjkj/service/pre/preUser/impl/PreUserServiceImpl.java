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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.github.abel533.entity.Example;
import com.sjkj.dao.pre.PreUserDao;
import com.sjkj.pojo.pre.PreUser;
import com.sjkj.service.pre.preUser.PreUserService;
import com.sjkj.utils.Base64;
import com.sjkj.utils.MD5Util;
import com.sjkj.utils.times.DateUtil;
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
		while(userCount.length() < 7){
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

}
