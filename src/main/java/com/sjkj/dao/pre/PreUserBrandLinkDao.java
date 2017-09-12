package com.sjkj.dao.pre;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.abel533.mapper.Mapper;
import com.sjkj.pojo.pre.PreUserBrandLink;

public interface PreUserBrandLinkDao  extends Mapper<PreUserBrandLink>{

	List<PreUserBrandLink> getUserBrandLinkList(@Param("uid")String uid, @Param("userCode")String userCode, @Param("bcName")String brandCategoryName, @Param("bcId")String id);

	List<PreUserBrandLink> selectByUsercodeAndBrandid(@Param("userCode")String userCode, @Param("brandId")String brandId);

	List<PreUserBrandLink> selectByUseridAndBrandid(@Param("userid")String userid, @Param("brandid")String brandid);

}
