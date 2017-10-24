package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.PayDao;
import com.finance.entity.Pay;
import com.finance.service.PayService;
import com.finance.util.DateUtil;

/**
 * 支出Service实现类
 * 
 * @author mickkong
 */
@Service("payService")
public class PayServiceImpl implements PayService{
	@Resource
	private PayDao payDao;

	@Override
	public List<Pay> findPay(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return payDao.findPay(map);
	}
	
	@Override
	public List<Pay> getPayLine(Map<String,Object> map){
		return payDao.getPayLine(map);
	}

	@Override
	public long getTotalPay(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return payDao.getTotalPay(map);
	}

	@Override
	public int updatePay(Pay pay) {
		// TODO Auto-generated method stub
		pay.setUpdatetime(DateUtil.getCurrentDateStr());
		return payDao.updatePay(pay);
	}

	@Override
	public int addPay(Pay pay) {
		// TODO Auto-generated method stub
		pay.setCreatetime(DateUtil.getCurrentDateStr());;	
		return payDao.addPay(pay);
	}

	@Override
	public int deletePay(Integer id) {
		// TODO Auto-generated method stub
		return payDao.deletePay(id);
	}
	
	@Override
	public List<Pay> getPayer(){
		return payDao.getPayer();
	}

}
