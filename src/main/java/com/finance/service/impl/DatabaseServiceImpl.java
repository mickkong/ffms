package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.finance.dao.DatabaseDao;
import com.finance.entity.Database;
import com.finance.service.DatabaseService;

/**
 * 数据库管理层的service实现类
 * @author mickkong
 *
 */
@Service("databaseService")
public class DatabaseServiceImpl implements DatabaseService{
	
	@Resource
	private DatabaseDao databaseDao;
	
	@Override
	public List<Database> findDataBack(Map<String, Object> map) {
		return databaseDao.findDataBack(map);
	}
	
	@Override
	public Long getDataBackTotal(Map<String, Object> map) {
		return databaseDao.getDataBackTotal(map);
	}

	@Override
	public int addDatabase(Database database) {
		return databaseDao.addDatabase(database);
	}
	
	@Override
	public int deleteDatabase(Integer id) {
		return databaseDao.deleteDatabase(id);
	}
	
	@Override
	public int truncateTable(@Param("tablename") String tablename){
		return databaseDao.truncateTable(tablename);
	}
	
	@Override
	public int deleteOrderdata(@Param("tablename") String tablename,@Param("startid") Integer startid,@Param("endid") Integer endid){
		return databaseDao.deleteOrderdata(tablename,startid,endid);
	}
}
