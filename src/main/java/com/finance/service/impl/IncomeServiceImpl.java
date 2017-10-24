package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.IncomeDao;
import com.finance.entity.Income;
import com.finance.service.IncomeService;
import com.finance.util.DateUtil;

/**
 * 收入Service实现类
 * 
 * @author mickkong
 */
@Service("incomeService")
public class IncomeServiceImpl implements IncomeService{

	@Resource
	private IncomeDao incomeDao;
	
	@Override
	public List<Income> findIncome(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return incomeDao.findIncome(map);
	}
	
	@Override
	public List<Income> getIncomeLine(Map<String,Object> map){
		return incomeDao.getIncomeLine(map);
	}

	@Override
	public Long getTotalIncome(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return incomeDao.getTotalIncome(map);
	}

	
	@Override
	public int addIncome(Income income) {
		// TODO Auto-generated method stub
		income.setCreatetime(DateUtil.getCurrentDateStr());
		return incomeDao.addIncome(income);
	}

	@Override
	public int updateIncome(Income income) {
		// TODO Auto-generated method stub
		income.setUpdatetime(DateUtil.getCurrentDateStr());
		return incomeDao.updateIncome(income);
	}

	@Override
	public int deleteIncome(Integer id) {
		// TODO Auto-generated method stub
		return incomeDao.deleteIncome(id);
	}
	
	@Override
	public List<Income> getIncomer(){
		return incomeDao.getIncomer();
	}

}
