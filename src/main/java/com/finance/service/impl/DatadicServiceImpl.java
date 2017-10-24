package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.DatadicDao;
import com.finance.entity.Datadic;
import com.finance.service.DatadicService;
/**
 * 数据字典Service接口实现类
 * @author mickkong
 *
 */
@Service("datadicService")
public class DatadicServiceImpl implements DatadicService{
	@Resource
	private  DatadicDao datadicDao;

	@Override
	public List<Datadic> getDatadicIncome() {
		// TODO Auto-generated method stub
		return datadicDao.getDatadicIncome();
	}

	@Override
	public List<Datadic> getDatadicPay() {
		// TODO Auto-generated method stub
		return datadicDao.getDatadicPay();
	}

	@Override
	public List<Datadic> getDatadicSecurity() {
		// TODO Auto-generated method stub
		return datadicDao.getDatadicSecurity();
	}

	@Override
	public List<Datadic> findDatadic(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return datadicDao.findDatadic(map);
	}

	@Override
	public Long getTotalDatadic(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return datadicDao.getTotalDatadic(map);
	}

	@Override
	public int updateDatadic(Datadic datadic) {
		// TODO Auto-generated method stub
		return datadicDao.updateDatadic(datadic);
	}

	@Override
	public int addDatadic(Datadic datadic) {
		// TODO Auto-generated method stub
		return datadicDao.addDatadic(datadic);
	}

	@Override
	public int deleteDatadic(Integer id) {
		// TODO Auto-generated method stub
		return datadicDao.deleteDatadic(id);
	}
	
	public List<Datadic> getDatadicname(){
		return datadicDao.getDatadicname();
	}

	@Override
	public List<Datadic> getDatadicTrade() {
		// TODO Auto-generated method stub
		return datadicDao.getDatadicTrade();
	}
	
}
