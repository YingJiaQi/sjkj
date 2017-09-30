package com.sjkj.dao.pre;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.abel533.mapper.Mapper;
import com.sjkj.pojo.pre.PreNoteContent;

public interface PreNoteContentDao  extends Mapper<PreNoteContent>{

	List<PreNoteContent> getNoteList(@Param("userCode")String userCode);

}
