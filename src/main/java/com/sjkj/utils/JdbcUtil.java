package com.sjkj.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * @ClassName:JdbcUtil
 * @Decription: 从连接池中获取连接，释放资源等
 * @version: 1.0  
 */
public class JdbcUtil {
	private static final Logger logger = LoggerFactory.getLogger(JdbcUtil.class);
	public static Connection getConnectionFromPool(){
		try {
			ApplicationContext context=new ClassPathXmlApplicationContext("spring/applicationContext.xml");
			DataSource dataSource = (DataSource) context.getBean("dataSource");
			Connection conn = dataSource.getConnection();
			return conn;
		} catch (SQLException e) {
			logger.error("获取连接失败异常 ：" + e.getMessage());
		}
		return null;
	}
	
	public static void release(Object object) {
		if(object == null){
			return;
		}
		if(object instanceof ResultSet){
			try {
				((ResultSet)object).close();
			} catch (SQLException e) {
				logger.error("数据库访问异常 ： " + e.getMessage());
			}
		} else if(object instanceof PreparedStatement){
			try {
				((PreparedStatement)object).close();
			} catch (SQLException e) {
				logger.error("数据库访问异常 ： " + e.getMessage());
			}
		} else if(object instanceof Connection){
			try {
				((Connection)object).close();
			} catch (SQLException e) {
				logger.error("数据库访问异常 ： " + e.getMessage());
			}
		}
	}
	/**
	 * @param 添加修改 - SQL调用（有参数）
	 * @param conn - 链接
	 * @param sql - SQL语句
	 * @param list - 参数
	 * @return
	 * @throws Exception
	 */
	public static Integer update(String sql,List<String> list) throws Exception{
		logger.info("SQL:"+sql);
		logger.info("params:"+Arrays.toString(list.toArray()));
		Connection conn = getConnectionFromPool();
		Integer result = 0;
		PreparedStatement stmt=conn.prepareStatement(sql);
		for(int i=0;i<list.size();i++){
			stmt.setString(i+1,list.get(i)); 
	    }
		result = stmt.executeUpdate();
		stmt.close();
		release(conn);
		return result;
	}	
	/**
	 * @param 添加修改 - SQL调用（无参数）
	 * @param conn - 链接
	 * @param sql - SQL语句
	 * @param list - 参数
	 * @return
	 * @throws Exception
	 */
	public static Integer update(String sql) throws Exception{
		logger.info("SQL:"+sql);
		Connection conn = getConnectionFromPool();
		Integer result = 0;
		PreparedStatement stmt=conn.prepareStatement(sql);
		result = stmt.executeUpdate();
		stmt.close();
		release(conn);
		return result;
	}	
	
