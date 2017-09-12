package com.sjkj.pojo.pre;

import javax.persistence.Column;
import javax.persistence.Table;

import com.sjkj.pojo.BasePojo;
@Table(name="tbl_pre_user_note_content")//保存用户记录信息
public class PreNoteContent extends BasePojo{
	@Column(name="user_code")
	private String userCode; //用户CODE
	@Column(name="node_content")
	private String nodeContent;//用户填写的记录内容、笔记内容 
	@Column(name="read_times")
	private Integer readTimes;//阅读次数
	@Column(name="read_user_code")
	private String readUserCode;//阅读此记录的人的CODE，用于去除重复阅读，添加阅读记录
	@Column(name="is_share")
	private Integer isShare;//是否共享，0不共享，1共享，共享时其它用户可以使用
	@Column(name="cate_name")
	private String cateName; //记录所属类目名称
	@Column(name="note_title")
	private String noteTitle; //该记录标题
	@Column(name="comment_times")
	private Integer commentTimes; //评论次数
	@Column(name="nav_pic_addr")
	private String navPicAddr; //记录缩略显示时的图片地址 ，
	public String getNavPicAddr() {
		return navPicAddr;
	}
	public void setNavPicAddr(String navPicAddr) {
		this.navPicAddr = navPicAddr;
	}
	public String getCateName() {
		return cateName;
	}
	public Integer getCommentTimes() {
		return commentTimes;
	}
	public void setCommentTimes(Integer commentTimes) {
		this.commentTimes = commentTimes;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getNoteTitle() {
		return noteTitle;
	}
	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getNodeContent() {
		return nodeContent;
	}
	public void setNodeContent(String nodeContent) {
		this.nodeContent = nodeContent;
	}
	public Integer getReadTimes() {
		return readTimes;
	}
	public void setReadTimes(Integer readTimes) {
		this.readTimes = readTimes;
	}
	public String getReadUserCode() {
		return readUserCode;
	}
	public void setReadUserCode(String readUserCode) {
		this.readUserCode = readUserCode;
	}
	public Integer getIsShare() {
		return isShare;
	}
	public void setIsShare(Integer isShare) {
		this.isShare = isShare;
	}
	
	
}
