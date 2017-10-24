package com.finance.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.finance.entity.Database;

/**
 * 数据库管理层的dao
 * @author mickkong
 *
 */

public interface DatabaseDao {
	/**
	 * 查询数据库备份记录
	 * @param map
	 * @return
	 */
	public List<Database> findDataBack(Map<String,Object> map);
	
	/**
	 * 获取数据库备份记录数
	 * @param map
	 * @return
	 */
	public Long getDataBackTotal(Map<String,Object> map);
	
	/**
	 * 添加数据库操作记录
	 * @param user
	 * @return
	 */
	public int addDatabase(Database database);
	
	/**
	 * 删除数据库操作记录
	 * @param id
	 * @return
	 */
	public int deleteDatabase(Integer id);
	
	/**
	 * 清空数据库
	 * @param
	 * @return
	 */
	public int truncateTable(@Param("tablename") String tablename);
	
	/**
	 * 数据库整理
	 * @param
	 * @return
	 */
	public int deleteOrderdata(@Param("tablename") String tablename,@Param("startid") Integer startid,@Param("endid") Integer endid);
}