	/**
	 * @param 查询结果 - 单条json(SQL语句不带占位符)
	 * @param querySql - SQL语句
	 * @return json - 单条
	 */
	public static String queryApplySingle(String sql) throws Exception {
		logger.info("SQL:"+sql);
		JSONObject jsonObj = new JSONObject();
		Connection conn = getConnectionFromPool();
		try {
			PreparedStatement stmt = null;
			ResultSet rs = null;
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			while (rs.next()) {

				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = rs.getString(columnName);
					jsonObj.put(columnName, value);
				}
			}
			rs.close();
			stmt.close();
			release(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObj.toString();
	}
	/**
	 * @param 查询结果 - 单条json(占位符)
	 * @param querySql - SQL语句
	 * @return json - 单条
	 */
	public static JSONObject queryApplySinglePlace(String sql,List<String> list) throws Exception {
		logger.info("SQL:"+sql);
		logger.info("params:"+Arrays.toString(list.toArray()));
		JSONObject jsonObj = new JSONObject();
		Connection conn = getConnectionFromPool();
		try {

			PreparedStatement stmt = null;
			ResultSet rs = null;
			stmt = conn.prepareStatement(sql);
			for (int i = 0; i < list.size(); i++) {
				stmt.setString(i+1, list.get(i));
			}
			rs = stmt.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			while (rs.next()) {
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = rs.getString(columnName);
					jsonObj.put(columnName, value);
				}
			}
			rs.close();
			stmt.close();
			release(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObj;
	}
	
	/**
	 * @param 多条查询(不带占位符)
	 * @param conn - 链接
	 * @param querySql - SQL语句
	 * @return json - 多条
	 */
	public static String queryApplyMore(String sql) throws Exception{
		logger.info("SQL:"+sql);
		JSONArray array = new JSONArray();
		Connection conn = getConnectionFromPool();
		try {
			PreparedStatement stmt = null;
			ResultSet rs = null;
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			while (rs.next()) {
				JSONObject jsonObj = new JSONObject();
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = rs.getString(columnName);
					jsonObj.put(columnName, value);
				}
				array.add(jsonObj);
			}
			rs.close();
			stmt.close();
			release(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return array.toString();
	}
	/**
	 * @param 多条查询(带占位符)
	 * @param conn - 链接
	 * @param querySql - SQL语句
	 * @return json - 多条
	 */
	public static String queryApplyMorePlace(String sql,List<String> list) throws Exception{
		logger.info("SQL:"+sql);
		logger.info("params:"+Arrays.toString(list.toArray()));
		JSONArray array = new JSONArray();
		Connection conn = getConnectionFromPool();
		try {
			PreparedStatement stmt = null;
			ResultSet rs = null;
			stmt = conn.prepareStatement(sql);
			for (int i = 0; i < list.size(); i++) {
				stmt.setString(i+1, list.get(i));
			}
			rs = stmt.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			while (rs.next()) {
				JSONObject jsonObj = new JSONObject();
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = rs.getString(columnName);
					jsonObj.put(columnName, value);
				}
				array.add(jsonObj);
			}
			rs.close();
			stmt.close();
			release(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return array.toString();
	}
	/**
	 * @param 查询结果 - 单条Map
	 * @param querySql - SQL语句
	 * @return map - 单条
	 */
	public static Map<String, String> queryApplySingleMap(String sql) throws Exception {
		logger.info("SQL:"+sql);
		Map<String, String> map = new HashMap<>();
		Connection conn = getConnectionFromPool();
		try {

			PreparedStatement stmt = null;
			ResultSet rs = null;
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			while (rs.next()) {
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = rs.getString(columnName);
					map.put(columnName, value);
				}
			}
			rs.close();
			stmt.close();
			release(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * @param 查询结果 - 单条Map(带占位符)
	 * @param querySql - SQL语句
	 * @return map - 单条
	 */
	public static Map<String, String> queryApplySingleMap( String sql,List<String> list) throws Exception {
		logger.info("SQL:"+sql);
		logger.info("params:"+Arrays.toString(list.toArray()));
		Map<String, String> map = new HashMap<>();
		Connection conn = getConnectionFromPool();
		try {

			PreparedStatement stmt = null;
			ResultSet rs = null;
			stmt = conn.prepareStatement(sql);
			for (int i = 0; i < list.size(); i++) {
				stmt.setString(i+1, list.get(i));
			}
			rs = stmt.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			while (rs.next()) {
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = rs.getString(columnName);
					map.put(columnName, value);
				}
			}
			rs.close();
			stmt.close();
			release(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * @param 多条查询Map(不带占位符)
	 * @param conn - 链接
	 * @param querySql - SQL语句
	 * @return map - 多条
	 */
	public static List<Map<String, String>> queryApplyMoreMap(String sql) throws Exception{
		logger.info("SQL:"+sql);
		Connection conn = getConnectionFromPool();
		List<Map<String, String>> list = new ArrayList<>();
		try {
			PreparedStatement stmt = null;
			ResultSet rs = null;
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			while (rs.next()) {
				Map<String, String> map = new HashMap<>();
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = rs.getString(columnName);
					map.put(columnName, value);
				}
				list.add(map);
			}
			rs.close();
			stmt.close();
			release(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
