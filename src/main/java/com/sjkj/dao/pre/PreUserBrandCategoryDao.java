package com.sjkj.dao.pre;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.abel533.mapper.Mapper;
import com.sjkj.pojo.pre.PreUserBrandCategory;

public interface PreUserBrandCategoryDao  extends Mapper<PreUserBrandCategory>{

	List<PreUserBrandCategory> getCategoryList(@Param("uid")String uid, @Param("userCode")String userCode);

}
