package com.sjkj.bussinessUtils;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.abel533.entity.Example;
import com.sjkj.dao.common.DataDicDao;
import com.sjkj.pojo.common.DataDic;
import com.sjkj.utils.JdbcUtil;
public class DataDicUtils {
	@Autowired
	public static DataDicDao dataDicDao;
	/**
	 * @DESC jqgird使用  根据   字典类型编码   查找所有的字典码及数据 JSONObject(BelongCode,BelongName)
	 * @param docCode
	 * @author YJQ
	 * @return
	 */
	public static String getMapByDocCode(String docCode){
		StringBuffer sb = new StringBuffer("<select multiple='multiple'>");
		try {
			List<Map<String, String>> dlist = JdbcUtil.queryApplyMoreMap("SELECT 	doc.belong_code,	doc.belong_name,	"
					+ "ch.belong_name parName FROM 	tbl_c_data_dic doc   LEFT JOIN (SELECT belong_code,belong_name from tbl_c_data_dic "
					+ " where doc_code = '"+docCode+"') ch ON doc.parent_belong_code  = ch.belong_code WHERE 	is_deleted = 0 AND  "
					+ "parent_belong_code IS NOT NULL AND doc_code = '"+docCode+"' ORDER BY doc.belong_code");
			if(dlist.size()>0){
				for(int i=0;i<dlist.size();i++){
					Map<String, String> map = dlist.get(i);
					String parName = map.get("parName");
					//查询父字典码名称 
					sb.append("<option value='"+map.get("belong_code")+"'>"+parName+"_"+map.get("belong_name")+"</option>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		sb.append("</select>");
		return sb.toString();
	}
	/**
	 * @DESC  根据字典码查找对应数据值
	 * @param belongCode 字典码
	 * @param docCode	字典类型编码
	 * @author YJQ
	 * @return
	 */
	public static String getBelongNameByBelongCode(String docCode, String belongCode){
		Example example = new Example(DataDic.class);
		example.createCriteria().andEqualTo("docCode", docCode).andEqualTo("isDel", 0).andEqualTo("belongCode", belongCode);
		List<DataDic> dlist = dataDicDao.selectByExample(example);
		if(dlist.size()>0){
			return dlist.get(0).getBelongName();
		}else{
			return null;
		}
	}
	/**
	 * jqgird使用  根据字典类型编码 获取该类型节点的所有父字典码  如果此时添加的是父节点 则此选项不选就好 
	 * @param docCode
	 * @return
	 */
	public static String getParentBelongCodeBydocCode(String docCode) {
		StringBuffer sb = new StringBuffer("<select multiple='multiple'>");
		try {
			List<Map<String, String>> dlist = JdbcUtil.queryApplyMoreMap("select belong_code,belong_name from tbl_c_data_dic where is_deleted =0 and parent_belong_code is null and doc_code = "+docCode);
			if(dlist.size()>0){
				for(int i=0;i<dlist.size();i++){
					Map<String, String> map = dlist.get(i);
					sb.append("<option value='"+map.get("belong_code")+"'>"+map.get("belong_name")+"</option>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		sb.append("</select>");
		return sb.toString();
	}
}
