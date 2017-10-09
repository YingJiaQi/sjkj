package com.sjkj.service.pre.preUser.impl;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sjkj.dao.pre.PreBrandDao;
import com.sjkj.dao.pre.PreUserBrandCategoryDao;
import com.sjkj.dao.pre.PreUserBrandLinkDao;
import com.sjkj.dao.pre.PreUserDao;
import com.sjkj.pojo.pre.PreBrand;
import com.sjkj.pojo.pre.PreUser;
import com.sjkj.pojo.pre.PreUserBrandCategory;
import com.sjkj.pojo.pre.PreUserBrandLink;
import com.sjkj.service.BaseService;
import com.sjkj.service.pre.preUser.PreUserService;
import com.sjkj.utils.Base64;
import com.sjkj.utils.PropsUtil;
import com.sjkj.utils.times.DateUtil;
import com.sjkj.vo.PageBean;
@Service
public class PreUserServiceImpl extends BaseService<PreUser> implements PreUserService {
	@Autowired
	private PreUserDao preUserDao;
	@Autowired
	private PreUserBrandCategoryDao preUserBrandCategoryDao;
	@Autowired
	private PreUserBrandLinkDao preUserBrandLinkDao;
	@Autowired
	private PreBrandDao preBrandDao;
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
			return result;
		}
		//查询用户名是否存在
		Example examples = new Example(PreUser.class);
		examples.createCriteria().andEqualTo("userEmail", preUser.getUserEmail());
		examples.createCriteria().andEqualTo("isDel", 0);
		List<PreUser> selectByExamples = preUserDao.selectByExample(example);
		if(selectByExamples.size() >0){
			result.put("msg", "邮箱已存在");
			result.put("success", "false");
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
		String userName = preUser.getUserName();
		if(userName != null){
			//解密
			userName = Base64.getFromBase64(userName);
		}
		
		//前台用户输入的是，userCode或userName或userEmail由前台JS判断
		try {
			SecurityUtils.getSubject().login(new UsernamePasswordToken(userName,password));
			//用户登录信息修改
			org.apache.shiro.subject.Subject subject = SecurityUtils.getSubject();
			Object principal = subject.getPrincipal();
			String jsonString = JSON.toJSONString(principal);
			JSONObject parseObject = JSON.parseObject(jsonString);
			String id = parseObject.get("id").toString();
			PreUser sp = preUserDao.selectByPrimaryKey(id);
			sp.setLastLoginTime(new Date());
			sp.setLoginTimes(sp.getLoginTimes()+1);
			preUserDao.updateByPrimaryKey(sp);
			result.put("success", "true");
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
	@Override
	public Map<String, Object> getCollectionWebsite() {
		Map<String, Object> result = new HashMap<String, Object>();
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		if(jsonString.equals("null") || jsonString == "null"){
			result.put("success", "false");
			result.put("msg", "请登录");
			return result;
		}
		JSONObject parseObject = JSON.parseObject(jsonString);
		String userCode = parseObject.get("userCode").toString();
		String uid = parseObject.get("id").toString();
		//获取该用户的收藏分类
		List<PreUserBrandCategory> pubcList = preUserBrandCategoryDao.getCategoryList(uid,userCode);
		Map<String, Object> categoryLinkList = new HashMap<String, Object>();
		if(pubcList.size() > 0){
			result.put("pubcList", pubcList);
			//当有分类时，循环查询该分类下所有的详细地址
			for(int i=0;i<pubcList.size();i++){
				PreUserBrandCategory preUserBrandCategory = pubcList.get(i);
				List<PreUserBrandLink> publList = preUserBrandLinkDao.getUserBrandLinkList(uid,userCode,preUserBrandCategory.getBrandCategoryName(),preUserBrandCategory.getId());
				//根据关联信息到brand表中查找详细数据
				if(publList.size() >0){
					//类目下存在收藏的地址
					List<PreBrand> pblistDetail = new ArrayList<PreBrand>();
					for(int j=0;j<publList.size();j++){
						Example  pb= new Example(PreBrand.class);
						pb.createCriteria().andEqualTo("id", publList.get(j).getBrandId());
						pb.createCriteria().andEqualTo("isDel", 0);
						List<PreBrand> pbList = preBrandDao.selectByExample(pb);
						List<PreBrand> new_pbList = new ArrayList<PreBrand>();
						for(int k=0;k<pbList.size();k++){
							PreBrand preBrand = pbList.get(k);
							preBrand.setBrandImgUrl(PropsUtil.get("temp_brandPic_path")+preBrand.getBrandImgUrl());
							new_pbList.add(preBrand);
						}
						pblistDetail.addAll(new_pbList);
					}
					categoryLinkList.put(i+"", pblistDetail);
				}else{
					categoryLinkList.put(i+"", null);
				}
			}
			result.put("publList", categoryLinkList);
			result.put("success", "true");
		}else{
			result.put("success", "false");
			result.put("msg", "没有收藏网址");
		}
		return result;
		
	}
	@Override
	public Map<String, Object> addUrlCategory(PreUserBrandCategory pubc) {
		Map<String, Object> result = new HashMap<String, Object>();
		String brandCategoryName = pubc.getBrandCategoryName();
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		JSONObject parseObject = JSON.parseObject(jsonString);
		String privilegeLevel = parseObject.get("privilegeLevel").toString();
		//普通用户和初级用户只能用6个
		int pl = Integer.parseInt(privilegeLevel);
		if((pl == 0 || pl == 1) && pubc.getBrandCategoryOrder() >6){
			result.put("success", "false");
			result.put("msg", "普通用户和初级用户只能使用6个收藏分类");
			return result;
		}
		
		//判断收藏类目是否存在，若存在不添加
		PreUserBrandCategory pp = preUserBrandCategoryDao.findBrandCategoryByCategoryName(brandCategoryName);
		if(pp != null){
			result.put("success", "false");
			result.put("msg", "该类目已存在");
			return result;
		}
		//排序
		String uid = parseObject.get("id").toString();
		String userCode = parseObject.get("userCode").toString();
		List<PreUserBrandCategory> categoryList = preUserBrandCategoryDao.getCategoryList(uid, userCode);
		if(categoryList.size() >0){
			for(PreUserBrandCategory ele:categoryList){
				Integer brandCategoryOrder = ele.getBrandCategoryOrder();
				Integer preOrder = pubc.getBrandCategoryOrder();
				if(brandCategoryOrder >= preOrder){
					//后台序列大于等于前台序列的，都加1，向后推一位
					ele.setBrandCategoryOrder(++brandCategoryOrder);
					ele.setUpdateTime(new Date());
					preUserBrandCategoryDao.updateByPrimaryKey(ele);
				}
			}
		}
		
		pubc.setCreateTime(new Date());
		pubc.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		pubc.setIsDel(0);
		pubc.setUpdateTime(new Date());
		pubc.setUserCode(userCode);
		pubc.setUserId(uid);
		preUserBrandCategoryDao.insert(pubc);
		result.put("success", "true");
		result.put("msg", "添加成功");
		return result;
	}
	@Override
	public Map<String, Object> updateUrlCategory(PreUserBrandCategory pubc,String cmd) {
		Map<String, Object> result = new HashMap<String, Object>();
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		JSONObject parseObject = JSON.parseObject(jsonString);
		//判断是删除不是更新操作
		if(Integer.parseInt(cmd) == 2){
			//此时为删除，逻辑删除，一定期限后定时任务，物理删除
			PreUserBrandCategory selectByPrimaryKey = preUserBrandCategoryDao.selectById(pubc.getId());
			selectByPrimaryKey.setIsDel(1);
			selectByPrimaryKey.setUpdateTime(new Date());
			preUserBrandCategoryDao.updateByPrimaryKey(selectByPrimaryKey);
			//重新排序，大于该序号的类目都减1
			Example record = new Example(PreUserBrandCategory.class);
			record.createCriteria().andEqualTo("isDel", 0);
			List<PreUserBrandCategory> plist = preUserBrandCategoryDao.selectByExample(record);
			if(plist.size() >0){
				for(int k=0;k<plist.size();k++){
					PreUserBrandCategory pbc = plist.get(k);
					if(pbc.getBrandCategoryOrder() > pubc.getIsDel()){
						pbc.setBrandCategoryOrder(pbc.getBrandCategoryOrder()-1);
						pbc.setUpdateTime(new Date());
						preUserBrandCategoryDao.updateByPrimaryKey(pbc);
					}
				}
			}
			result.put("success", "true");
			result.put("msg", "删除成功");
			return result;
		}
		
		String privilegeLevel = parseObject.get("privilegeLevel").toString();
		//普通用户和初级用户只能用6个
		int pl = Integer.parseInt(privilegeLevel);
		if((pl == 0 || pl == 1) && pubc.getBrandCategoryOrder() >6){
			result.put("success", "false");
			result.put("msg", "普通用户和初级用户只能使用6个收藏分类，序号超限");
			return result;
		}
		
		//判断是否改变了顺序(前台暂用IsDel存储原先的序号),旧序号与新序号比对
		int oldOrder = pubc.getIsDel();
		if(oldOrder == pubc.getBrandCategoryOrder()){
			//此是只要更新类目名即可
			pubc.setIsDel(0);
			PreUserBrandCategory selectByPrimaryKey = preUserBrandCategoryDao.selectById(pubc.getId());
			selectByPrimaryKey.setBrandCategoryName(pubc.getBrandCategoryName());
			selectByPrimaryKey.setUpdateTime(new Date());
			preUserBrandCategoryDao.updateByPrimaryKey(selectByPrimaryKey);
		}else{
			//排序
			String uid = parseObject.get("id").toString();
			String userCode = parseObject.get("userCode").toString();
			List<PreUserBrandCategory> categoryList = preUserBrandCategoryDao.getCategoryList(uid, userCode);
			if(categoryList.size() >0){
				for(PreUserBrandCategory ele:categoryList){
					Integer brandCategoryOrder = ele.getBrandCategoryOrder();
					Integer newOrder = pubc.getBrandCategoryOrder();
					if(newOrder >= oldOrder){
						ele.setUpdateTime(new Date());
						if(brandCategoryOrder == oldOrder){
							//将该目标数据的次序改变为新设定的次序
							ele.setBrandCategoryName(pubc.getBrandCategoryName());
							ele.setBrandCategoryOrder(newOrder);
						}else if(brandCategoryOrder >= oldOrder && brandCategoryOrder <= newOrder){
							//新序列大于等于旧序列
							//序列大于等于最新序列且序列小于等于旧序列的，都加1，向后推一位
							ele.setBrandCategoryOrder(--brandCategoryOrder);
						}
						preUserBrandCategoryDao.updateByPrimaryKey(ele);
					}else{
						//新序列小于等于旧序列
						if(brandCategoryOrder >= newOrder){
							ele.setBrandCategoryOrder(++brandCategoryOrder);
							ele.setUpdateTime(new Date());
							if(pubc.getId().equals(ele.getId())){
								//更新类目名
								ele.setBrandCategoryName(pubc.getBrandCategoryName());
								ele.setBrandCategoryOrder(newOrder);
								preUserBrandCategoryDao.updateByPrimaryKey(ele);
								break;
							}
							preUserBrandCategoryDao.updateByPrimaryKey(ele);
						}
					}
				}
			}
		}
		result.put("success", "true");
		result.put("msg", "更新成功");
		return result;
	}
	@Override
	public Map<String, Object> getUserInfo() {
		Map<String, Object> result = new HashMap<String, Object>();
		Object principal = SecurityUtils.getSubject().getPrincipal();
		String jsonString = JSON.toJSONString(principal);
		JSONObject parseObject = JSON.parseObject(jsonString);
		String userCode = parseObject.get("userCode").toString();
		String uid = parseObject.get("id").toString();
		Example example = new Example(PreUser.class);
		example.createCriteria().andEqualTo("userCode", userCode);
		example.createCriteria().andEqualTo("id", uid);
		List<PreUser> selectByExample = preUserDao.selectByExample(example);
		PreUser user = null;
		if(selectByExample.size()>0){
			user = (PreUser)selectByExample.get(0);
		}
		result.put("success", "true");
		result.put("data", user);
		return result;
	}

}
