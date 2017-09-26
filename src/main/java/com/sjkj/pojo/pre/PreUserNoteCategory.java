package com.sjkj.pojo.pre;

import javax.persistence.Column;
import javax.persistence.Table;

import com.sjkj.pojo.BasePojo;
@Table(name="tbl_pre_user_note_category")
public class PreUserNoteCategory extends BasePojo{
	@Column(name="note_cate")
	private String noteCate;//笔记类目 名
	@Column(name="own_user")
	private String ownUser;//所属用户code
	@Column(name="is_share")
	private Integer isShare;//是否共享，0不共享，1共享，共享时其它用户可以使用
	public String getNoteCate() {
		return noteCate;
	}
	public void setNoteCate(String noteCate) {
		this.noteCate = noteCate;
	}
	public String getOwnUser() {
		return ownUser;
	}
	public void setOwnUser(String ownUser) {
		this.ownUser = ownUser;
	}
	public Integer getIsShare() {
		return isShare;
	}
	public void setIsShare(Integer isShare) {
		this.isShare = isShare;
	}
	
	
}
