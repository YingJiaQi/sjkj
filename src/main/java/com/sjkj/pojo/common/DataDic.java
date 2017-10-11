package com.sjkj.pojo.common;

import javax.persistence.Column;
import javax.persistence.Table;

import org.springframework.data.annotation.Transient;

import com.sjkj.pojo.BasePojo;
/**
 * 数据字典
 * @author YJQ
 *
 */
@Table(name="tbl_c_data_dic")
public class DataDic extends BasePojo{
	@Column(name="doc_code")
	private String docCode;//字典类型编号
	@Column(name="doc_name")
	private String docName;//字典类型名称
	@Column(name="belong_code")
	private String belongCode;//字典码（孩子）
	@Column(name="belong_name")
	private String belongName;//数据名称
	
	public String getBelongName() {
		return belongName;
	}
	public void setBelongName(String belongName) {
		this.belongName = belongName;
	}
	public String getDocCode() {
		return docCode;
	}
	public void setDocCode(String docCode) {
		this.docCode = docCode;
	}
	public String getDocName() {
		return docName;
	}
	public void setDocName(String docName) {
		this.docName = docName;
	}
	public String getBelongCode() {
		return belongCode;
	}
	public void setBelongCode(String belongCode) {
		this.belongCode = belongCode;
	}
}
