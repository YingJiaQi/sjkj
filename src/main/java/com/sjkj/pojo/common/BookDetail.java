package com.sjkj.pojo.common;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Table;

import com.sjkj.pojo.BasePojo;
/**
 * 书籍详情表(所有权属于网站)
 * @author YJQ
 *
 */
@Table(name="tbl_c_books_detail")
public class BookDetail extends BasePojo{
	@Column(name="book_name")
	private String bookName;//书名（加索引）
	@Column(name="book_author")
	private String bookAuthor;//作者（加索引）
	@Column(name="belong_category")
	private String belongCategory;//所属类目（可多个，以逗号分隔）（加索引）
	@Column(name="sore")
	private BigDecimal sore;//得分
	@Column(name="read_times")
	private Integer readTimes;//阅读次数（针对此书籍） 
	@Column(name="agree_times")
	private Integer agreeTimes;//点赞次数（针对此书籍） 
	@Column(name="against_times")
	private Integer againstTimes;//反对次数（针对此书籍） 
	
	@Column(name="collect_times")
	private Integer collectTimes;//收藏次数（针对此书籍） 
	@Column(name="buy_times")
	private Integer buyTimes;//购买次数
	@Column(name="book_sizes")
	private BigDecimal bookSizes;//书籍大小(单位 M)
	
	@Column(name="price")
	private BigDecimal price;//所需积分
	@Column(name="is_done")
	private Integer isDone;//是否完结  0没有1已完结
	@Column(name="is_share")
	private Integer isShare;//是否共享
	
	@Column(name="pic_url")
	private String picUrl;//书籍封面图片地址
	@Column(name="book_url")
	private String bookUrl;//书籍存储地址
	
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	public String getBookUrl() {
		return bookUrl;
	}
	public void setBookUrl(String bookUrl) {
		this.bookUrl = bookUrl;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public String getBelongCategory() {
		return belongCategory;
	}
	public void setBelongCategory(String belongCategory) {
		this.belongCategory = belongCategory;
	}
	public BigDecimal getSore() {
		return sore;
	}
	public void setSore(BigDecimal sore) {
		this.sore = sore;
	}
	public Integer getReadTimes() {
		return readTimes;
	}
	public void setReadTimes(Integer readTimes) {
		this.readTimes = readTimes;
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
	public Integer getCollectTimes() {
		return collectTimes;
	}
	public void setCollectTimes(Integer collectTimes) {
		this.collectTimes = collectTimes;
	}
	public Integer getBuyTimes() {
		return buyTimes;
	}
	public void setBuyTimes(Integer buyTimes) {
		this.buyTimes = buyTimes;
	}
	public BigDecimal getBookSizes() {
		return bookSizes;
	}
	public void setBookSizes(BigDecimal bookSizes) {
		this.bookSizes = bookSizes;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Integer getIsDone() {
		return isDone;
	}
	public void setIsDone(Integer isDone) {
		this.isDone = isDone;
	}
	public Integer getIsShare() {
		return isShare;
	}
	public void setIsShare(Integer isShare) {
		this.isShare = isShare;
	}
	
	
}
