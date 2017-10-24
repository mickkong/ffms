package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.Income;


public interface IncomeDao {
	
	/**
	 * 查询收入
	 * @param map
	 * @return
	 */
	public List<Income> findIncome(Map<String,Object> map);
	
	/**
	 * 报表生成获得收入图表数据
	 * @param map
	 * @return
	 */
	public List<Income> getIncomeLine(Map<String,Object> map);
	
	/**
	 * 获取收入记录数
	 * @param map
	 * @return
	 */
	public Long getTotalIncome(Map<String,Object> map);
	
	/**
	 * 更新收入
	 * @param income
	 * @return
	 */
	public int updateIncome(Income  income);
	
	/**
	 * 添加收入
	 * @param income
	 * @return
	 */
	public int addIncome(Income  income);
	
	
	/**
	 * 删除收入
	 * @param id
	 * @return
	 */
	public int deleteIncome(Integer id);
	
	/**
	 * 获得所有收入人
	 * @return
	 */
	public List<Income> getIncomer();

}
