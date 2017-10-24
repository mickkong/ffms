package com.finance.service;

import java.util.List;
import java.util.Map;

import com.finance.entity.Datadic;
/**
 * 数据字典Service接口
 * @author mickkong
 *
 */
public interface DatadicService {
	public List<Datadic> getDatadicIncome();
	
	public List<Datadic> getDatadicPay();
	
	public List<Datadic> getDatadicSecurity();
	
	public List<Datadic> getDatadicname();
	
	public List<Datadic> getDatadicTrade();
	
	/**
	 * 查询数据字典
	 * @param map
	 * @return
	 */
	public List<Datadic> findDatadic(Map<String,Object> map);
	
	/**
	 * 获取数据字典记录数
	 * @param map
	 * @return
	 */
	public Long getTotalDatadic(Map<String,Object> map);
	
	/**
	 * 更新数据字典
	 * @param datadic
	 * @return
	 */
	public int updateDatadic(Datadic datadic);
	
	/**
	 * 添加数据字典
	 * @param datadic
	 * @return
	 */
	public int addDatadic(Datadic datadic);
	
	/**
	 * 删除数据字典
	 * @param id
	 * @return
	 */
	public int deleteDatadic(Integer id);
}
