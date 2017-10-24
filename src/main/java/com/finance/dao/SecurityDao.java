package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.Security;

public interface SecurityDao {
	/**
	 * 查询账户
	 * @param map
	 * @return
	 */
	public List<Security> findSecurity(Map<String,Object> map);
	
	/**
	 * 获取账户记录数
	 * @param map
	 * @return
	 */
	public Long getTotalSecurity(Map<String,Object> map);
	
	/**
	 * 更新账户
	 * @param security
	 * @return
	 */
	public int updateSecurity(Security security);
	
	/**
	 * 添加账户
	 * @param security
	 * @return
	 */
	public int addSecurity(Security security);
	
	
	/**
	 * 删除账户
	 * @param id
	 * @return
	 */
	public int deleteSecurity(Integer id);
	
	/**
	 * 获得所有用户
	 * @return
	 */
	public List<Security> getAllSecurity();

}
