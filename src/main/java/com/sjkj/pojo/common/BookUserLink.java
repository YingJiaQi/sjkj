package com.sjkj.pojo.common;

import javax.persistence.Column;
import javax.persistence.Table;

import com.sjkj.pojo.BasePojo;
/**
 * 书籍与用户关联表
 * @author YJQ
 *
 */
@Table(name="tbl_c_books_user_config")
public class BookUserLink extends BasePojo{
	@Column(name="user_code")
	private String userCode;
	@Column(name="book_id")
	private String bookId;//书籍ID
	@Column(name="book_name")
	private String bookName;//书籍名
	@Column(name="curr_location")
	private String currLocation;//读到的章节位置
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getCurrLocation() {
		return currLocation;
	}
	public void setCurrLocation(String currLocation) {
		this.currLocation = currLocation;
	}
	
	
}
