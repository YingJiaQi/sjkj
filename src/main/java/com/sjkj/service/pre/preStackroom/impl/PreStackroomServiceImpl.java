package com.sjkj.service.pre.preStackroom.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sjkj.dao.back.BookMaintainDao;
import com.sjkj.pojo.common.BookDetail;
import com.sjkj.service.pre.preStackroom.PreStackroomService;
@Service
public class PreStackroomServiceImpl implements PreStackroomService {
	@Autowired
	private BookMaintainDao bookMaintainDao;
	@Override
	public Map<String, Object> getBooksList() {
		Map<String, Object> result = new HashMap<String,Object>();
		//新上架
		Calendar calendar1 = Calendar.getInstance();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		calendar1.add(Calendar.DATE, -3);
		String three_days_ago = sdf1.format(calendar1.getTime());
		PageHelper.startPage(1, 12);
		Example example = new Example(BookDetail.class);
		example.createCriteria().andEqualTo("isDel", 0);
		example.createCriteria().andGreaterThanOrEqualTo("createTime", three_days_ago);
		example.setOrderByClause("createTime desc");
		List<BookDetail> newList = bookMaintainDao.selectByExample(example);
		PageInfo<BookDetail> po = new PageInfo<BookDetail>(newList);
		result.put("newList", po.getList());
		
		//畅销榜
		PageHelper.startPage(1, 12);
		Example cx = new Example(BookDetail.class);
		cx.createCriteria().andEqualTo("isDel", 0);
		cx.setOrderByClause("buyTimes desc");
		List<BookDetail> cxList = bookMaintainDao.selectByExample(cx);
		PageInfo<BookDetail> cxPb = new PageInfo<BookDetail>(cxList);
		result.put("cxList", cxPb.getList());
		
		//好评榜
		PageHelper.startPage(1, 12);
		Example hp = new Example(BookDetail.class);
		hp.createCriteria().andEqualTo("isDel", 0);
		hp.setOrderByClause("agreeTimes desc");
		List<BookDetail> hpList = bookMaintainDao.selectByExample(hp);
		PageInfo<BookDetail> hpPb = new PageInfo<BookDetail>(hpList);
		result.put("hpList", hpPb.getList());
		
		//收藏榜
		PageHelper.startPage(1, 12);
		Example sc = new Example(BookDetail.class);
		sc.createCriteria().andEqualTo("isDel", 0);
		sc.setOrderByClause("collectTimes desc");
		List<BookDetail> scList = bookMaintainDao.selectByExample(sc);
		PageInfo<BookDetail> scpb = new PageInfo<BookDetail>(scList);
		result.put("scList", scpb.getList());
		
		result.put("success", "true");
		return result;
	}

}
