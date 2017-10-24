package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.User;

/**
 * 用户Dao接口
 * @author mickkong
 *
 */
public interface UserDao {
	/**
	 * 用户登录，验证用户名
	 * @param user
	 * @return
	 */
	public User loginUsername(User user);
	
	/**
	 * 用户登录验证密码
	 * @param user
	 * @return
	 */
	public User loginPassword(User user);
	
	/**
	 * 用户登录验证角色
	 * @param user
	 * @return
	 */
	public User loginRolename(User user);
	
	/**
	 * 查询用户
	 * @param map
	 * @return
	 */
	public List<User> findUser(Map<String,Object> map);
	
	/**
	 * 获取用户记录数
	 * @param map
	 * @return
	 */
	public Long getTotalUser(Map<String,Object> map);
	
	/**
	 * 更新用户
	 * @param user
	 * @return
	 */
	public int updateUser(User user);
	
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	public int addUser(User user);
	
	/**
	 * 添加用户角色匹配
	 * @param user
	 * @return
	 */
	public int addUserRole(User user);
	
	/**
	 * 注册用户
	 * @param user
	 * @return
	 */
	public int addSign(User user);
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public int deleteUser(Integer id);
	
	/**
	 * 判断用户是否已经存在
	 * @param user
	 * @return  0：不存在  >已经存在
	 */
	public long getUserIsExists(User user);
	
	/**
	 * 从id获得用户信息
	 * @param id
	 * @return
	 */
	public User getUserById(Integer id);
	
	/**
	 * 获得所有用户
	 * @return
	 */
	public List<User> getAllUser(Map<String,Object> map);
}
