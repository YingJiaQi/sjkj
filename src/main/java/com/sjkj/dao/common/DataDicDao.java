package com.sjkj.dao.common;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.abel533.mapper.Mapper;
import com.sjkj.pojo.common.DataDic;

public interface DataDicDao  extends Mapper<DataDic>{

	List<DataDic> getDataByCondition(@Param("condition")String condition);

}
