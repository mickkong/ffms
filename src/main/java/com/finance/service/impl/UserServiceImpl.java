package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.UserDao;
import com.finance.entity.User;
import com.finance.service.UserService;
import com.finance.util.Base64Util;
import com.finance.util.DateUtil;

/**
 * 用户Service实现类
 * 
 * @author mickkong
 */
@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;

	@Override
	public User loginUsername(User user) {
		return userDao.loginUsername(user);
	}

	@Override
	public User loginPassword(User user) {
		user.setPassword(Base64Util.encode(user.getPassword(), "UTF-8"));
		return userDao.loginPassword(user);
	}

	@Override
	public User loginRolename(User user) {
		return userDao.loginRolename(user);
	}

	@Override
	public List<User> findUser(Map<String, Object> map) {
		return userDao.findUser(map);
	}

	@Override
	public int updateUser(User user) {
		user.setPassword(Base64Util.encode(user.getPassword(), "UTF-8"));
		user.setUpdatetime(DateUtil.getCurrentDateStr());
		return userDao.updateUser(user);
	}

	@Override
	public Long getTotalUser(Map<String, Object> map) {
		return userDao.getTotalUser(map);
	}

	@Override
	public int addUser(User user) {
		user.setPassword(Base64Util.encode(user.getPassword(), "UTF-8"));
		user.setCreatetime(DateUtil.getCurrentDateStr());
		return userDao.addUser(user);
	}

	@Override
	public int addUserRole(User user) {
		return userDao.addUserRole(user);
	}
	
	@Override
	public int addSign(User user) {
		user.setPassword(Base64Util.encode(user.getPassword(), "UTF-8"));
		user.setCreatetime(DateUtil.getCurrentDateStr());
		return userDao.addSign(user);
	}

	@Override
	public int deleteUser(Integer id) {
		return userDao.deleteUser(id);
	}

	@Override
	public long getUserIsExists(User user) {
		return userDao.getUserIsExists(user);
	}
	
	@Override
	public User getUserById(Integer id){
		return userDao.getUserById(id);
	}
	
	@Override
	public List<User> getAllUser(Map<String,Object> map){
		return userDao.getAllUser(map);
	}
}
