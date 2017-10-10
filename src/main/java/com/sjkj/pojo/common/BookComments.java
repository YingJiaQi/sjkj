package com.sjkj.pojo.common;

import javax.persistence.Column;
import javax.persistence.Table;

import com.sjkj.pojo.BasePojo;
/**
 * 书籍评价表
 * @author YJQ
 *
 */
@Table(name="tbl_c_books_comments")
public class BookComments extends BasePojo{
	@Column(name="book_id")
	private String bookId;//评论书籍id（索引）
	@Column(name="book_name")
	private String bookName;//评论书籍名
	@Column(name="comments_user_code")
	private String commentsUserCode;//评论用户code 
	@Column(name="comments_content")
	private String commentsContent;//评论内容
	@Column(name="parent_comment_id")
	private String parentCommentId;//父评论id
	@Column(name="agree_times")
	private Integer agreeTimes;//点赞次数（针对此次评论）
	@Column(name="against_times")
	private Integer againstTimes;//反对次数（针对此次评论）
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
	public String getCommentsUserCode() {
		return commentsUserCode;
	}
	public void setCommentsUserCode(String commentsUserCode) {
		this.commentsUserCode = commentsUserCode;
	}
	public String getCommentsContent() {
		return commentsContent;
	}
	public void setCommentsContent(String commentsContent) {
		this.commentsContent = commentsContent;
	}
	public String getParentCommentId() {
		return parentCommentId;
	}
	public void setParentCommentId(String parentCommentId) {
		this.parentCommentId = parentCommentId;
	}
	public Integer getAgreeTimes() {
		return agreeTimes;
	}
	public void setAgreeTimes(Integer agreeTimes) {
		this.agreeTimes = agreeTimes;
	}
	public Integer getAgainstTimes() {
		return againstTimes;
	}
	public void setAgainstTimes(Integer againstTimes) {
		this.againstTimes = againstTimes;
	}
	
}
