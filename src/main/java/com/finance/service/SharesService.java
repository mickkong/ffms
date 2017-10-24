package com.finance.service;

import java.util.List;
import java.util.Map;

import com.finance.entity.Shares;

public interface SharesService {
	/**
	 * 查询股票内容
	 * @param map
	 * @return
	 */
	public List<Shares> findShares(Map<String,Object> map);
	
	/**
	 * 获取股票记录数
	 * @param map
	 * @return
	 */
	public Long getTotalShares(Map<String,Object> map);
	
	/**
	 * 更新股票内容
	 * @param shares
	 * @return
	 */
	public int updateShares(Shares  shares);
	
	/**
	 * 添加股票
	 * @param income
	 * @return
	 */
	public int addShares(Shares  shares);
	
	
	/**
	 * 删除股票
	 * @param id
	 * @return
	 */
	public int deleteShares(Integer id);
	
	/**
	 * 获取股票名称
	 * @param map
	 * @return
	 */
	public List<Shares> getSharesName();
	
}
