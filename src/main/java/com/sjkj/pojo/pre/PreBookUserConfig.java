package com.sjkj.pojo.pre;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Table;

import com.sjkj.pojo.BasePojo;
/**
 * 书籍与用户配置表
 * @author YJQ
 *
 */
@Table(name="tbl_c_books_user_config")
public class PreBookUserConfig extends BasePojo{
	@Column(name="page_color")
	private String pageColor;//页面颜色
	@Column(name="font_size")
	private Integer fontSize;//字体大小
	@Column(name="font_family")
	private BigDecimal fontFamily;//字体 
	@Column(name="line_width")
	private BigDecimal lineWidth;//行宽
	@Column(name="section_width")
	private String sectionWidth;//段宽
	@Column(name="page_size")
	private Integer pageSize;//页面大小 长*宽
	@Column(name="if_music")
	private Integer ifMusic;//是否播放音乐 0否1是
	
	@Column(name="music_name")
	private String musicName;//音乐名
	@Column(name="slide_way")
	private Integer slideWay;//翻页方式0下滑，1仿真翻页
	@Column(name="user_code")
	private String userCode;//该配置所属的用户CODE
	public String getPageColor() {
		return pageColor;
	}
	public void setPageColor(String pageColor) {
		this.pageColor = pageColor;
	}
	public Integer getFontSize() {
		return fontSize;
	}
	public void setFontSize(Integer fontSize) {
		this.fontSize = fontSize;
	}
	public BigDecimal getFontFamily() {
		return fontFamily;
	}
	public void setFontFamily(BigDecimal fontFamily) {
		this.fontFamily = fontFamily;
	}
	public BigDecimal getLineWidth() {
		return lineWidth;
	}
	public void setLineWidth(BigDecimal lineWidth) {
		this.lineWidth = lineWidth;
	}
	public String getSectionWidth() {
		return sectionWidth;
	}
	public void setSectionWidth(String sectionWidth) {
		this.sectionWidth = sectionWidth;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getIfMusic() {
		return ifMusic;
	}
	public void setIfMusic(Integer ifMusic) {
		this.ifMusic = ifMusic;
	}
	public String getMusicName() {
		return musicName;
	}
	public void setMusicName(String musicName) {
		this.musicName = musicName;
	}
	public Integer getSlideWay() {
		return slideWay;
	}
	public void setSlideWay(Integer slideWay) {
		this.slideWay = slideWay;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	
	
}
