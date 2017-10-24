package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.SecurityDao;
import com.finance.entity.Security;
import com.finance.service.SecurityService;
import com.finance.util.DateUtil;

/**
 * 收入Service实现类
 * 
 * @author mickkong
 */
@Service("securityService")
public class SecurityServiceImpl implements SecurityService{
	@Resource
	private SecurityDao securityDao;

	@Override
	public List<Security> findSecurity(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return securityDao.findSecurity(map);
	}

	@Override
	public Long getTotalSecurity(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return securityDao.getTotalSecurity(map);
	}

	@Override
	public int updateSecurity(Security security) {
		// TODO Auto-generated method stub
		security.setUpdatetime(DateUtil.getCurrentDateStr());
		return securityDao.updateSecurity(security);
	}

	@Override
	public int addSecurity(Security security) {
		// TODO Auto-generated method stub
		security.setCreatetime(DateUtil.getCurrentDateStr());
		return securityDao.addSecurity(security);
	}

	@Override
	public int deleteSecurity(Integer id) {
		// TODO Auto-generated method stub
		return securityDao.deleteSecurity(id);
	}

	@Override
	public List<Security> getAllSecurity() {
		// TODO Auto-generated method stub
		return securityDao.getAllSecurity();
	}

}
