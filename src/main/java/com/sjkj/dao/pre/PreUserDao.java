package com.sjkj.dao.pre;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.abel533.mapper.Mapper;
import com.sjkj.pojo.pre.PreUser;

public interface PreUserDao  extends Mapper<PreUser>{

	List<PreUser> getDataByCondition(@Param("condition")String condition);

}
