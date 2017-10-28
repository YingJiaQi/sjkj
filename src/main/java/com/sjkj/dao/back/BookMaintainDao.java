package com.sjkj.dao.back;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.abel533.mapper.Mapper;
import com.sjkj.pojo.common.BookDetail;

public interface BookMaintainDao  extends Mapper<BookDetail>{

	List<BookDetail> getBookByCondition(@Param("condition")String condition);

	List<BookDetail> selectByAuthorAndName(@Param("bookAuthor")String bookAuthor, @Param("bookName")String bookName);
}
