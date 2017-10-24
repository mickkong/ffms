package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.SharesDao;
import com.finance.entity.Shares;
import com.finance.service.SharesService;
import com.finance.util.DateUtil;

@Service("sharesService")
public class SharesServiceImpl implements SharesService{
	@Resource
	private SharesDao sharesDao;
	
	@Override
	public List<Shares> findShares(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sharesDao.findShares(map);
	}

	@Override
	public Long getTotalShares(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sharesDao.getTotalShares(map);
	}

	
	@Override
	public int addShares(Shares shares) {
		// TODO Auto-generated method stub
		shares.setCreatetime(DateUtil.getCurrentDateStr());
		return sharesDao.addShares(shares);
	}

	@Override
	public int updateShares(Shares shares) {
		// TODO Auto-generated method stub
		shares.setUpdatetime(DateUtil.getCurrentDateStr());
		return sharesDao.updateShares(shares);
	}

	@Override
	public int deleteShares(Integer id) {
		// TODO Auto-generated method stub
		return sharesDao.deleteShares(id);
	}

	@Override
	public List<Shares> getSharesName() {
		// TODO Auto-generated method stub
		return sharesDao.getSharesName();
	}

}
